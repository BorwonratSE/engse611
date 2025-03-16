while {true} do {
    { 
            commander _x doWatch getPosATL player;
            gunner _x doWatch getPosATL player;
        if (side _x == east) then {
                if (alive (gunner _x)) then {
                gunner _x doArtilleryFire [getPosATL player, "12Rnd_230mm_rockets", 12];
                sleep 60;
                gunner _x doArtilleryFire [getPosATL player, "32Rnd_155mm_Mo_shells_O", 10];
              };

            if (side driver _x == EAST && alive (driver _x)) then {
                vehicle _x setVehicleAmmo 1;
            };
        };
    } forEach allUnits;
    sleep 180;
};