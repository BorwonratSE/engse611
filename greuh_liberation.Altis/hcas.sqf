fnc_hcas =
{
    if (diag_tickTime < (uiNamespace getVariable ['tag_hcas',-1])) exitWith {
			hint (format ['Please wait %1 more seconds.',(round ((uiNamespace getVariable ['tag_hcas',-1]) - diag_tickTime))]);
		};
		_cooldown = 600; 	// cooldown duration in seconds
		uiNamespace setVariable ['tag_hcas',(diag_tickTime + _cooldown)];

        playSound3D ["A3\dubbing_f\modules\supports\misc_new_available.ogg", player]; 
  
       _pad1 = getPosATL h2; 
 
        createVehicle  
        [ 
            "B_Heli_Attack_01_dynamicLoadout_F", 
            _pad1, 
            [], 
            0, 
            "NONE"] 

   
}; 

