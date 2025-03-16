_missilePos = _this select 1;
_missileDir = getDir _missile;

{
	_vehicle = _x;
	_vehiclePos = getPosATL _vehicle;
	_vehicleDir = getDir _vehicle;
	_missileDist = _vehiclePos distance _missilePos;
	_missileAngle = abs (_missileDir - _vehicleDir);

	if (_missileDist < 1000 && _missileAngle < 90) then {
		_vehicle addMagazine "FlareLauncher";
		sleep 3;
		_vehicle removeMagazine "FlareLauncher";
	};
} forEach crew _newvehicle;
