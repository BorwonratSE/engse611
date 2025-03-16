// This file allows you to add content to the mission without conflict issues after each update of the original classnames.sqf
// If you want more modifications to be supported by this file, let's discuss it on the forums.



// *** SUPPORT STUFF ***

// Setting a value here will overwrite the original value found from the mission. Do that if you're doing a total conversion.
// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = nil;						// Default "Land_Cargo_HQ_V1_F";
FOB_box_typename = nil;					// Default "B_Slingload_01_Cargo_F";
FOB_truck_typename = nil;				// Default "B_Truck_01_box_F";
Arsenal_typename = nil;					// Default "B_supplyCrate_F";
Respawn_truck_typename = nil;			// Default "B_Truck_01_medical_F";
huron_typename = nil;					// Default "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = nil;				// Default "Box_NATO_AmmoVeh_F";
ammobox_o_typename = nil;				// Default "Box_East_AmmoVeh_F";
opfor_ammobox_transport = nil;			// Default "O_Truck_03_transport_F";    // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise things will break
commander_classname = nil;				// Default "B_officer_F"
crewman_classname = nil;				// Default "B_crew_F";
pilot_classname = nil;					// Default "B_Helipilot_F";

KP_liberation_arsenal = 1;




// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]
// Example : [ "B_APC_Tracked_01_AA_F", 0, 40, 15 ],

// If overwrite is set to true, then the extension list will entirely replace the original list defined in classnames.sqf. Otherwise it will be appended to it.
// Useful for total conversions to RHS and such, without having to alter the original file.
infantry_units_overwrite = false;
infantry_units_extension = [

];

light_vehicles_overwrite = false;
light_vehicles_extension = [
	/*["rhsusf_m998_w_4dr",0,0,2],
	["rhsusf_rg33_m2_d",0,10,3],
	["fsf_fnk_norm_ce",0,0,3],
	["greuh_fnk_norm_ce",0,0,3],
	["I_MRAP_03_F",0,0,3],
	["I_MRAP_03_hmg_F",0,10,3],
	["I_MRAP_03_gmg_F",0,20,3],
	["fsf_fnk_hmg_ce",0,10,3],
	["greuh_fnk_hmg_ce",0,10,3],
	["greuh_fnk_hmg_dsrt",0,10,3]*/
];

heavy_vehicles_overwrite = false;
heavy_vehicles_extension = [
	/*["I_APC_Wheeled_03_cannon_F",0,50,10],
	["greuh_pandur_wdld",0,50,10],
	["I_APC_tracked_03_cannon_F",0,40,15],
	["greuh_fv510_wdld",0,40,15],
	["greuh_fv510_dsrt",0,40,15],
	["RHS_M2A3_BUSKIII_wd",0,55,15],
	["Steve_MBT_Kuma",0,100,25],
	["I_MBT_03_cannon_F",0,100,25],
	["rhsusf_m1a2sep1tuskiid_usarmy",0,100,25],
	["Burnes_FV4034_01",0,250,40]*/
];

air_vehicles_overwrite = false;
air_vehicles_extension = [
	/*["greuh_aw159_t",0,0,12],
	["greuh_aw159_a",0,50,12],
	["I_Heli_light_03_unarmed_F",0,0,12],
	["I_Heli_light_03_F",0,50,12],
	["JNS_Skycrane_BLU_Black",0,0,18],
	["RHS_CH_47F",0,20,20],
	["greuh_eh101_gr",0,0,25],
	["I_Heli_Transport_02_F",0,0,25],
	["MV22",0,0,25],
	["RHS_AH1Z_wd_GS",0,175,30],
	["H_RAH66",0,200,30],
	["RHS_AH64D_wd",0,400,50],
	["FIR_F16C",0,100,30],
	["FIR_F15E",0,200,50],
	["JS_JC_FA18E",0,350,40],
	["JS_JC_FA18F",0,350,40],
	["sab_C130_CSP",0,0,30],
	["sab_C130_J",0,0,30],
	["usaf_f22",0,500,75],
	["USAF_F35A",0,600,75],
	["I_Plane_Fighter_03_AA_F",0,50,30],
	["I_Plane_Fighter_03_CAS_F",0,100,30]*/
];

static_vehicles_overwrite = false;
static_vehicles_extension = [

];

buildings_overwrite = false;
buildings_extension = [

];

support_vehicles_overwrite = false;		// If you're going to overwrite this, make sure you have at least Arsenal_typename, Respawn_truck_typename, FOB_box_typename and FOB_truck_typename in there
support_vehicles_extension = [
	/*["JNS_Skycrane_Pod_Bench_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Ammo_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Medical_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Repair_BLU_Black",5,0,0],
	["JNS_Skycrane_Pod_Transport_BLU_Black",5,0,0]*/
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
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
];



// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad
blufor_squad_inf_light = [

];

// Heavy infantry squad
blufor_squad_inf = [

];

// AT specialists squad
blufor_squad_at = [

];

// AA specialists squad
blufor_squad_aa = [

];

// Force recon squad
blufor_squad_recon = [

];

// Paratroopers squad
blufor_squad_para = [

];


KP_liberation_battlegroup_clearance = [
    "song_bin_tanh"
];




// *** BADDIES ***

// All OPFOR infantry. Defining a value here will replace the default value from the original mission.
opfor_officer = "O_T_Officer_F";                                        // Officer
opfor_squad_leader = "O_V_Soldier_LAT_hex_F";                                // Squad Leader
opfor_team_leader = "O_V_Soldier_LAT_hex_F";                            // Team Leader
opfor_sentry = "O_V_Soldier_LAT_hex_F";                                         // Rifleman
opfor_rifleman = "O_V_Soldier_LAT_hex_F";                                       // Rifleman
opfor_rpg = "O_T_Soldier_HAT_F";                                        // Rifleman (LAT)
opfor_grenadier = "O_HeavyGunner_F";                                   // Grenadier
opfor_machinegunner = "O_T_Soldier_AA_F";                               // Autorifleman
opfor_heavygunner = "O_HeavyGunner_F";                                 // Autorifleman
opfor_marksman = "O_V_Soldier_M_hex_F";                                     // Marksman
opfor_sharpshooter = "O_V_Soldier_M_hex_F";                                 // Marksman
opfor_sniper = "O_ghillie_sard_F";                                          // Sniper
opfor_at = "O_T_Soldier_AT_F";                                          // AT Specialist
opfor_aa = "O_T_Soldier_AA_F";                                          // AA Specialist
opfor_medic = "O_T_Soldier_HAT_F";                                            // Combat Life Saver
opfor_engineer = "O_T_Soldier_AA_F";                                      // Engineer
opfor_paratrooper = "O_T_Soldier_PG_F";                                 // Paratrooper

// OPFOR Vehicles to be used in secondary objectives
opfor_mrap = "O_MBT_04_arty_F";                                    // Qilin
opfor_mrap_armed = "O_T_MBT_04_command_F";                                // Qilin (HMG)
opfor_transport_helo = "O_T_VTOL_02_infantry_dynamicLoadout_F";                   // Mi-290 Taru (Bench)
opfor_transport_truck = "O_T_MBT_04_command_F";                  // Tempest Transport (Covered)
opfor_fuel_truck = "O_T_Truck_03_fuel_ghex_F";                          // Tempest Fuel
opfor_ammo_truck = "O_T_Truck_03_ammo_ghex_F";                          // Tempest Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "Flag_CSAT_F";                                             // Flag

// Militia infantry. Soldier classnames the game will pick from randomly
militia_squad_overwrite = false;
militia_squad_extension = [

];

// Militia vehicles to choose from
militia_vehicles_overwrite = false;
militia_vehicles_extension = [
	"rhs_btr70_chdkz",
	"rhs_zsu234_chdkz",
	"I_MU_mercs_Offroad_01_armed_F",
	"I_MU_mercs_Offroad_01_armed_F",
	"LOP_AFR_BTR60",
	"LOP_AFR_M113_W",
	"LOP_AFR_T72BA",
	"I_MU_mercs_Offroad_01_armed_F"
];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles_overwrite = false;
opfor_vehicles_extension = [

];

// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity_overwrite = false;
opfor_vehicles_low_intensity_extension = [

];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles_overwrite = false;
opfor_battlegroup_vehicles_extension = [

];

// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity_overwrite = false;
opfor_battlegroup_vehicles_low_intensity_extension = [

];

// All the vehicles that can spawn as battlegroup members (see above) and also hold 8 soldiers as passengers.
// If something in here can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports_overwrite = false;
opfor_troup_transports_extension = [

];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers_overwrite = false;
opfor_choppers_extension = [

];

// Opfor military aircrafts
opfor_air_overwrite = false;
opfor_air_extension = [

];







// Other stuff

// civilians
civilians_overwrite = false;
civilians_extension = [

];

// civilian vehicles
civilian_vehicles_overwrite = false;
civilian_vehicles_extension = [

];

// Everything the AI troups should be able to resupply from
ai_resupply_sources_extension = [

];

