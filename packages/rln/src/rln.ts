import { RLNWasm } from 'rln-wasm-new';
import { Tree, Hasher } from '@rln/tree';
import { newPoseidonHasher, newKeccakHasher } from '@rln/tree';
import * as ethers from 'ethers';
import { stringify } from 'querystring';
import { FR, FP } from './ecc';
const assert = require('assert');

const poseidonHasher = newPoseidonHasher();
const FR_SIZE = 32;
const FP_SIZE = 32;
const G1_SIZE = FP_SIZE * 2;
const G2_SIZE = FP_SIZE * 4;

type Fr = any;

export interface ProofHex {
	a: string[];
	b: string[];
	c: string[];
}

export interface VerifyingKeyHex {
	alpha1: string[];
	beta2: string[];
	gamma2: string[];
	delta2: string[];
	ic: string[][];
}

export class RLNOut {
	public static new(rawProof: Uint8Array, root: Fr, epoch: Fr, x: Fr, y: Fr, nullifier: Fr): RLNOut {
		return new RLNOut(rawProof, root, epoch, x, y, nullifier);
	}

	public rawPublicInputs: Uint8Array;
	private constructor(public rawProof: Uint8Array, private _root: Fr, private _epoch: Fr, private _x: Fr, private _y: Fr, private _nullifier: Fr) {
		this.rawPublicInputs = Buffer.alloc(FR_SIZE * 5);
		FR.toRprLE(this.rawPublicInputs, 0 * FR_SIZE, _root);
		FR.toRprLE(this.rawPublicInputs, 1 * FR_SIZE, _epoch);
		FR.toRprLE(this.rawPublicInputs, 2 * FR_SIZE, _x);
		FR.toRprLE(this.rawPublicInputs, 3 * FR_SIZE, _y);
		FR.toRprLE(this.rawPublicInputs, 4 * FR_SIZE, _nullifier);
	}

	get nullifier(): string {
		return RLNUtils.frToHex(this._nullifier);
	}

	get root(): string {
		return RLNUtils.frToHex(this._root);
	}

	get epoch(): string {
		return RLNUtils.frToHex(this._epoch);
	}

	get x(): string {
		return RLNUtils.frToHex(this._x);
	}

	get y(): string {
		return RLNUtils.frToHex(this._y);
	}

	get publicInputs(): string[] {
		return [this.root, this.epoch, this.x, this.y, this.nullifier];
	}

	get proof(): ProofHex {
		const buf = Buffer.from(this.rawProof);
		const a = RLNUtils.g1ToHex(buf, 0);
		const b = RLNUtils.g2ToHex(buf, G1_SIZE);
		const c = RLNUtils.g1ToHex(buf, G1_SIZE + G2_SIZE);
		return { a, b, c };
	}
}

export class RLNUtils {
	public static rawVerifyingKeyToSol(rawVk: Uint8Array): VerifyingKeyHex {
		const buf = Buffer.from(rawVk);
		const alpha1 = this.g1ToHex(buf, 0);
		// skip beta1
		const beta2 = this.g2ToHex(buf, 2 * G1_SIZE);
		const gamma2 = this.g2ToHex(buf, 2 * G1_SIZE + G2_SIZE);
		// skip delta1
		const delta2 = this.g2ToHex(buf, 3 * G1_SIZE + 2 * G2_SIZE);

		let off = 3 * G1_SIZE + 3 * G2_SIZE;
		const icLen = buf.readUInt32BE(off);
		off = off + 4;
		const remainingLen = rawVk.length - off;
		assert(remainingLen == icLen * G1_SIZE);

		let ic: string[][] = [];
		for (let i = 0; i < icLen; i++) {
			ic.push(this.g1ToHex(buf, off + i * G1_SIZE));
		}

		return {
			alpha1,
			beta2,
			gamma2,
			delta2,
			ic
		};
	}

	static frToHex(e: Fr): string {
		const buf = Buffer.alloc(FR_SIZE);
		FR.toRprBE(buf, 0, e);
		return '0x' + buf.toString('hex');
	}

	static fpToHex(e: Fr): string {
		const buf = Buffer.alloc(FP_SIZE);
		FP.toRprBE(buf, 0, e);
		return '0x' + buf.toString('hex');
	}

