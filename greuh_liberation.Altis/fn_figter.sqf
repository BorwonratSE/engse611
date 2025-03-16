fnc_fighter =
{
    if (diag_tickTime < (uiNamespace getVariable ['tag_cooldown',-1])) exitWith {
			hint (format ['Please wait %1 more seconds.',(round ((uiNamespace getVariable ['tag_cooldown',-1]) - diag_tickTime))]);
		};
		_cooldown = 600; 	// cooldown duration in seconds
		uiNamespace setVariable ['tag_cooldown',(diag_tickTime + _cooldown)];

        playSound3D ["A3\dubbing_f\modules\supports\misc_new_available.ogg", player]; 

    _pad1 = getPosATL f1; 

        createVehicle  
        [ 
            "B_Plane_Fighter_01_F", 
            _pad1, 
            [], 
            0, 
            "NONE"] 
        



   


};