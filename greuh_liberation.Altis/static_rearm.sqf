/*_static =	["B_AAA_System_01_F",                              
   			"B_SAM_System_02_F",
    		"B_SAM_System_01_F",
    		"B_SAM_System_03_F"];
_uavs = [
   
    "B_Radar_System_01_F",
    "B_SAM_System_03_F",
    "B_UAV_02_dynamicLoadout_F",
    "B_T_UAV_03_dynamicLoadout_F",
    "B_UAV_05_F",
    "B_UAV_01_F",
    "B_UAV_02_F",
    "B_UAV_02_CAS_F",
    "B_UGV_01_F",
    "B_UGV_01_rcws_F",
    "B_AAA_System_01_F",                               
    "B_SAM_System_02_F", 
    "B_SAM_System_01_F"
]


while {count (alive _static) > 0} do {
    {
        if (alive _x) then {
            _x setVehicleAmmo 1;
        };
    } forEach _static;
    sleep 1;
};
/*while {true} do {
    {
        if (alive _x) then {
            _x setVehicleAmmo 1;
        };
    } forEach _static;
    sleep 1;
};

while {true} do { 
	{
		if (alive _x) then {
            _x setVehicleRadar true;
        };
    } forEach _uav;
    
	sleep 1;
};*/


_static = [
    "B_AAA_System_01_F", 
    "B_SAM_System_02_F", 
    "B_SAM_System_01_F", 
    "B_SAM_System_03_F"
];


while {true} do {
    {
        _className = _x;  
        
        {
           
            if (_x isKindOf _className) then {
               
                _x setVehicleAmmo 1;
            };
        } forEach allMissionObjects "All"; 
    } forEach _static; 
    sleep 900; 
};




