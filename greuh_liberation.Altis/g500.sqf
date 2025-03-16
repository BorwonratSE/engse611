fnc_g500 =
{
    private _target = laserTarget vehicle cameraOn;

    if (isNull _target) then {
        hint "No laser target detected.";
    } else {
        private _lastFireTime_g500 = uiNamespace getVariable ["_lastFireTime_g500", 0];
        private _currentTime = diag_tickTime;
        private _cooldown_g = 15; // Cooldown duration in seconds

        if (_currentTime - _lastFireTime_g500 < _cooldown_g) exitWith { 
            hint (format ["Please wait %1 more seconds.", (round (_cooldown_g - (_currentTime - _lastFireTime_g500)))]); 
        }; 
        uiNamespace setVariable ["_lastFireTime_g500", _currentTime]; 

        _startSpeed = param [0, 800, [999]]; // Speed in m/s
        _direction = param [1, 180, [999]]; // Direction in radians
        _distanceFromLaser = param [2, 1000, [999]]; // Distance from the laser target
        _height = param [3, 2000, [999]]; // Height in meters
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

        hint "Bomb Away! Take Cover.";
        sleep 2; // Wait for 2 seconds before releasing the bomb

        // Create the missile
        _missile = "Bomb_04_F" createVehicle _startPos; // Check that "Bomb_04_F" exists

        _missile setVelocityModelSpace [_startSpeed, 0, 0];

        while {alive _missile} do {
            _missilePos = getPosASL _missile;
            _targetPos = getPosASL _target;

            // Calculate direction and set velocity
            _direction = _missilePos vectorFromTo _targetPos;
            _velocity = _direction vectorMultiply _startSpeed;

            _missile setVelocity _velocity;

            // Adjust missile orientation
            private _upVector = [0, 0, 1]; // Up direction is along the Z-axis
            _missile setVectorDirAndUp [_direction, _upVector];

            // Check for proximity to target
            if (_missile distance _target < 5) then {
                _missile setDamage 1; // Cause damage to the missile itself
                breakOut "hit"; // Break the loop when hitting the target
            };

            sleep 0.01; // Adjust sleep as necessary for performance
        };
    };
};
