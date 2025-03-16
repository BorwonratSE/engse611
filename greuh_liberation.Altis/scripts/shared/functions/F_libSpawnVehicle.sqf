params [
	"_sectorpos",
	"_classname",
	[ "_precise_position", false ],
	[ "_random_rotate", true ]
];

diag_log format [ "Spawning vehicle %1 at %2", _classname , time ];

private _newvehicle = objNull;
private _spawnpos = zeropos;
private _grp = grpNull;
private _artvehicle = objNull;

if ( _precise_position ) then {
	_spawnpos = [] + _sectorpos;
} else {
	while { _spawnpos distance zeropos < 1000 } do {
		_spawnpos = ( [ _sectorpos, random 150, random 360 ] call bis_fnc_relpos ) findEmptyPosition [10, 100, 'B_Heli_Transport_01_F'];
		if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
	};
};

_newvehicle = objNull;
if ( (_classname in opfor_choppers) || (_classname in opfor_air) ) then {
	_newvehicle = createVehicle [_classname, _spawnpos, [], 0, "FLY"];
	_newvehicle flyInHeight (300 + (random 800));
} else {
	_newvehicle = _classname createVehicle _spawnpos;
	_newvehicle setpos _spawnpos;
};
_newvehicle removeMagazines "magazine_Fighter02_Gun30mm_AA_x180";
_newvehicle setPylonLoadOut [5, "PylonMissile_Missile_AGM_KH25_INT_x1", true];
_newvehicle setPylonLoadOut [6, "PylonMissile_Missile_AGM_KH25_INT_x1", true];
_newvehicle setPylonLoadOut [13, "PylonMissile_Missile_KH58_INT_x1", true];
_newvehicle setPylonLoadOut [1, "PylonRack_1Rnd_Missile_AGM_01_F", true];
_newvehicle setPylonLoadOut [2, "PylonRack_1Rnd_Missile_AA_03_F", true];
_newvehicle setPylonLoadOut [3, "PylonRack_1Rnd_Missile_AA_03_F", true];
_newvehicle setVehicleRadar 1;
_newvehicle addEventHandler ["incomingMissile", {
	private ["_vehicle", "_missile"];
	_vehicle = _this select 0;
	_missile = _this select 1;
	_vehicle forceWeaponFire ["CMFlareLauncher", "Burst"];
	_newvehicle addEventHandler ["incomingMissile", [_newvehicle] call Flareloop];
}];
_newvehicle allowdamage false;


clearWeaponCargoGlobal _newvehicle;
clearMagazineCargoGlobal _newvehicle;
clearItemCargoGlobal _newvehicle;
clearBackpackCargoGlobal _newvehicle;

if ( _classname in militia_vehicles ) then {
	[ _newvehicle ] call F_libSpawnMilitiaCrew;
} else {
	_grp = createGroup [GRLIB_side_enemy, true]; //TODO test
	createVehicleCrew _newvehicle;
	(crew _newvehicle) joinSilent _grp;

	sleep 0.1;
	{ _x addMPEventHandler ['MPKilled', {_this spawn kill_manager}]; } foreach (crew _newvehicle);
};

_newvehicle addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
if ( _random_rotate ) then {
	_newvehicle setdir (random 360);
};
_newvehicle setVectorUp surfaceNormal position _newvehicle;

if ( (_classname in opfor_choppers) || (_classname in opfor_air) ) then {
	_newvehicle setVelocity [100 * (sin (getdir _newvehicle)), 100 * (cos (getdir _newvehicle)), 1];
};

sleep 0.1;
_newvehicle allowdamage true;
_newvehicle setdamage 0;

diag_log format [ "Done Spawning vehicle %1 at %2", _classname , time ];



_newvehicle

