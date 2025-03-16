fnc_ClusterMissile =
{
    private _target = laserTarget vehicle cameraOn;

    if (isNull _target) then {
        hint "No laser target detected.";
    } else {
        private _lastFireTime_cluster = uiNamespace getVariable ["_lastFireTime_cluster", 0];
        private _currentTime = diag_tickTime;
        private _cooldown_cluster = 25; // Cooldown duration in seconds

        if (_currentTime - _lastFireTime_cluster < _cooldown_cluster) exitWith { 
            hint (format ["Please wait %1 more seconds.", (round (_cooldown_cluster - (_currentTime - _lastFireTime_cluster)))]); 
        }; 
        uiNamespace setVariable ["_lastFireTime_cluster", _currentTime]; 

        _startSpeed = param [0, 800, [999]]; // Adjusted to 500 km/h
        _direction = param [1, 180, [999]];
        _distanceFromLaser = param [2, 1000, [999]]; // Distance from the laser target
        _height = param [3, 2000, [999]]; // Adjusted to 2000 meters
        _distance = param [4, 1200, [999]];
        _restriction = param [5, false];
        _radiusSearch = param [6, 100, [999]];
        _testing = param [7, false, [true, false]];

        _laserPos = getPosASL _target;
        _startPos = [
            (_laserPos select 0) + (_distanceFromLaser * sin _direction),
            (_laserPos select 1) + (_distanceFromLaser * cos _direction),
            (_laserPos select 2) + _height
        ];

        
        hint "Missile Inbound";

        _missile = "ammo_Missile_Cruise_01_Cluster" createVehicle _startPos;
        _missile setVelocityModelSpace [_startSpeed, 0, 0];

        while {alive _missile} do {
            _missilePos = getPosASL _missile;
            _targetPos = getPosASL _target;

            _direction = _missilePos vectorFromTo _targetPos;
            _velocity = _direction vectorMultiply _startSpeed;

            _missile setVelocity _velocity;

            // Adjust missile orientation
            _upVector = [0,0,1]; // Up direction is along the Z-axis
            _missile setVectorDirAndUp [_direction, _upVector];

            if (_missile distance _target < 5) then {
                _missile setDamage 1; // Cause damage to the missile itself
                breakOut "hit";
            };

            sleep 0.01;
        };

    }
}





