fnc_uav =
{ /*if (diag_tickTime < (uiNamespace getVariable ['tag_cooldown',-1])) exitWith { 
   hint (format ['Please wait %1 more seconds.',(round ((uiNamespace getVariable ['tag_cooldown',-1]) - diag_tickTime))]); 
  }; 
  _cooldown = 15;  // cooldown duration in seconds 
  uiNamespace setVariable ['tag_cooldown',(diag_tickTime + _cooldown)]; 
 
 
 /*

    Author: Dankan37
    Function: This will call in a cruise missile where the player is watching, cruise missile has a 5+ meters miss radius, this is because of a simple math operation, I will update it soon.

    USAGE:
    Params:
    [speed, direction, height, distance, restriction] spawn Dan_fnc_CruiseMissile / or ExecVM "fn_cruiseMissile.sqf";

    -speed is the missile starting speed.
    -direction is the where the missile is gonna come from.
    -height is traver altitude ASL.
    -distance is how far away the missile will spawn.
    -restriction is used if you want the missile only to target objects (cars, apcs, men)...
    -radius is search radius from watched point.

    They are optional, as the missile has already some set up, in order to make it work under the best enviroment.


    TODO:
    Heigh following missile: Missile will follow a determined altitude, ie: fly over a mountain and then lower down.
    AI will target missile: Nearby AA assets will shoot the missile down if possible.
    Seeking missile: The missile will seek the target, and will track moving ones.
    Camera: Missile camera to see where it's going.
    Better missile math: Improve the math, in order to increase accuracy.
    Correct typos.


    NOTE: You may reuse this script in any of your missions or server, you may tweak this as you please and there's no need to credit me, as long as you don't claim it as yours.
*/


/*_startSpeed = param [0, 400, [999]];
_direction = param [1, 270, [999]];
_height = param [2, 500, [999]];
_distance = param [3, 5000, [999]];
_restriction = param [4, false];
_radiusSearch = param [1,1,[999]];
_testing = param [6,false];

//Setting up ASL mode
flyMode = "ASL";
_wPos = nil;


playSound3D ["A3\dubbing_f\modules\supports\artillery_request.ogg", player]; 
//Detecting if player has laser
_laser = laserTarget vehicle cameraOn;
if(isNull _laser) then
{
    _wPos = screenToWorld [0.5,0.5];
}
else
{
    _wPos = _laser;
};

selPos = createAgent ["Logic", _wPos, [], 0, "FORM"];
_target = objNull;

if (!_restriction && isNull _laser) then
    {
    _nearObj = nearestObjects [selPos, ["laserTarget vehicle cameraOn"], _radiusSearch];

    if(count _nearObj == 0) then
    {
        strikeAllowed = false;
        hint "Strike not allowed";
    }
    else
    {
        strikeAllowed = true;
        //Selecting random target
        _target =  _nearObj;
        playSound3D ["A3\dubbing_f\modules\supports\artillery_acknowledged.ogg", player];

        
    };
}
else
{
    strikeAllowed = true;
    _target = selPos;
    playSound3D ["A3\dubbing_f\modules\supports\artillery_acknowledged.ogg", player]; 
    hint "CRUISE MISSILE INBOUND"; 
};

if(strikeAllowed) then
{
    

    //Setting up the starting pos for the missile.
    _startPos =  _target getRelPos [_distance, _direction];

    //Creating the missile entity
    _missile = "ammo_Missile_Cruise_01_Cluster" createVehicle _startPos;

    //Placing the misssile at the desired height
    [_missile,_height, _startPos,"ASL"] call BIS_fnc_setHeight;

    //Making the missile point the target
    _dir = [_missile, _target] call BIS_fnc_DirTo;
    _missile setDir _dir;

    //Giving the missile the desired speed
    _vel = velocity _missile;
    _missile setVelocity 
    [
        (_vel select 0) + (sin _dir * _startSpeed), 
        (_vel select 1) + (cos _dir * _startSpeed), 
        (_vel select 2)
    ];

    //Loop starts here, and keeps running untill the explosion
    while {Alive _missile} do
    {
        //Collecting all the values for testing/debugging/operating
        _speed = speed _missile;
        _velocity = velocity _missile;
        _downSpeed = _velocity select 2;
        _altitudeMissileASL = (getPosASL _missile) select 2;
        _altitudeMissileATL = (getPosATL _missile) select 2;
        _distance = _missile distance _target;
        pitchMis = (_missile call BIS_fnc_getPitchBank) select 0;

        _pitchOne = [_missile,_target] call fnc_PitchtoTgt;

        //While the missile is far away
        if(_distance > 800 && flyMode == "ASL") then
        {
            //Keeping the missile at a costant altitude
            [_missile,_height,nil,"ATL"] call BIS_fnc_setHeight;
        };

        if(_distance < 1300 && flyMode != "STRIKING") then
        {
            flyMode = "COMBAT";

            _lastPitch = round -_pitchOne + 1;

            for "_i" from (pitchMis) to (_lastPitch) step -1 do 
            {
                [_missile, _i , 0] call BIS_fnc_setPitchBank;
                sleep 0.03;
            };

            //flyMode = "STRIKING";
        };
        sleep 0.005; 

        //In case of testing
        if(_testing) then
        {
        hint format ["MODE IS: %1, \n Speed is: %2, \n Distance: %3, \n Pitch is %4, \n PitchToTgt is %5, \n ATL is %6, \n  ASL is %7",flyMode,_speed,_distance, pitchMis, _pitchOne, _altitudeMissileATL, _altitudeMissileASL];
        };
    };
};
};


fnc_PitchtoTgt =
{
/*
    Author: Dankan37
    Function: Returns pitch needed to aim a target.
    USAGE:
    Params:
    [startingPoint, target] spawn Dan_fnc_CruiseMissile / or ExecVM "fn_cruiseMissile.sqf";

    -startingPoint i
    -direction is the where the missile is gonna come from.

    NOTE: You may reuse this script in any of your missions or server, you may tweak this as you please and there's no need to credit me, as long as you don't claim it as yours.
*/


/*_pointOne = param [0];
_pointTwo = param [1];

//Getting the altitudes
_altitudeOne = ((getPosASL _pointOne) select 2);
_altitudeTwo = ((getPosASL _pointTwo) select 2);

//Getting the greatest and lowest of the two
_greatest = [_altitudeOne,_altitudeTwo] call BIS_fnc_greatestNum;
_lowest = [_altitudeOne,_altitudeTwo] call BIS_fnc_lowestNum;

//Altitude diff.
_altittudeDiff = _greatest - _lowest;

//Getting distance
_distance = _pointOne distance _pointTwo;

//Calculating pitch
dist3d = sqrt (_distance ^ 2 + _altittudeDiff ^ 2); //Pytagora
pitchTgt = acos (_distance / dist3d); //Returning the angle 

pitchTgt;
};*/
if (diag_tickTime < (uiNamespace getVariable ['tag_cooldown',-1])) exitWith {
			hint (format ['Please wait %1 more seconds.',(round ((uiNamespace getVariable ['tag_cooldown',-1]) - diag_tickTime))]);
		};
		_cooldown = 600; 	// cooldown duration in seconds
		uiNamespace setVariable ['tag_cooldown',(diag_tickTime + _cooldown)];

        playSound ["A3\dubbing_f\modules\supports\misc_new_available.ogg", player]; 


_uav_type = "B_UAV_02_dynamicLoadout_F";
_air_uav = markerPos "uav_spawnpoint";

// Calculate a random position around the spawn point
_air_uav = [(((_air_uav select 0) + 500) - random 1000),(((_air_uav select 1) + 500) - random 1000),120];

// Define the UAV type and spawn point
_uav_type = "B_UAV_02_dynamicLoadout_F";
_air_uav = markerPos "uav_spawnpoint";

// Calculate a random position around the spawn point
_air_uav = [(((_air_uav select 0) + 500) - random 1000),(((_air_uav select 1) + 500) - random 1000),120];

// Create the UAV at the calculated position and make it fly
_newvehicle = createVehicle [_uav_type, _air_uav, [], 0, "FLY"];
_newvehicle flyInHeight (800 + (random 1500));
_newvehicle setVelocity [100 * (sin (getDir _newvehicle)), 100 * (cos (getDir _newvehicle)), 1];

// Create the vehicle crew explicitly for the West side
createVehicleCrew _newvehicle;

// Create a new group for the UAV
_uavGroup = createGroup west;

// Move the created UAV into this new group
[_newvehicle] joinSilent _uavGroup;

// Define the waypoint position
_waypointPosition = markerPos "uav_waypoint"; // Make sure to create a marker named "uav_waypoint"

// Add a waypoint to the UAV group
_wp = _uavGroup addWaypoint [_waypointPosition, 2000];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "STEALTH";

// Optional: Make the UAV loiter at the waypoint (for example, circling around)
_wp setWaypointType "LOITER";
_wp setWaypointLoiterAltitude 2000; // Set loiter altitude
_wp setWaypointLoiterRadius 200; // Set loiter radius




};