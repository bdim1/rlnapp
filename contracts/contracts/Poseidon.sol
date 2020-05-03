pragma solidity 0.6.4;


contract Poseidon {
	uint256 constant Q = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
	uint256 constant C0 = 21719995056369976813273776406226839690911634535575122873867308377265429755877;
	uint256 constant C1 = 8436900905732967280412008937807634879789124377864589587405698769102514171395;
	uint256 constant C2 = 3433288258620470705505288483276151770119999363590644102748941034043990487477;
	uint256 constant C3 = 13441677285692032227635474997523098295524095656972592325675371439063114780086;
	uint256 constant C4 = 4676643157791212187717744566469879267619784127615064595459529896763936766745;
	uint256 constant C5 = 12375981088707753718570066116689896540384329288224140830403044448087847003241;
	uint256 constant C6 = 8381943281756557378527887199592457300254396365334462134923652398794684634772;
	uint256 constant C7 = 5085139853996910082129043963924541564587679108554682061304006121807270930838;
	uint256 constant C8 = 276107851839298687662666140623265070796449718369692166129179955151412460078;
	uint256 constant C9 = 4401801354780363638120418216406421357334465784392356788003040244026652938651;
	uint256 constant C10 = 7645448855905220157077082148411109194077726893500893142282816348062454619941;
	uint256 constant C11 = 9061403290054284205063830669989925419541928746987242688389447681369449625954;
	uint256 constant C12 = 19735275846632700654974079612069899239318588699356282909020599552163819047614;
	uint256 constant C13 = 12912584064673883549146942372336991585335026808902572444360055490919539839498;
	uint256 constant C14 = 8667464849801255322335618284898774361197366664758946283998045535314045698539;
	uint256 constant C15 = 8069262738228337898217407155988741870521214548517311902838548962675153602275;
	uint256 constant C16 = 6187144414594754330070381050963962583638222957093506680455043234833779679977;
	uint256 constant C17 = 10344402008565629024182626961459877702198971265710485451029791467049454605787;
	uint256 constant C18 = 9868476498241729365194405712445730156228148533631658944325370204597428940229;
	uint256 constant C19 = 9847973283263006167020391184535090580853074318073578091668157927976525752104;
	uint256 constant C20 = 3123071145358990922405206701044616180814034805695847539211050723767563959467;
	uint256 constant C21 = 9633660219306412382833691091465751659459651120523295188948806775089623403649;
	uint256 constant C22 = 16111215968976353371160759144701627062093683803146883758697112523643537389104;
	uint256 constant C23 = 13894184851727192764722558968567414893938878362351424608038161078692976206527;
	uint256 constant C24 = 9822627723119090665998805819794946003735815478515939846295429287272068934416;
	uint256 constant C25 = 14717157988360978261057866837711582118165238673203030174622842496547367798323;
	uint256 constant C26 = 20959737954149857741944598979923765334437701309724169720804401056236913321260;
	uint256 constant C27 = 17713833817779483966809545334340582675710901823773587441894640575841328390795;
	uint256 constant C28 = 7610665087411500928439452410213058614449442724610723754797307237877160768683;
	uint256 constant C29 = 18744116176518562771401058448568394269552183506996337986708031337891084570211;
	uint256 constant C30 = 9584660469606917308079228977655290649588391477925507781124784255181805732530;
	uint256 constant C31 = 1926261499554096118476262673217064215319304853608733915752544839636876701759;
	uint256 constant C32 = 6692033602054107192663863635326511076062332835566277766560809821248275300224;
	uint256 constant C33 = 391244217270503229501052570700747011690985723801637460174448085029137439355;
	uint256 constant C34 = 19062218608006461306374762372585626870534245046010534780607836618688756550143;
	uint256 constant C35 = 15791829286977155908648288941840525353860286285763614604413985280811903964538;
	uint256 constant C36 = 1539155013578207764780716001332632221610193181825788031803881471909689634972;
	uint256 constant C37 = 301404859778589161944117690491780298044730063739549788265108361759947083452;
	uint256 constant C38 = 5628130732401702852323688386738147807200709752910914126397981129006989533729;
	uint256 constant C39 = 4117048963062420727186614030709148235427439208624897405417097732355221573854;
	uint256 constant C40 = 3025595852549364176079120221984541280352483348861515604835574835112645664028;
	uint256 constant C41 = 15812369365556097452082169124808182506120556281055693186647722696547299708869;
	uint256 constant C42 = 842825459591719293422161177595912730434526079090360108810580492449194965436;
	uint256 constant C43 = 8999214145599094488058186114491386380382932668478143174817591399217092765059;
	uint256 constant C44 = 15009795392062378839743100561111830180593728489984806934706934284535005583118;
	uint256 constant C45 = 13598540990738849082051856954144820723348458403287682985143787124822785327884;
	uint256 constant C46 = 10831483970636322982663364587960926229192504598247830984920011719107128374221;
	uint256 constant C47 = 1167150439129445488588807069234063874370379293858827993127851085222774008264;
	uint256 constant C48 = 12571368963642638341242129307593243786734785959401796009368689870784266951985;
	uint256 constant C49 = 19162774003771800603792091072743544463647110659474382538080084308207097018866;
	uint256 constant C50 = 7011815838932209786891160710279179305775888329050280137842796852888113469529;
	uint256 constant C51 = 21800607022837577555221149461453880235369095586863014480760513354978882668206;
	uint256 constant C52 = 3592189882018470779848229212778520299728716147676469883982283297406242781298;
	uint256 constant C53 = 10876201967003711076276706977500521486017879839836831393136721547710343185083;
	uint256 constant C54 = 19682113725620703797566567736536166652106105543708568001260788619362916769343;
	uint256 constant C55 = 10629398954078069956289765867261465253335031397343013416253887092440392604844;
	uint256 constant C56 = 13782048573564298781530118312271341256179778542156747573831394063471259479530;
	uint256 constant C57 = 10516826895084758230855315852939015443135596722090113678406034222988468662017;
	uint256 constant C58 = 2303430882441504996533558492734748167705143518851078079613749552287622774518;
	uint256 constant C59 = 6916609320555538370589452701503401338079482864966022770952523897913675748582;
	uint256 constant C60 = 5167709015528891114710104766414887620370620701026572771296195701288604739395;
	uint256 constant C61 = 491619838900787555123262062010131713986234879197836707256412120283228736535;
	uint256 constant C62 = 18053536490305315218894441033434572483777552795515608374234065566799380167856;
	uint256 constant M0 = 14274817654606507691954026740209912752089701250550831842764007598925257963008;
	uint256 constant M1 = 20984959993366476259803972958913627308483763530801892543242848631883559985662;
	uint256 constant M2 = 5053053665071210525734992761946151150730252285088720532065255931270344121520;
	uint256 constant M3 = 16332694211838034900887606855497319428357840093734886075204483499369492168975;
	uint256 constant M4 = 12031308280531253768427088674112184245330695525762705572145170021102516213829;
	uint256 constant M5 = 6910885506269987085411827276638293201992333038969196646362982202418867733899;
	uint256 constant M6 = 21733785988283385680483731506100514839175490481426315912356703701905860983002;
	uint256 constant M7 = 8035505944362678883123927669596953192245034756551050991168419470396922939314;
	uint256 constant M8 = 19019419967794005206416908676207087926441809392083846290084645190971458629864;

	function hash(uint256[2] memory input) internal pure returns (uint256 result) {
		assembly {
			let q := Q
			let pos := mload(0x40)
			mstore(pos, M0)
			mstore(add(pos, 32), M1)
			mstore(add(pos, 64), M2)
			mstore(add(pos, 96), M3)
			mstore(add(pos, 128), M4)
			mstore(add(pos, 160), M5)

			// mstore(add(pos, 192), M6)
			// mstore(add(pos, 224), M7)
			// mstore(add(pos, 256), M8)

			// use stack intensively
			let m5 := M5
			let m6 := M6
			let m7 := M7
			let m8 := M8

			let s0 := add(mload(input), C0)
			let s1 := add(mload(add(input, 32)), C0)
			let s2 := C0

			let t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C1
			let z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			let z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C2
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C3
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C4
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)

			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C5
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C6
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C7
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C8
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C9
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C10
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C11
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C12
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C13
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C14
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C15
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C16
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C17
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C18
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C19
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C20
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C21
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C22
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C23
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C24
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C25
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C26
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C27
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C28
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C29
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C30
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C31
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C32
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C33
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C34
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C35
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C36
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C37
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C38
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C39
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C40
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C41
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C42
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C43
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C44
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C45
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C46
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C47
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C48
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C49
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C50
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C51
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C52
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C53
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C54
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C55
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C56
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C57
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C58
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C59
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)

			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C60
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C61
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C62
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)

			result := s0
		}
	}
}
// identity
// 11c140edb3a166c1f0677f4918618dfe5fd1ee02217bdd0f0caccdc01f6c617;
