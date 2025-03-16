if (!isServer && hasInterface) exitWith {};
params ["_unit","_targetsector"];

[ [ "lib_reinforcements" , [ markertext  _targetsector ] ] , "bis_fnc_shownotification" ] call BIS_fnc_MP;

_targetsector = [sectors_allSectors, _unit] call F_nearestPosition;
[getMarkerPos _targetsector, GRLIB_side_friendly] spawn spawn_air;