// Everything that can resupply other vehicles
vehicle_repair_sources_extension = [

];
vehicle_rearm_sources_extension = [

];
vehicle_refuel_sources_extension = [

];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles_extension = [
    "O_Plane_Fighter_02_F",                                     //To-201 Shikra
    "O_MBT_02_railgun_F",
    "B_MBT_01_arty_F",                                                  // M4 Scorcher
    "B_MBT_01_mlrs_F",                                                  // M5 Sandstorm MLRS
    "B_Heli_Attack_01_dynamicLoadout_F",                                // AH-99 Blackfoot
    "B_UAV_02_dynamicLoadout_F",                                        // MQ-4A Greyhawk
    "B_T_UAV_03_dynamicLoadout_F",                                      // MQ-12 Falcon
    "B_UAV_05_F",                                                       // UCAV Sentinel
    "B_Plane_CAS_01_dynamicLoadout_F",                                  // A-164 Wipeout (CAS)
    "I_Plane_Fighter_04_F",                                             // A-149 Gryphon
    "B_Plane_Fighter_01_F",                                             // F/A-181 Black Wasp II
    "O_Heli_Attack_02_dynamicLoadout_black_F",                                     // Mi-48 Kajman (Black)
    "O_Plane_CAS_02_dynamicLoadout_F",                                               // To-199 Neophron (CAS)
    "O_T_VTOL_02_vehicle_dynamicLoadout_F",                                     //Y-32 Xi'an (Infantry Transport)
    "B_AAA_System_01_F",                                     //
    "B_SAM_System_02_F", 
    "B_SAM_System_01_F"
];

// Blacklisted arsenal items such as deployable weapons  that should be bought instead
// Useless if you're using a predefined arsenal in arsenal.sqf
blacklisted_from_arsenal_extension = [
    "B_Respawn_TentDome_F",
    "B_Respawn_TentA_F",
    "B_Respawn_Sleeping_bag_F",
    "B_Respawn_Sleeping_bag_blue_F",
    "B_Patrol_Respawn_bag_F",
    "B_Respawn_Sleeping_bag_brown_F",

    


    "O_UGV_02_Science_backpack_F",
    "RHS_AGS30_Gun_Bag",
    "RHS_AGS30_Tripod_Bag",
    "RHS_DShkM_Gun_Bag",
    "RHS_DShkM_TripodHigh_Bag",
    "RHS_DShkM_TripodLow_Bag",
    "RHS_Kord_Gun_Bag",
    "RHS_Kord_Tripod_Bag",
    "RHS_Kornet_Gun_Bag",
    "RHS_Kornet_Tripod_Bag",
    "RHS_M2_Gun_Bag",
    "RHS_M2_MiniTripod_Bag",
    "RHS_M2_Tripod_Bag",
    "rhs_M252_Bipod_Bag",
    "rhs_M252_Gun_Bag",
    "RHS_Metis_Gun_Bag",
    "RHS_Metis_Tripod_Bag",
    "RHS_Mk19_Gun_Bag",
    "RHS_Mk19_Tripod_Bag",
    "RHS_NSV_Gun_Bag",
    "RHS_NSV_Tripod_Bag",
    "RHS_Podnos_Bipod_Bag",
    "RHS_Podnos_Gun_Bag",
    "RHS_SPG9_Gun_Bag",
    "RHS_SPG9_Tripod_Bag",
    "rhs_Tow_Gun_Bag",
    "rhs_TOW_Tripod_Bag",
    "UK3CB_BAF_L111A1",
    "UK3CB_BAF_L134A1",
    "UK3CB_BAF_L16_Tripod",
    "UK3CB_BAF_L16",
    "UK3CB_BAF_M6",
    "UK3CB_BAF_Tripod",
    "uns_M1_81mm_mortar_US_Bag",
    "uns_M1919_low_US_Bag",
    "uns_M2_60mm_mortar_US_Bag",
    "uns_m2_high_US_Bag",
    "uns_M2_low_US_Bag",
    "uns_M30_107mm_mortar_US_Bag",
    "uns_M60_high_US_Bag",
    "uns_M60_low_US_Bag",
    "uns_MK18_low_US_Bag",
    "uns_STABO_US_Bag",
    "uns_Tripod_Bag",
    "Uns_US_searchlight_Bag"
];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config_extension = [
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];

blacklisted_bag = [
	"U_I_Protagonist_VR",
    "U_C_Protagonist_VR",
    "U_O_Protagonist_VR",
    "U_B_Protagonist_VR",
    "B_Respawn_TentDome_F",
    "B_Respawn_TentA_F",
    "B_Respawn_Sleeping_bag_F",
    "B_Respawn_Sleeping_bag_blue_F",
    "B_Patrol_Respawn_bag_F",
    "B_Respawn_Sleeping_bag_brown_F"

];