	static g1ToHex(data: Buffer, o: number): string[] {
		const x = '0x' + data.toString('hex', o, o + FP_SIZE);
		const y = '0x' + data.toString('hex', o + FP_SIZE, o + 2 * FP_SIZE);
		return [x, y];
	}

	static g2ToHex(data: Buffer, o: number): string[] {
		const x0 = '0x' + data.toString('hex', o, o + FP_SIZE);
		const x1 = '0x' + data.toString('hex', o + 1 * FP_SIZE, o + 2 * FP_SIZE);
		const y0 = '0x' + data.toString('hex', o + 2 * FP_SIZE, o + 3 * FP_SIZE);
		const y1 = '0x' + data.toString('hex', o + 3 * FP_SIZE, o + 4 * FP_SIZE);
		return [x0, x1, y0, y1];
	}

	// use only for testing purposes
	public static newKeyPair(): { priv: string; pub: string } {
		const priv = '0x' + FR.random().toString(16);
		const pub = poseidonHasher.hash(priv);
		return { priv, pub };
	}
}

export class RLN {
	private _logTime = false;
	static new(depth: number): RLN {
		console.time('circuit_init');
		const circuit = RLNWasm.new(depth);
		console.timeEnd('circuit_init');
		return new RLN(circuit);
	}

	static restore(depth: number, params: Uint8Array): RLN {
		const circuit = RLNWasm.new_with_raw_params(depth, params);
		return new RLN(circuit);
	}

	private constructor(private circuit: RLNWasm) {}

	public logTime(d: boolean) {
		this._logTime = d;
	}

	public verifyingKey(): Uint8Array {
		return this.circuit.export_verifier_key();
	}

	public verify(proof: Uint8Array, inputs: Uint8Array): boolean {
		return this.circuit.verify(proof, inputs);
	}

	public generate(tree: Tree, epoch: number, signal: string, key: string, memberIndex: number): RLNOut {
		// signal
		const signalHash1 = ethers.utils.solidityKeccak256(['string'], [signal]);

		// TODO: we likely to change hash to field
		const x = FR.e(signalHash1);

		const a0 = FR.e(key);
		const _epoch = FR.e(epoch);
		const a1 = FR.e(poseidonHasher.hash2(a0, _epoch));
		const y = FR.add(FR.mul(x, a1), a0);

		const nullifier = FR.e(poseidonHasher.hash(a1));

		// membership
		assert(poseidonHasher.hash(key) == tree.getLeaf(memberIndex));

		const witness = tree.witness(memberIndex);
		const witnessLength = witness.nodes.length;
		let serializedAuthPath = Buffer.alloc(1 + witnessLength * (FR_SIZE + 1));
		const buf = Buffer.alloc(FR_SIZE);
		serializedAuthPath.writeUInt8(witnessLength);
		let path = witness.index;
		for (let i = 0; i < witnessLength; i++) {
			const offsetDirection = 1 + i * (FR_SIZE + 1);
			serializedAuthPath.writeUInt8((path & 1) == 1 ? 0x00 : 0x01, offsetDirection);
			FR.toRprLE(buf, 0, FR.e(witness.nodes[i]));
			const offsetNode = offsetDirection + 1;
			buf.copy(serializedAuthPath, offsetNode);
			path >>= 1;
		}

		// RLN inputs
		// share_x, share_y, epoch, nullifier, root, key, auth_path

		const pathLength = serializedAuthPath.byteLength;
		const input = Buffer.alloc(FR_SIZE * 6 + pathLength + 1);

		const _root = FR.e(tree.root);

		FR.toRprLE(input, 0 * FR_SIZE, x);
		FR.toRprLE(input, 1 * FR_SIZE, y);
		FR.toRprLE(input, 2 * FR_SIZE, _epoch);
		FR.toRprLE(input, 3 * FR_SIZE, nullifier);
		FR.toRprLE(input, 4 * FR_SIZE, _root);
		FR.toRprLE(input, 5 * FR_SIZE, a0);


		serializedAuthPath.copy(input, 6 * FR_SIZE);

		if (this._logTime) {
			console.time('prover');
		}


		const proof = this.circuit.generate_proof(input);
		if (this._logTime) {
			console.timeEnd('prover');
		}

		return RLNOut.new(proof, _root, _epoch, x, y, nullifier);
	}
}
