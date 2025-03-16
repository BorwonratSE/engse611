fnc_mobile =
{
    if (diag_tickTime < (uiNamespace getVariable ['tag_cooldown',-1])) exitWith {
			hint (format ['Please wait %1 more seconds.',(round ((uiNamespace getVariable ['tag_cooldown',-1]) - diag_tickTime))]);
		};
		_cooldown = 600; 	// cooldown duration in seconds
		uiNamespace setVariable ['tag_cooldown',(diag_tickTime + _cooldown)];

		playSound3D ["A3\dubbing_f\modules\supports\drop_request.ogg", player]; 
  
    _para = "B_Parachute_02_F";
_smokeShell = "SmokeShellRed";

_vehicle = "B_Truck_01_medical_F" createVehicle (getPos player);
_vehicle setPosATL (_vehicle modelToWorld[5,5,100]);


_DropPos1 = getpos _vehicle;

_chute1 = createVehicle [_para, _DropPos1, [], 0, "NONE"];

_vehicle attachTo [_chute1, [0, 0, 3]];
;


_smoke = _smokeShell createVehicle position _vehicle;
_smoke attachTo [_vehicle,[0,0,0]];


}; 


