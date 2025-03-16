waitUntil { time > 1 };
waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

private [ "_fobbox" ];

if ( count GRLIB_all_fobs == 0 ) then {

	if ( GRLIB_build_first_fob ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 800 ) then {
					_acceptsector = false;
				};
			} foreach sectors_allSectors;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = _potentialplaces call BIS_fnc_selectRandom;
		[markerPos _spawnplace, true] remoteExec ["build_fob_remote_call",2];

		if (KP_liberation_debug) then {
			private _text = format ["[KP LIBERATION] [DEBUG] Preplaced FOB placed by: %1", (name player)];
			_text remoteExec ["diag_log",2];
		};

	} else {
		while { count GRLIB_all_fobs == 0 } do {
			_fobbox = FOB_box_typename createVehicle (getposATL base_boxspawn);
			_fobbox setposATL (getposATL base_boxspawn);
			_fobbox setdir getDir base_boxspawn;

			[_fobbox, 3000] remoteExec ["F_setMass",_fobbox];

		
			sleep 3;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || count GRLIB_all_fobs > 0
			};

			sleep 15;

		};

		deleteVehicle _fobbox;
	};

};