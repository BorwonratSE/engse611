/*
	Author: Daniel13579

	Title:
	Rapid Lightning

	Description:
	Spawns random lightning around the player/object

	Showcase scenario:
	https://steamcommunity.com/sharedfiles/filedetails/?id=2570627497

	How to use the script:
	Put the lightning sqf file in the mission folder.
	Put the execution line underneath in the trigger activation field:
	
	startLightning = 1; null = [A, B, C, D] execVM "Lightning.sqf";

	A is the maximum distance each lightning can spawn from the given position. 
	The distance ranges from 0 meters to the number you supply.

	B is the base number of seconds before a new lightning can be spawned.

	C is the maximum amount of more seconds randomly added to this delay.

	D is the object the lightning will be centered around. The player for example.

	startLightning = 1; will start the lightning 
	startLightning = 0; will stop the lightning
	
	Example:
	startLightning = 1; null = [12000, 3, 6, player] execVM "Lightning.sqf"; 	
*/

// organize our arguments
_lightningDist = _this select 0;
_delay = _this select 1;
_delayRandom = _this select 2;
_lightningPos = _this select 3;
 
// create loop for spawning lightning
while { startLightning == 1 } do
{

	_randomLightningDist = (random _lightningDist);
	_dir = (random 360);
	_number1 = (random 100);
	_number2 = (random 100);
	_zH1 = 250;
	_zH2 = (random 50);

	// make a perimeter around the player/object
	if (_randomLightningDist <= 50) then { _randomLightningDist = 50 };

	private _pos = [_lightningPos, _randomLightningDist, _dir] call BIS_fnc_relPos;

	_light = "#lightpoint" createvehiclelocal _pos;
	if (_number1 <= _number2) then {
	_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + _zH1 + _zH2 + 10];
	} else {
	_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
	};
	_light setLightDayLight true;
	_light setLightBrightness 300;
	_light setLightAmbient [0.05, 0.05, 0.1];
	_light setlightcolor [1, 1, 2];

	sleep 0.1;
	_light setLightBrightness 0;
	sleep (random 0.1);
	
	private _class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
	private _lightning = _class createvehiclelocal [100,100,100];
	_lightning setdir _dir;

	if (_number1 <= _number2) then { 
	_y = (random 360); 
	_p = (random 360);
	_r = (90 - random 25 + random 25);
	_lightning setVectorDirAndUp [
		[sin _y * cos _p, cos _y * cos _p, sin _p],
		[[sin _r, -sin _p, cos _r * cos _p], -_y] call BIS_fnc_rotateVector2D
	];
	_lightning setposATL [_pos select 0,_pos select 1,(_pos select 2) + _zH1 + _zH2];
	} else {
	_lightning setpos _pos;
	};

	// distance between player and lightning
	private _meters = player distance _lightning;

	// thunder sounds
	[_lightning, _meters] spawn {

		params ["_lightning", "_meters"];

		// very close thunder sounds
		if (_meters <= 600) then { 
		
		// select random thunder sound
		_randomThunderSound = selectRandom ["A3\Sounds_F_Exp\environment\elements\thunders\thunder_heavy_3.wss",
		"A3\Sounds_F_Exp\environment\elements\thunders\thunder_heavy_4.wss","A3\Sounds_F_Exp\environment\elements\thunders\thunder_heavy_5.wss"];
		
		// play sound	
		playSound3D [_randomThunderSound, _lightning, false, getPosASL _lightning, 5, 1, 20000];

		};
		
		// close thunder sounds 
		if (600 < _meters && _meters <= 1200) then {

		// select random thunder sound
		_randomThunderSound = selectRandom ["A3\Sounds_F_Exp\environment\elements\thunders\thunder_heavy_1.wss"];


		// play sound	
		playSound3D [_randomThunderSound, _lightning, false, getPosASL _lightning, 5, 1, 20000];

		}; 

		// distant thunder sounds 
		if (1200 < _meters && _meters <= 6000) then {

		// select random thunder sound
		_randomThunderSound = selectRandom ["A3\Sounds_F_Exp\environment\elements\thunders\thunder_norm_2.wss","A3\sounds_F\ambient\thunder\thunder_01.wss"];

		// play sound	
		playSound3D [_randomThunderSound, _lightning, false, getPosASL _lightning, 5, 1, 20000];

		}; 

		// very distant thunder sounds
		if (_meters > 6000) then {

		// select random thunder sound
		_randomThunderSound = selectRandom ["A3\Sounds_F_Exp\environment\elements\thunders\thunder_norm_1.wss",
		"A3\Sounds_F_Exp\environment\elements\thunders\thunder_norm_2.wss","A3\Sounds_F_Exp\environment\elements\thunders\thunder_norm_3.wss",
		"A3\Sounds_F_Exp\environment\elements\thunders\thunder_norm_4.wss","A3\Sounds_F_Exp\environment\elements\thunders\thunder_norm_5.wss"];

		// play sound	
		playSound3D [_randomThunderSound, _lightning, false, getPosASL _lightning, 5, 1, 20000];

		};
	
	};
	
	_duration = (3 + random 1);
	for "_i" from 0 to _duration do {
		_time = time + 0.1;
		_light setLightBrightness (100 + random 100);
		waituntil {time > _time};
	};

	deletevehicle _lightning;
	deletevehicle _light;

	// disable engine lightnings
	0 setlightnings 0;

	// delay plus random delay
	sleep (_delay + random _delayRandom);
	
};
