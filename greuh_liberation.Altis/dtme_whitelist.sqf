[] call compileFinal preprocessFileLineNumbers "whitelist.sqf";
private _whitelist = ["UID1", "UID2", "UID3"];  
private _whitelist = GRLIB_whitelisted_steamids;

private _playerUID = getPlayerUID player;

if (count (_whitelist select { _x == _playerUID }) == 0) then {

    hint "You are not allowed to play this role. Please contact the admin.";

    
    ["END2"] remoteExec ["endMission", player];
};
