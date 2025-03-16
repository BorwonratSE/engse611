
    /*fnc_CruiseMissile =
    { 
    // Define the player and UAV variables
    _player = uav1; // This variable represents the player unit. You can replace 'player' with a specific unit name like 'unit1'.
    _uav = VLS; // This variable represents the UAV unit. Replace 'uav1' with the actual name of your UAV.
    
    // Function to force connect the player to the UAV
    forceConnectUAV = {
        params ["_player", "_uav"]; // The function expects two parameters: the player unit and the UAV unit.
    
        // Connect the terminal to the UAV first
        _player connectTerminalToUAV _uav;
    
        // Assign and connect the player to the UAV
        _uav assignAsDriver _player; // Assigns the player as the driver of the UAV.
        _player moveInDriver _uav; // Moves the player into the driver's position of the UAV.
    
        // Ensure the player is connected to the UAV terminal
        createVehicleCrew _uav; // Creates AI crew for the UAV if needed.
        _uav action ["SwitchToUAVDriver", _player]; // Connects the player to the UAV terminal.
    };
    
    // Execute the function
    [_player, _uav] call forceConnectUAV; // Calls the function with the player and UAV as arguments.
    
};



while {true} do {
    
    VLS setVehicleAmmo 1;
    
    sleep 900;
};*/
fnc_CruiseMissile = 
{
    private _target = laserTarget vehicle cameraOn;

    if (isNull _target) then {
        hint "No laser target detected.";
    } else {
        private _lastFireTime = uiNamespace getVariable ["lastFireTime", 0];
        private _currentTime = diag_tickTime;
        private _cooldown = 25; // Cooldown duration in seconds

        if (_currentTime - _lastFireTime < _cooldown) exitWith { 
            hint (format ["Please wait %1 more seconds.", (round (_cooldown - (_currentTime - _lastFireTime)))]); 
        }; 
        uiNamespace setVariable ["lastFireTime", _currentTime]; 

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

        _missile = "ammo_Missile_Cruise_01" createVehicle _startPos;
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
