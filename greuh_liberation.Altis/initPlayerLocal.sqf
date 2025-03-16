player setCustomAimCoef 0.2;
player addMPEventhandler ["MPRespawn", {player setCustomAimCoef 0.2}];
 
player setUnitRecoilCoefficient 1;
player addEventHandler ["Respawn", {player setUnitRecoilCoefficient 1}];
 
player enablestamina false;
player addEventHandler ["Respawn", {player enablestamina false}];
/*
uav1 setUnitTrait ["UAVHacker", true];
uav1 addEventHandler ["Respawn", {uav1 setUnitTrait ["UAVHacker", true]}];
////////////////////////////////////////
leader1 setUnitTrait ["medic", true];
leader1 addEventHandler ["Respawn", {leader1 setUnitTrait ["medic", true]}];

leader1 setUnitTrait ["engineer", true];
leader1 addEventHandler ["Respawn", {leader1 setUnitTrait ["engineer", true]}];
////////////////////////////////////////
recon1 setUnitTrait ["medic", true];
recon1 addEventHandler ["Respawn", {recon1 setUnitTrait ["medic", true]}];

recon1 setUnitTrait ["engineer", true];
recon1 addEventHandler ["Respawn", {recon1 setUnitTrait ["engineer", true]}];
////////////////////////////////////////
recon2 setUnitTrait ["medic", true];
recon2 addEventHandler ["Respawn", {recon2 setUnitTrait ["medic", true]}];

recon2 setUnitTrait ["engineer", true];
recon2 addEventHandler ["Respawn", {recon2 setUnitTrait ["engineer", true]}];
////////////////////////////////////////
recon3 setUnitTrait ["medic", true];
recon3 addEventHandler ["Respawn", {recon3 setUnitTrait ["medic", true]}];

recon3 setUnitTrait ["engineer", true];
recon3 addEventHandler ["Respawn", {recon3 setUnitTrait ["engineer", true]}];
////////////////////////////////////////
recon4 setUnitTrait ["medic", true];
recon4 addEventHandler ["Respawn", {recon4 setUnitTrait ["medic", true]}];

recon4 setUnitTrait ["engineer", true];
recon4 addEventHandler ["Respawn", {recon4 setUnitTrait ["engineer", true]}];
////////////////////////////////////////
recon5 setUnitTrait ["medic", true];
recon5 addEventHandler ["Respawn", {recon5 setUnitTrait ["medic", true]}];

recon5 setUnitTrait ["engineer", true];
recon5 addEventHandler ["Respawn", {recon5 setUnitTrait ["engineer", true]}];
////////////////////////////////////////*



///////////////////////////////////////////////////
player createDiarySubject[ "Discord", "Discord" ];
player createDiaryRecord[ "Discord", [ "Discord Info", "" ] ];

addMissionEventHandler [ "Map", {
	params[ "_isOpen" ];

	if ( _isOpen ) then {
		//1001, 1002, 1013

		disableSerialization;

		_display = uiNamespace getVariable "RscDiary";

		_diaryList = _display displayCtrl 1001;
		_diarySubList = _display displayCtrl 1002;

		TAG_fnc_showSelection = {
			disableSerialization;
			params[ "_ctrl", "_index" ];

			_display = ctrlParent _ctrl;

			_diarySubList = _display displayCtrl 1002;
			waitUntil{ ctrlShown _diarySubList };
			_diaryEntry = _display displayCtrl 1013;

			if ( _diarySubList lbText ( lbCurSel _diarySubList ) == "Discord Info" ) then {
				if ( isNull ( _diaryEntry controlsGroupCtrl 10001 ) ) then {
					_btnHeight = 0.02 * safeZoneH;

					//Hide diary entry html
					_contentHtml = _diaryEntry controlsGroupCtrl 1003;
					_contentHtml ctrlSetFade 1;
					_contentHtml ctrlCommit 0;

					//Inject button
					ctrlPosition _diaryEntry params[ "_entryX", "_entryY", "_entryW", "_entryH" ];
					_ctrl = _display ctrlCreate [ "myWebpageButton", 10001, _diaryEntry ];
					_ctrl ctrlSetPosition[ 0, 0, _entryW / 3, _btnHeight ];
					_ctrl ctrlCommit 0;
					_ctrl ctrlSetText "Click Here";
				};
			}else{
				//If its not the mod info entry
				//AND the injected button exists
				if !( isNull ( _diaryEntry controlsGroupCtrl 10001 ) ) then {
					//Delete injected button
					ctrlDelete ( _diaryEntry controlsGroupCtrl 10001 );
					//Unhide entry html
					_contentHtml = _diaryEntry controlsGroupCtrl 1003;
					_contentHtml ctrlSetFade 0;
					_contentHtml ctrlCommit 0;
				};
			};
		};

		_diaryList ctrlAddEventHandler [ "LBSelChanged", {
			_this spawn TAG_fnc_showSelection;
		}];

		_diarySubList ctrlAddEventHandler [ "LBSelChanged", {
			_this spawn TAG_fnc_showSelection;
		}];
	};
}];
////////////////////////////////////////////////////////////////////*/

//GOM_fnc_aircraftLoadout V1.35 made by Grumpy Old Man 17-5-2017

//this is just an example and this file is not needed at all
//see the main file description for further details
/*params ["_unit","_JIP"];

if (_unit getvariable ["GOM_fnc_aircraftLoadoutAllowed",false]) then {

	_unit spawn GOM_fnc_addAircraftLoadout;

};
////////////////////////
pf1 spawn GOM_fnc_addAircraftLoadout;


pcas1 spawn GOM_fnc_addAircraftLoadout;


pcas2 spawn GOM_fnc_addAircraftLoadout;


fb1 spawn GOM_fnc_addAircraftLoadout;


pv1  spawn GOM_fnc_addAircraftLoadout;

pf2	 spawn GOM_fnc_addAircraftLoadout;

