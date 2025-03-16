enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";
[] call compileFinal preprocessFileLineNumbers "initPlayerLocal.sqf";
[] call compile preprocessFileLineNumbers "EPD\VirtualJTAC\init.sqf";
nul = [] execVM "MIL_EnhancedUAVIntel\init.sqf";
[] execVM "GF_Earplugs\GF_Earplugs.sqf";

[]execVM "ClusterMissile.sqf";
[]execVM "CruiseMissile.sqf";
[] execVM "tdrop.sqf";
[] execVM "fn_figter.sqf";
[] execVM "cas1.sqf";
[] execVM "cas2.sqf";
[] execVM "hcas.sqf";
[] execVM "ht.sqf";
[] execVM "mobile.sqf";
[] execVM "service.sqf";
[] execVM "hunter.sqf";
[] execVM "buzz.sqf";
[] execVM "riffleman.sqf";
[] execVM "230mm.sqf";
[] execVM "g500.sqf";
[] execVM "spawn_uav.sqf";
[] execVm "static_rearm.sqf";


[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

//________________  Author : [GR]GEORGE F ___________ 04.04.18 _____________


//https://community.bistudio.com/wiki/DIK_KeyCodes

hint"Holster Weapon with key 4";

[] spawn {
	waitUntil {!isNull(findDisplay 46)};

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		if(_this select 1 == 0x05) //number 4
		then {
			_Holster_Weapon_ctrl = (_this select 0) displayCtrl 9001;
			if(isNull(_Holster_Weapon_ctrl)) then {
				_Holster_Weapon_ctrl = (_this select 0) ctrlCreate ["RscText", 9001];
				_Holster_Weapon_ctrl ctrlSetPosition [SafeZoneXAbs, SafeZoneY + (SafeZoneH - 0.05) / 2, 0.2, 0.03];
				_Holster_Weapon_ctrl ctrlSetFontHeight 0.03;
				_Holster_Weapon_ctrl ctrlSetText "";
				_Holster_Weapon_ctrl ctrlShow false;
				_Holster_Weapon_ctrl ctrlCommit 0;
			};
			_shown = ctrlShown _Holster_Weapon_ctrl;
			
			//this is for earplugs - mute sound
			//0.1 fadeSound (if(_shown)then{1}else{0.1}); 
			
			//Weapon on the back
			player action ["SWITCHWEAPON",player,player,-1];
			waitUntil {currentWeapon player == "" or {primaryWeapon player == "" && handgunWeapon player == ""}};
			_Holster_Weapon_ctrl ctrlShow !_shown;
		};
	}];
};

[] spawn
    {
    while {true} do
        {
        sleep 5;

            {
            _x setSkill ["aimingspeed", 1];
            _x setSkill ["spotdistance", 1];
            _x setSkill ["aimingaccuracy", 1];
            _x setSkill ["aimingshake", 1];
            _x setSkill ["spottime", 1];
            _x setSkill ["spotdistance", 1];
            _x setSkill ["commanding", 1];
            _x setSkill ["general", 1];
            }
        forEach allUnits;
        }
    };


while {true} do {

	_allPlayers = allPlayers;

	{
	  if ((side _x) == east) then // put the right ennemy side
	  {
	     for "_i" from 0 to count _allplayers -1 do {

	     _x reveal [(_allplayers) select _i, 4];

	     };
	  };
	} forEach allUnits;

	sleep 5; 
};

{
    private ["_artilleryPos"];

    if (side _x == east && local _x) then {
        _artilleryPos = getPosATL player;

        while {alive _x} do {
            commander _x doWatch _artilleryPos;
            gunner _x doWatch _artilleryPos;

            if (alive (gunner _x)) then {
                gunner _x doArtilleryFire [_artilleryPos, "12Rnd_230mm_rockets", 12];
                sleep 15;
                gunner _x doArtilleryFire [_artilleryPos, "32Rnd_155mm_Mo_shells_O", 10];
            };

            if (side driver _x == east && alive (driver _x)) then {
                vehicle _x setVehicleAmmo 1;
            };

            sleep 60;
        };
    };
} forEach allUnits;

