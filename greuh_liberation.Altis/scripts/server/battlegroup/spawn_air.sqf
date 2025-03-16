// Function to deploy countermeasures (e.g., flares)
fnc_DeployCountermeasures = {
    _unit = _this;

    // Check if the unit has a flare launcher
    private _flareLauncher = "CMFlareLauncher";
    private _flareMagazine = "240Rnd_CMFlareMagazine";

    // Ensure the unit is in the air
    if (vehicle _unit isKindOf "Aircraft") then {
        // Check if the unit has the flare launcher weapon
        if (_unit hasWeapon _flareLauncher) then {
            // Load the flare magazine into the launcher
            _unit addMagazine _flareMagazine;

            // Force fire the flare launcher
            _unit forceWeaponFire [_flareLauncher, _flareMagazine];
        };
    };
};

// Function to perform evasive maneuvers
fnc_PerformEvasiveManeuvers = {
    _unit = _this;
    // Perform evasive maneuvers (replace with your logic)
    _unit flyInHeight (getPosASL _unit select 2 + 1000);
    _unit setVelocity [(random 200) - 100, (random 200) - 100, 0];
};

// Main script for spawning enemy aircraft and setting waypoints
_planes_number = 0;
_first_objective = _this select 0;

if (combat_readiness >= 20) then { _planes_number = 4 };
_plane_type = selectRandom opfor_air;
_air_spawnpoint = ( [ sectors_airspawn , [ _first_objective ] , { (markerPos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
_air_grp = createGroup GRLIB_side_enemy;

for [{_idx = 0}, {_idx < _planes_number}, {_idx = _idx + 1}] do {
    _air_spawnpos = markerPos _air_spawnpoint;
    _air_spawnpos = [(((_air_spawnpos select 0) + 500) - random 1000), (( (_air_spawnpos select 1) + 500) - random 1000), 120];
    _newvehicle = createVehicle [_plane_type, _air_spawnpos, [], 0, "FLY"];
    _newvehicle flyInHeight (800 + (random 1500));
    _newvehicle setVelocity [100 * (sin (getDir _newvehicle)), 100 * (cos (getDir _newvehicle)), 1];
    _newvehicle setVelocityModelSpace [0, 200, 0];
    createVehicleCrew _newvehicle;
    _newvehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
    { _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _newvehicle);

    (crew _newvehicle) joinSilent _air_grp;

    _newvehicle removeMagazines "magazine_Fighter02_Gun30mm_AA_x180";
    _newvehicle setPylonLoadOut [5, "PylonMissile_Missile_AGM_KH25_INT_x1", true];
    _newvehicle setPylonLoadOut [6, "PylonMissile_Missile_AGM_KH25_INT_x1", true];
    _newvehicle setPylonLoadOut [13, "PylonMissile_Missile_KH58_INT_x1", true];
    _newvehicle setVehicleRadar 1;

    // Add event handler for incoming missiles
    _newvehicle addEventHandler ["IncomingMissile", {
        _this call fnc_DeployCountermeasures;
        _this call fnc_PerformEvasiveManeuvers;
    }];
};

while {(count (waypoints _air_grp)) != 0} do {deleteWaypoint ((waypoints _air_grp) select 0);};
{_x doFollow leader _air_grp} foreach units _air_grp;
sleep 1;

private _waypoint = _air_grp addWaypoint [_first_objective, 2000];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _air_grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [_first_objective, 1000];
_waypoint setWaypointType "SAD";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "RED";

for "_i" from 1 to 6 do {
    _waypoint = _air_grp addWaypoint [_first_objective, 500];
    _waypoint setWaypointType "SAD";
};

while {sleep 5; {(alive _x)} count (units _air_grp) > 0 } do {
    {
        private _unit = _x;
        if (alive _unit && vehicle _unit == _unit) then {
            private _sectors = (sectors_allSectors - blufor_sectors);
            if (_side == GRLIB_side_friendly) then {_sectors = blufor_sectors};
            private _nearest_sector = [_sectors, _unit] call F_nearestPosition;

            if (typeName _nearest_sector == "STRING") then {
                private _flee_grp = createGroup [_side, true];
                [_unit] joinSilent _flee_grp;

                while {(count (waypoints _flee_grp)) != 0} do {deleteWaypoint ((waypoints _flee_grp) select 0);};
                {_x doFollow leader _flee_grp} foreach units _flee_grp;

                _waypoint = _flee_grp addWaypoint [markerPos _nearest_sector, 0];
                _waypoint setWaypointType "MOVE";
                _waypoint setWaypointSpeed "FULL";
                _waypoint setWaypointBehaviour "SAFE";
                _waypoint setWaypointCombatMode "GREEN";
                _waypoint setWaypointCompletionRadius 50;

                _waypoint = _flee_grp addWaypoint [markerPos _nearest_sector, 0];
                _waypoint setWaypointType "MOVE";
                _waypoint setWaypointCompletionRadius 50;
                _waypoint setWaypointStatements ["true", "deleteVehicle this"];
                sleep 10;
            } else {
                sleep 60;
                { deleteVehicle _x } forEach _flee_grp;
            };
        };
    } foreach units _air_grp;
};
