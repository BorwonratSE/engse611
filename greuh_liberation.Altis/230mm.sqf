fnc_230mm = 
{
    private _target = laserTarget vehicle cameraOn;

    if (isNull _target) then {
        hint "No laser target detected.";
    } else {
        private _lastFireTime_230 = uiNamespace getVariable ["_lastFireTime_230", 0];
        private _currentTime = diag_tickTime;
        private _cooldown_230 = 240; // Cooldown duration in seconds

        if (_currentTime - _lastFireTime_230 < _cooldown_230) exitWith { 
            hint (format ["Please wait %1 more seconds.", (round (_cooldown_230 - (_currentTime - _lastFireTime_230)))]); 
        }; 
        uiNamespace setVariable ["_lastFireTime_230", _currentTime]; 

        _startSpeed = param [0, 800, [999]]; // Adjusted to 500 km/h
        _direction = param [1, 180, [999]];
        _distanceFromLaser = param [2, 1000, [999]]; // Distance from the laser target
        _height = param [3, 2000, [999]]; // Adjusted to 2000 meters
        _radiusSearch = param [6, 100, [999]]; // Radius for randomization
        _testing = param [7, false, [true, false]];

        _laserPos = getPosASL _target;

        // Loop for 5 missiles with 1 second interval between each
        for "_i" from 1 to 15 do {
            // Generate random offset for each missile
            private _randomOffsetX = (random _radiusSearch) - (_radiusSearch / 2);
            private _randomOffsetY = (random _radiusSearch) - (_radiusSearch / 2);

            // Calculate the start position with randomization
            private _startPos = [
                (_laserPos select 0) + (_distanceFromLaser * sin _direction) + _randomOffsetX,
                (_laserPos select 1) + (_distanceFromLaser * cos _direction) + _randomOffsetY,
                (_laserPos select 2) + _height
            ];

            hint format ["Missile %1 Inbound", _i];

            // Create and fire the missile
            private _missile = "R_230mm_HE" createVehicle _startPos;
            _missile setVelocityModelSpace [_startSpeed, 0, 0];

            // Track missile flight
            while {alive _missile} do {
                private _missilePos = getPosASL _missile;
                private _targetPos = getPosASL _target;

                private _directionVector = _missilePos vectorFromTo _targetPos;
                private _velocity = _directionVector vectorMultiply _startSpeed;

                _missile setVelocity _velocity;

                // Adjust missile orientation
                private _upVector = [0,0,1]; // Up direction is along the Z-axis
                _missile setVectorDirAndUp [_directionVector, _upVector];

                if (_missile distance _target < 5) then {
                    _missile setDamage 1; // Cause damage to the missile itself
                    breakOut "hit";
                };

                sleep 0.01;
            };

            // Wait 1 second before launching the next missile
            sleep 1; 
        };
    };
};
