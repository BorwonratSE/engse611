
private [ "_idact_build",  "_idact_arsenal", "_idact_buildfob", "_idact_redeploy", "_idact_tutorial", "_distfob", "_distarsenal",  "_distbuildfob", "_distspawn", "_distredeploy", "_idact_commander" ];

_idact_build = -1;
_idact_arsenal = -1;
_idact_buildfob = -1;
_idact_redeploy = -1;
_idact_tutorial = -1;
_idact_squad = -1;
_idact_commander = -1;
_idact_repackage = -1;
_idact_halo = -1;
_idact_secondary = -1;
_distfob = 100;
_distarsenal = 5;
_distbuildfob = 10;
_distspawn = 10;
_distredeploy = 20;

GRLIB_removefobboxes = false;

waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { one_synchro_done };

while { true } do {

	_nearfob = [] call F_getNearestFob;
	_fobdistance = 9999;
	if ( count _nearfob == 3 ) then {
		_fobdistance = player distance _nearfob;
	};

	_neararsenal = [ ( (getpos player) nearobjects [ Arsenal_typename, _distarsenal ]), { getObjectType _x >= 8 } ] call BIS_fnc_conditionalSelect;
	_nearfobbox = ( (getpos player) nearEntities [ [ FOB_box_typename, FOB_truck_typename ] , _distbuildfob ] );
	_nearspawn = ( (getpos player) nearEntities [ [ Respawn_truck_typename, huron_typename ] , _distspawn ] );

	if ( GRLIB_removefobboxes ) then {
		GRLIB_removefobboxes = false;
		if ( count _nearfobbox > 0 ) then {
			deletevehicle (_nearfobbox select 0);
		};
	};

	if ( (player distance startbase) < 200 && alive player && vehicle player == player ) then {
		if ( _idact_tutorial == -1 ) then {
			_idact_tutorial = player addAction ["<t color='#80FF80'>" + localize "STR_TUTO_ACTION" + "</t>","howtoplay = 1","",-740,false,true,"",""];
		};
	} else {
		if ( _idact_tutorial != -1 ) then {
			player removeAction _idact_tutorial;
			_idact_tutorial = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || (player distance startbase) < 200) && alive player && vehicle player == player && GRLIB_halo_param > 0 ) then {
		if ( _idact_halo == -1 ) then {
			_idact_halo = player addAction ["<t color='#80FF80'>" + localize "STR_HALO_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\spawn\do_halo.sqf","",-749,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_halo != -1 ) then {
			player removeAction _idact_halo;
			_idact_halo = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || count _nearspawn != 0 || (player distance startbase) < 200) && alive player && vehicle player == player ) then {
		if ( _idact_redeploy == -1 ) then {
			_idact_redeploy = player addAction ["<t color='#80FF80'>" + localize "STR_DEPLOY_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\actions\redeploy.sqf","",-750,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_redeploy != -1 ) then {
			player removeAction _idact_redeploy;
			_idact_redeploy = -1;
		};
	};

	if ( (_fobdistance < _distredeploy || count _neararsenal != 0 || count _nearspawn != 0 || (player distance startbase) < 200) && alive player && vehicle player == player ) then {
		if (_idact_arsenal == -1) then {
			_idact_arsenal = player addAction ["<t color='#FFFF00'>" + localize "STR_ARSENAL_ACTION" + "</t> <img size='2' image='res\ui_arsenal.paa'/>","scripts\client\actions\open_arsenal.sqf","",-980,true,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_arsenal != -1 ) then {
			player removeAction _idact_arsenal;
			_idact_arsenal = -1;
		};
	};

	if ( _fobdistance < _distfob && alive player && vehicle player == player && ( (  [ player, 3 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_build == -1 ) then {
			_idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_build != -1 ) then {
			player removeAction _idact_build;
			_idact_build = -1;
		};
	};

	if ( count _nearfobbox != 0 && alive player && vehicle player == player && !(surfaceIsWater getpos player) && ((player distance startbase) > 1000) && ( ( [ player, 3 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_buildfob == -1 ) then {
			_idact_buildfob = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_ACTION" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\build\do_build_fob.sqf","",-990,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_buildfob != -1 ) then {
			player removeAction _idact_buildfob;
			_idact_buildfob = -1;
		};
	};

	if ( (leader group player == player) && (count units group player > 1) && alive player && vehicle player == player) then {
		if ( _idact_squad == -1 ) then {
			_idact_squad = player addAction ["<t color='#80FF80'>" + localize "STR_SQUAD_MANAGEMENT_ACTION" + "</t> <img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>","scripts\client\ui\squad_management.sqf","",-760,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_squad != -1 ) then {
			player removeAction _idact_squad;
			_idact_squad = -1;
		};
	};

	if ( ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) && alive player && vehicle player == player && GRLIB_permissions_param ) then {
		if ( _idact_commander == -1 ) then {
			_idact_commander = player addAction ["<t color='#FF8000'>" + localize "STR_COMMANDER_ACTION" + "</t> <img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>","scripts\client\commander\open_permissions.sqf","",-995,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_commander != -1 ) then {
			player removeAction _idact_commander;
			_idact_commander = -1;
		};
	};

	if (  _fobdistance < _distredeploy  && alive player && vehicle player == player && ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) then {
		if ( _idact_repackage == -1 ) then {
			_idact_repackage = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_REPACKAGE" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\actions\do_repackage_fob.sqf","",-991,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_repackage != -1 ) then {
			player removeAction _idact_repackage;
			_idact_repackage = -1;
		};
	};

	if ( ( count GRLIB_all_fobs > 0 ) && ( GRLIB_endgame == 0 ) && (_fobdistance < _distredeploy || (player distance startbase) < 200) && alive player && vehicle player == player && ( ( [ player, 5 ] call F_fetchPermission ) || ( player == ( [] call F_getCommander ) || [] call F_isAdmin ) ) ) then {
		if ( _idact_secondary == -1 ) then {
			_idact_secondary = player addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_OBJECTIVES" + "</t>","scripts\client\ui\secondary_ui.sqf","",-993,false,true,"","build_confirmed == 0"];
		};
	} else {
		if ( _idact_secondary != -1 ) then {
			player removeAction _idact_secondary;
			_idact_secondary = -1;
		};
	};

	sleep 1;
};
