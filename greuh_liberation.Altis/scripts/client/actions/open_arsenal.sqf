private [ "_loadouts_data", "_saved_loadouts", "_counter", "_loadplayers", "_playerselected", "_namestr", "_nextplayer" ];
KP_liberation_arsenal_type = true;
load_loadout = 0;
edit_loadout = 0;
respawn_loadout = 0;
load_from_player = -1;
exit_on_load = 0;
KP_liberation_ace = false;
private _removedItems = [];
createDialog "liberation_arsenal";

private _backpack = backpack player;

_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
_loadouts_data = [];
_counter = 0;
if ( !isNil "_saved_loadouts" ) then {
	{
		if ( _counter % 2 == 0 ) then {
			_loadouts_data pushback _x;
		};
		_counter = _counter + 1;
	} foreach _saved_loadouts;
};

waitUntil { dialog };

if ( count _loadouts_data > 0 ) then {

	{ lbAdd [201, _x]; } foreach _loadouts_data ;

	if ( lbSize 201 > 0 ) then {
		ctrlEnable [ 202, true ];
		lbSetCurSel [ 201, 0 ];
	} else {
		ctrlEnable [ 202, false ];
	};

} else {
	ctrlEnable [ 202, false ];
};

_loadplayers = [];
{
	if ( !(name _x in [ "HC1", "HC2", "HC3" ]) )  then {
		_loadplayers pushback [ name _x, _x ];
	};
} foreach ( allPlayers - [ player ] );

if ( count _loadplayers > 0 ) then {

	{
		_nextplayer = _x select 1;
		_namestr = "";
		if(count (squadParams _nextplayer) != 0) then {
			_namestr = "[" + ((squadParams _nextplayer select 0) select 0) + "] ";
		};
		_namestr = _namestr + name _nextplayer;

		lbAdd [ 203, _namestr ];
		lbSetCurSel [ 203, 0 ];
	} foreach _loadplayers;

} else {
	ctrlEnable [ 203, false ];
	ctrlEnable [ 204, false ];
};

((findDisplay 5251) displayCtrl 201) ctrlAddEventHandler [ "mouseButtonDblClick" , { exit_on_load = 1; load_loadout = 1; } ];

while { dialog && (alive player) && edit_loadout == 0 } do {

	if ( load_loadout > 0 ) then {
		private _loaded_loadout = _loadouts_data select (lbCurSel 201);
		[player, [profileNamespace, _loaded_loadout]] call bis_fnc_loadInventory;
		[ player ] call F_correctLaserBatteries;		
		if (KP_liberation_arsenalUsePreset) then {
			if ([_backpack] call F_checkGear) then {
				hint format [ localize "STR_HINT_LOADOUT_LOADED", _loaded_loadout param [0]];
			};
		} else {
			hint format [ localize "STR_HINT_LOADOUT_LOADED", _loaded_loadout param [0]];
		};

		if ( exit_on_load == 1 ) then {
			closeDialog 0;
		};
		load_loadout = 0;
	};


	if ( respawn_loadout > 0 ) then {
		GRLIB_respawn_loadout = [ player, ["repetitive"] ] call F_getLoadout;
		hint localize "STR_MAKE_RESPAWN_LOADOUT_HINT";
		respawn_loadout = 0;
	};

	if ( load_from_player >= 0 ) then {
		_playerselected = ( _loadplayers select load_from_player ) select 1;
		if ( alive _playerselected ) then {
			[ player,  [ _playerselected, ["repetitive"] ] call F_getLoadout ] call F_setLoadout;
			hint format [ localize "STR_LOAD_PLAYER_LOADOUT_HINT", name _playerselected ];
		};
		load_from_player = -1;
	};

	sleep 0.1;
};

if (edit_loadout > 0) then {
	closeDialog 0;
	waitUntil { !dialog };

	if (uniform player in blacklisted_bag) then {
		removeUniform player;
	};

	[ "Open", false ] spawn {
		[ "Open", false ] spawn BIS_fnc_arsenal;
		waitUntil { !dialog };

		while {true} do {
			if (uniform player in blacklisted_bag) then {
				removeUniform player;
			}

			};sleep 5;
		};
	};








if (KP_liberation_arsenalUsePreset) then {
	uiSleep 5;
	private _arsenalDisplay = ["RSCDisplayArsenal", "ace_arsenal_display"] select (KP_liberation_arsenal_type);
	waitUntil {sleep 1; isNull (uinamespace getvariable [_arsenalDisplay, displayNull])};
	[_backpack] call F_checkGear;
};

