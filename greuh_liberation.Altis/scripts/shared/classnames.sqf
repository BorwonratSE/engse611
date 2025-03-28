

// !! IF YOU WANT TO EDIT THIS FOR MODDING PURPOSES, PLEASE USE CLASSNAMES_EXTENSIONS.SQF INSTEAD !!
// If you know what you're doing then sure, proceed :)




if ( isNil "FOB_typename" ) then { FOB_typename = "Land_Cargo_HQ_V1_F"; };
if ( isNil "FOB_box_typename" ) then { FOB_box_typename = "B_Slingload_01_Cargo_F"; };
if ( isNil "FOB_truck_typename" ) then { FOB_truck_typename = "B_Truck_01_box_F"; };
if ( isNil "Arsenal_typename" ) then { Arsenal_typename = "B_supplyCrate_F"; };
if ( isNil "Respawn_truck_typename" ) then { Respawn_truck_typename = "B_Truck_01_medical_F"; };
if ( isNil "huron_typename" ) then { huron_typename = "B_Heli_Transport_01_F"; };
if ( isNil "ammobox_b_typename" ) then { ammobox_b_typename = "Box_NATO_AmmoVeh_F"; };
if ( isNil "ammobox_o_typename" ) then { ammobox_o_typename = "Box_East_AmmoVeh_F"; };
if ( isNil "opfor_ammobox_transport" ) then { opfor_ammobox_transport = "O_Truck_03_transport_F"; };
if ( isNil "commander_classname" ) then { commander_classname = "B_officer_F"; };
if ( isNil "crewman_classname" ) then { crewman_classname = "B_crew_F" };
if ( isNil "pilot_classname" ) then { pilot_classname = "B_Helipilot_F" };


infantry_units = [
	["B_soldier_F",0,0,0],
	["B_soldier_GL_F",0,0,0],
	["B_soldier_AR_F",0,0,0],
	["B_medic_F",0,0,0],
	["B_soldier_M_F",0,0,0],
	["B_engineer_F",0,0,0],
	["B_soldier_LAT_F",0,0,0],
	["B_Sharpshooter_F",0,0,0],
	["B_HeavyGunner_F",0,0,0],
	["B_recon_F",0,0,0],
	["B_recon_medic_F",0,0,0],
	["B_recon_M_F",0,0,0],
	["B_Recon_Sharpshooter_F",0,0,0],
	["B_soldier_AA_F",0,0,0],
	["B_soldier_AT_F",0,0,0],
	["B_sniper_F",0,0,0],
	["B_soldier_PG_F",0,0,0],
	["B_crew_F",0,0,0],
	["B_helipilot_F",0,0,0]
];
if ( isNil "infantry_units_extension" ) then { infantry_units_extension = [] };
if ( isNil "infantry_units_overwrite" ) then { infantry_units_overwrite = false };
if ( infantry_units_overwrite ) then { infantry_units = infantry_units_extension; } else { infantry_units = infantry_units + infantry_units_extension; };

light_vehicles = [
	["SUV_01_base_black_F",0,0,0],                                        // SUV
    ["C_Van_02_transport_F",0,0,0],                                        // Van
    ["C_Hatchback_01_sport_F",0,0,0],                                        // Sport
    ["B_Quadbike_01_F",0,0,0],                                        // Quad Bike
    ["B_LSV_01_unarmed_F",0,0,0],                                     // Prowler
    ["B_MRAP_01_F",0,0,0],                                           // Hunter
    ["I_MRAP_03_F",0,0,0],                                           // Strider
    ["B_UGV_01_F",0,0,0],                                            // UGV Stomper
    ["B_Boat_Transport_01_F",0,0,0],                                 // Assault Boat
    ["B_SDV_01_F",0,0,0],                                             // SDV
    ["B_LSV_01_armed_F",0,10,0],                                      // Prowler (HMG)
    ["B_LSV_01_AT_F",0,10,0],                                         // Prowler (AT)
    ["B_MRAP_01_hmg_F",0,10,0],                                      // Hunter (HMG)
    ["B_MRAP_01_gmg_F",0,10,0],                                      // Hunter (GMG)
    ["I_MRAP_03_hmg_F",0,10,0],                                      // Strider (HMG)
    ["I_MRAP_03_gmg_F",0,10,0],                                      // Strider (GMG)
    ["B_Truck_01_transport_F",0,10,0],                                // HEMTT Transport
    ["B_Truck_01_covered_F",0,10,0],                                  // HEMTT Transport (Covered)
    ["B_UGV_01_rcws_F",0,20,0],                                      // UGV Stomper (RCWS)
    ["B_Boat_Armed_01_minigun_F",0,25,0]                            // Speedboat Minigun
    
];
if ( isNil "light_vehicles_extension" ) then { light_vehicles_extension = [] };
if ( isNil "light_vehicles_overwrite" ) then { light_vehicles_overwrite = false };
if ( light_vehicles_overwrite ) then { light_vehicles = light_vehicles_extension; } else { light_vehicles = light_vehicles + light_vehicles_extension; };

heavy_vehicles = [
    ["B_APC_Wheeled_01_cannon_F",0,60,0],                           // AMV-7 Marshall
    ["I_APC_Wheeled_03_cannon_F",0,65,0],                           // AFV-4 Gorgon
    ["B_APC_Tracked_01_rcws_F",0,50,0],                            // IFV-6c Panther
    ["I_APC_tracked_03_cannon_F",0,75,0],                          // FV-720 Mora
    ["B_APC_Tracked_01_AA_F",0,80,0],                              // IFV-6a Cheetah
    ["I_LT_01_scout_F",0,30,0],                                      // AWC 302 Nyx (AA)
    ["I_LT_01_AT_F",0,30,0],                                       // AWC 302 Nyx (AT)
    ["I_LT_01_cannon_F",0,30,0],                                   // AWC 302 Nyx (Cannon)
    ["B_MBT_01_cannon_F",0,85,0],                                  // M2A1 Slammer
    ["I_MBT_03_cannon_F",0,90,0],                                  // MBT-52 Kuma
    ["B_MBT_01_TUSK_F",0,95,0],                                    // M2A4 Slammer UP
    ["B_AFV_Wheeled_01_cannon_F",0,100,0],                          // Rhino MGS
    ["B_AFV_Wheeled_01_up_cannon_F",0,110,0],                       // Rhino MGS UP
    ["B_MBT_01_arty_F",0,625,0],                                   // M4 Scorcher
    ["O_MBT_02_railgun_F",0,750,0],                                  //T-100X
    ["B_MBT_01_mlrs_F",0,850,0]                                    // M5 Sandstorm MLRS
];
if ( isNil "heavy_vehicles_extension" ) then { heavy_vehicles_extension = [] };
if ( isNil "heavy_vehicles_overwrite" ) then { heavy_vehicles_overwrite = false };
if ( heavy_vehicles_overwrite ) then { heavy_vehicles = heavy_vehicles_extension; } else { heavy_vehicles = heavy_vehicles + heavy_vehicles_extension; };

air_vehicles = [
	["B_Heli_Light_01_F",0,0,0],                                    // MH-9 Hummingbird
    ["I_Heli_Transport_02_F",0,0,0],                                // CH-49 Mohawk
    ["I_Heli_light_03_unarmed_F",0,0,0],                            // WY-55 Hellcat
    ["B_Heli_Transport_03_F",0,0,0],                               // CH-67 Huron (Armed)
    ["B_Heli_Transport_01_camo_F",0,0,0],                          // UH-80 Ghost Hawk (Camo)
    ["B_Heli_Light_01_dynamicLoadout_F",0,60,0],                   // AH-9 Pawnee
    ["I_Heli_light_03_dynamicLoadout_F",0,60,0],                   // WY-55 Hellcat (Armed)
    ["B_Heli_Attack_01_dynamicLoadout_F",0,150,0],                  // AH-99 Blackfoot
    ["huron_typename",0,110,0],                               // UH-80 Ghost Hawk
    ["O_Heli_Attack_02_dynamicLoadout_black_F",0,225,0],                     // Mi-48 Kajman (Black)
    ["B_UAV_02_dynamicLoadout_F",0,150,0],                          // MQ-4A Greyhawk
    ["B_T_UAV_03_dynamicLoadout_F",0,50,0],                        // MQ-12 Falcon
    ["B_UAV_05_F",0,175,0],                                         // UCAV Sentinel
    ["I_Plane_Fighter_03_dynamicLoadout_F",0,100,0],                // A-143 Buzzard
    ["B_Plane_CAS_01_dynamicLoadout_F",0,160,0],                   // A-164 Wipeout (CAS)
    ["I_Plane_Fighter_04_F",0,180,0],                             // A-149 Gryphon
    ["O_Plane_Fighter_02_F",0,300,0],                             // To-201 Shikra
    ["B_Plane_Fighter_01_F",0,200,0],                             // F/A-181 Black Wasp II
    ["O_Plane_CAS_02_dynamicLoadout_F",0,220,0],                             // To-199 Neophron (CAS)
    ["O_T_VTOL_02_vehicle_dynamicLoadout_F",0,300,0],                                     //Y-32 Xi'an (Infantry Transport)
    ["B_T_VTOL_01_armed_F",0,185,0],                               // V-44 X Blackfish (Armed)
    ["B_T_VTOL_01_infantry_F",0,185,0],                               // V-44 X Blackfish (Infantry)
    ["B_T_VTOL_01_vehicle_F",0,185,0]                                 // V-44 X Blackfish (Vehicle)
];
if ( isNil "air_vehicles_extension" ) then { air_vehicles_extension = [] };
if ( isNil "air_vehicles_overwrite" ) then { air_vehicles_overwrite = false };
if ( air_vehicles_overwrite ) then { air_vehicles = air_vehicles_extension; } else { air_vehicles = air_vehicles + air_vehicles_extension; };

static_vehicles = [
	["B_AAA_System_01_F",0,1000,0],                               
    ["B_SAM_System_02_F",0,800,0], 
    ["B_SAM_System_01_F",0,600,0],
    ["B_SAM_System_03_F",0,400,0],
    ["B_Radar_System_01_F",0,100,0]

];
if ( isNil "static_vehicles_extension" ) then { static_vehicles_extension = [] };
if ( isNil "static_vehicles_overwrite" ) then { static_vehicles_overwrite = false };
if ( static_vehicles_overwrite ) then { static_vehicles = static_vehicles_extension; } else { static_vehicles = static_vehicles + static_vehicles_extension; };

buildings = [
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["BWA3_Flag_Ger_F",0,0,0],
    ["Flag_UK_F",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Land_Medevac_house_V1_F",0,0,0],
    ["Land_Medevac_HQ_V1_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["CamoNet_BLUFOR_F",0,0,0],
    ["CamoNet_BLUFOR_open_F",0,0,0],
    ["CamoNet_BLUFOR_big_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_PortableLight_double_F",0,0,0],
    ["Land_LampSolar_F",0,0,0],
    ["Land_LampHalogen_F",0,0,0],
    ["Land_LampStreet_small_F",0,0,0],
    ["Land_LampAirport_F",0,0,0],
    ["Land_HelipadCircle_F",0,0,0],                                     
    ["Land_HelipadRescue_F",0,0,0],                                    
    ["PortableHelipadLight_01_blue_F",0,0,0],
    ["PortableHelipadLight_01_green_F",0,0,0],
    ["PortableHelipadLight_01_red_F",0,0,0],
    ["Land_CampingChair_V1_F",0,0,0],
    ["Land_CampingChair_V2_F",0,0,0],
    ["Land_CampingTable_F",0,0,0],
    ["MapBoard_altis_F",0,0,0],
    ["MapBoard_stratis_F",0,0,0],
    ["MapBoard_seismic_F",0,0,0],
    ["Land_Pallet_MilBoxes_F",0,0,0],
    ["Land_PaperBox_open_empty_F",0,0,0],
    ["Land_PaperBox_open_full_F",0,0,0],
    ["Land_PaperBox_closed_F",0,0,0],
    ["Land_DieselGroundPowerUnit_01_F",0,0,0],
    ["Land_ToolTrolley_02_F",0,0,0],
    ["Land_WeldingTrolley_01_F",0,0,0],
    ["Land_Workbench_01_F",0,0,0],
    ["Land_GasTank_01_blue_F",0,0,0],
    ["Land_GasTank_01_khaki_F",0,0,0],
    ["Land_GasTank_01_yellow_F",0,0,0],
    ["Land_GasTank_02_F",0,0,0],
    ["Land_BarrelWater_F",0,0,0],
    ["Land_BarrelWater_grey_F",0,0,0],
    ["Land_WaterBarrel_F",0,0,0],
    ["Land_WaterTank_F",0,0,0],
    ["Land_BagFence_Round_F",0,0,0],
    ["Land_BagFence_Short_F",0,0,0],
    ["Land_BagFence_Long_F",0,0,0],
    ["Land_BagFence_Corner_F",0,0,0],
    ["Land_BagFence_End_F",0,0,0],
    ["Land_BagBunker_Small_F",0,0,0],
    ["Land_BagBunker_Large_F",0,0,0],
    ["Land_BagBunker_Tower_F",0,0,0],
    ["Land_HBarrier_1_F",0,0,0],
    ["Land_HBarrier_3_F",0,0,0],
    ["Land_HBarrier_5_F",0,0,0],
    ["Land_HBarrier_Big_F",0,0,0],
    ["Land_HBarrierWall4_F",0,0,0],
    ["Land_HBarrierWall6_F",0,0,0],
    ["Land_HBarrierWall_corner_F",0,0,0],
    ["Land_HBarrierWall_corridor_F",0,0,0],
    ["Land_HBarrierTower_F",0,0,0],
    ["Land_CncBarrierMedium_F",0,0,0],
    ["Land_CncBarrierMedium4_F",0,0,0],
    ["Land_Concrete_SmallWall_4m_F",0,0,0],
    ["Land_Concrete_SmallWall_8m_F",0,0,0],
    ["Land_CncShelter_F",0,0,0],
    ["Land_CncWall1_F",0,0,0],
    ["Land_CncWall4_F",0,0,0],
    ["Land_Sign_WarningMilitaryArea_F",0,0,0],
    ["Land_Sign_WarningMilAreaSmall_F",0,0,0],
    ["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
    ["Land_Razorwire_F",0,0,0],
    ["Land_ClutterCutter_large_F",0,0,0]
];
if ( isNil "buildings_extension" ) then { buildings_extension = [] };
if ( isNil "buildings_overwrite" ) then { buildings_overwrite = false };
if ( buildings_overwrite ) then { buildings = buildings_extension; } else { buildings = buildings + buildings_extension; };

support_vehicles = [
	[Arsenal_typename,10,0,0],
	[Respawn_truck_typename,0,100,0],
	[FOB_box_typename,30,50,0],
	[FOB_truck_typename,30,50,5],
	["B_APC_Tracked_01_CRV_F",0,30,10],
	["C_Offroad_01_repair_F",5,0,2],
	["B_Truck_01_Repair_F",10,0,5],
	["B_Truck_01_fuel_F",10,0,5],
	["B_Truck_01_ammo_F",10,0,5],
	["B_Slingload_01_Repair_F",5,0,0],
	["B_Slingload_01_Fuel_F",5,0,0],
	["B_Slingload_01_Ammo_F",5,0,0],
	["Box_NATO_AmmoVeh_F",0,154,0],
	["Box_East_AmmoVeh_F",0,115,0]
];
if ( isNil "support_vehicles_extension" ) then { support_vehicles_extension = [] };
if ( isNil "support_vehicles_overwrite" ) then { support_vehicles_overwrite = false };
if ( support_vehicles_overwrite ) then { support_vehicles = support_vehicles_extension; } else { support_vehicles = support_vehicles + support_vehicles_extension; };

if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F" ]; };
if ( isNil "blufor_squad_inf" ) then { blufor_squad_inf = [] };
if ( count blufor_squad_inf == 0 ) then { blufor_squad_inf = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_AR_F","B_HeavyGunner_F","B_medic_F","B_Soldier_GL_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_soldier_M_F","B_Sharpshooter_F" ]; };
if ( isNil "blufor_squad_at" ) then { blufor_squad_at = [] };
if ( count blufor_squad_at == 0 ) then { blufor_squad_at = [ "B_Soldier_SL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_medic_F","B_soldier_F" ]; };
if ( isNil "blufor_squad_aa" ) then { blufor_squad_aa = [] };
if ( count blufor_squad_aa == 0 ) then { blufor_squad_aa = [ "B_Soldier_SL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_medic_F","B_soldier_F" ]; };
if ( isNil "blufor_squad_recon" ) then { blufor_squad_recon = [] };
if ( count blufor_squad_recon == 0 ) then { blufor_squad_recon = [ "B_recon_TL_F","B_recon_F","B_recon_exp_F","B_recon_medic_F","B_recon_LAT_F","B_recon_LAT_F","B_recon_M_F","B_Recon_Sharpshooter_F","B_recon_F" ]; };
if ( isNil "blufor_squad_para" ) then { blufor_squad_para = [] };
if ( count blufor_squad_para == 0 ) then { blufor_squad_para = [ "B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F" ]; };
if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F"]; };
if ( isNil "uavs" ) then { uavs = [] }; uavs = [] + uavs + [ "B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UGV_01_F","B_UGV_01_rcws_F" ];
if ( isNil "elite_vehicles_extension" ) then { elite_vehicles_extension = [] }; elite_vehicles = [] + elite_vehicles_extension + [];
if ( isNil "ai_resupply_sources_extension" ) then { ai_resupply_sources_extension = [] };
ai_resupply_sources = [] + ai_resupply_sources_extension + [ Respawn_truck_typename, huron_typename, Arsenal_typename, "B_Slingload_01_Ammo_F", "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "B_Truck_01_medical_F" ];
if ( isNil "vehicle_repair_sources_extension" ) then { vehicle_repair_sources_extension = [] };
vehicle_repair_sources = [] + vehicle_repair_sources_extension + [ "B_APC_Tracked_01_CRV_F", "C_Offroad_01_repair_F", "B_Truck_01_Repair_F", "B_Slingload_01_Repair_F", "B_Truck_01_medical_F" ];
if ( isNil "vehicle_rearm_sources_extension" ) then { vehicle_rearm_sources_extension = [] };
vehicle_rearm_sources = [] + vehicle_rearm_sources_extension + [ /*"B_APC_Tracked_01_CRV_F",*/ "B_Truck_01_ammo_F", "B_Slingload_01_Ammo_F", "B_Truck_01_medical_F" ];
if ( isNil "vehicle_refuel_sources_extension" ) then { vehicle_refuel_sources_extension = [] };
vehicle_refuel_sources = [] + vehicle_refuel_sources_extension +  [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_fuel_F", "B_Slingload_01_Fuel_F", "B_Truck_01_medical_F" ];
squads = [
	[blufor_squad_inf_light,20,0,0],
	[blufor_squad_inf,30,0,0],
	[blufor_squad_at,20,25,0],
	[blufor_squad_aa,20,25,0],
	[blufor_squad_recon,25,0,0],
	[blufor_squad_para,20,0,0]
];

if ( isNil "opfor_sentry") then { opfor_sentry = "O_Soldier_lite_F"; };
if ( isNil "opfor_rifleman") then { opfor_rifleman = "O_Soldier_F"; };
if ( isNil "opfor_grenadier") then { opfor_grenadier = "O_Soldier_GL_F"; };
if ( isNil "opfor_squad_leader") then { opfor_squad_leader = "O_Soldier_SL_F"; };
if ( isNil "opfor_team_leader") then { opfor_team_leader = "O_Soldier_TL_F"; };
if ( isNil "opfor_marksman") then { opfor_marksman = "O_soldier_M_F"; };
if ( isNil "opfor_machinegunner") then { opfor_machinegunner = "O_Soldier_AR_F"; };
if ( isNil "opfor_heavygunner") then { opfor_heavygunner = "O_HeavyGunner_F"; };
if ( isNil "opfor_medic") then { opfor_medic = "O_medic_F"; };
if ( isNil "opfor_rpg") then { opfor_rpg = "O_Soldier_LAT_F"; };
if ( isNil "opfor_at") then { opfor_at = "O_Soldier_AT_F"; };
if ( isNil "opfor_aa") then { opfor_aa = "O_Soldier_AA_F"; };
if ( isNil "opfor_officer") then { opfor_officer = "O_officer_F"; };
if ( isNil "opfor_sharpshooter") then { opfor_sharpshooter = "O_Sharpshooter_F"; };
if ( isNil "opfor_sniper") then { opfor_sniper = "O_sniper_F"; };
if ( isNil "opfor_engineer") then { opfor_engineer = "O_engineer_F"; };
if ( isNil "opfor_paratrooper") then { opfor_paratrooper = "O_soldier_PG_F"; };
if ( isNil "opfor_mrap") then { opfor_mrap = "O_MRAP_02_F"; };
if ( isNil "opfor_mrap_armed") then { opfor_mrap_armed = "O_MRAP_02_gmg_F"; };
if ( isNil "opfor_transport_helo") then { opfor_transport_helo = "O_Heli_Transport_04_bench_F"; };
if ( isNil "opfor_transport_truck") then { opfor_transport_truck = "O_Truck_03_covered_F"; };
if ( isNil "opfor_fuel_truck") then { opfor_fuel_truck = "O_Truck_03_fuel_F"; };
if ( isNil "opfor_ammo_truck") then { opfor_ammo_truck = "O_Truck_03_ammo_F"; };
if ( isNil "opfor_fuel_container") then { opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F"; };
if ( isNil "opfor_ammo_container") then { opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F"; };
if ( isNil "opfor_flag") then { opfor_flag = "Flag_CSAT_F"; };

militia_squad = [
	"O_V_Soldier_LAT_hex_F",                                                     // Rifleman (Lite)
    "O_V_Soldier_LAT_hex_F",                                                     // Rifleman (Lite)
    "O_V_Soldier_LAT_hex_F",                                                     // Rifleman
    "O_V_Soldier_LAT_hex_F",                                                     // Rifleman
    "O_T_Soldier_HAT_F",                                                 // Rifleman (AT)
    "O_HeavyGunner_F",                                                  // Autorifleman
    "O_V_Soldier_M_ghex_F",                                                   // Marksman
    "O_V_Soldier_Medic_hex_F",                                               // Medic
	"O_T_Soldier_AT_F",
    "O_R_Patrol_Soldier_Engineer_F"                                                    // Engineer
];
if ( isNil "militia_squad_extension" ) then { militia_squad_extension = [] };
if ( isNil "militia_squad_overwrite" ) then { militia_squad_overwrite = false };
if ( militia_squad_overwrite ) then { militia_squad = militia_squad_extension; } else { militia_squad = militia_squad + militia_squad_extension; };

militia_vehicles = [
	"O_T_MBT_04_command_F"                                            // T-140K Angara
];
if ( isNil "militia_vehicles_extension" ) then { militia_vehicles_extension = [] };
if ( isNil "militia_vehicles_overwrite" ) then { militia_vehicles_overwrite = false };
if ( militia_vehicles_overwrite ) then { militia_vehicles = militia_vehicles_extension; } else { militia_vehicles = militia_vehicles + militia_vehicles_extension; };

opfor_vehicles = [
    "O_T_MBT_02_railgun_F",
	"O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_T_VTOL_02_infantry_dynamicLoadout_F",                             // Y-32 Xi'an (Infantry)
    "O_T_VTOL_02_infantry_dynamicLoadout_F",                             // Y-32 Xi'an (Infantry)
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_MBT_04_command_F",                                             // T-140K Angara
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_MBT_02_cannon_ghex_F",                                         // T-100 Varsuk
    "O_T_MBT_04_cannon_F"                                              // T-140 Angara
];
if ( isNil "opfor_vehicles_extension" ) then { opfor_vehicles_extension = [] };
if ( isNil "opfor_vehicles_overwrite" ) then { opfor_vehicles_overwrite = false };
if ( opfor_vehicles_overwrite ) then { opfor_vehicles = opfor_vehicles_extension; } else { opfor_vehicles = opfor_vehicles + opfor_vehicles_extension; };

opfor_vehicles_low_intensity = [
	"O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MBT_04_command_F",                                             // T-140K Angara
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_T_APC_Tracked_02_cannon_ghex_F"                                  // BTR-K Kamysh
];
if ( isNil "opfor_vehicles_low_intensity_extension" ) then { opfor_vehicles_low_intensity_extension = [] };
if ( isNil "opfor_vehicles_low_intensity_overwrite" ) then { opfor_vehicles_low_intensity_overwrite = false };
if ( opfor_vehicles_low_intensity_overwrite ) then { opfor_vehicles_low_intensity = opfor_vehicles_low_intensity_extension; } else { opfor_vehicles_low_intensity = opfor_vehicles_low_intensity + opfor_vehicles_low_intensity_extension; };

opfor_battlegroup_vehicles = [
    "O_MBT_02_railgun_F",
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_MBT_02_cannon_ghex_F",                                         // T-100 Varsuk
    "O_T_MBT_04_cannon_F",                                              // T-140 Angara
    "O_T_MBT_04_command_F",                                             // T-140K Angara
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];
if ( isNil "opfor_battlegroup_vehicles_extension" ) then { opfor_battlegroup_vehicles_extension = [] };
if ( isNil "opfor_battlegroup_vehicles_overwrite" ) then { opfor_battlegroup_vehicles_overwrite = false };
if ( opfor_battlegroup_vehicles_overwrite ) then { opfor_battlegroup_vehicles = opfor_battlegroup_vehicles_extension; } else { opfor_battlegroup_vehicles = opfor_battlegroup_vehicles + opfor_battlegroup_vehicles_extension; };

opfor_battlegroup_vehicles_low_intensity = [
	"O_T_MRAP_02_ghex_F",                                               // Ifrit
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MBT_04_command_F",                                             // T-140K Angara
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F"                                       // Mi-290 Taru (Bench)
];
if ( isNil "opfor_battlegroup_vehicles_low_intensity_extension" ) then { opfor_battlegroup_vehicles_low_intensity_extension = [] };
if ( isNil "opfor_battlegroup_vehicles_low_intensity_overwrite" ) then { opfor_battlegroup_vehicles_low_intensity_overwrite = false };
if ( opfor_battlegroup_vehicles_low_intensity_overwrite ) then { opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity_extension; } else { opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity + opfor_battlegroup_vehicles_low_intensity_extension; };

opfor_troup_transports = [
	"O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_T_VTOL_02_infantry_dynamicLoadout_F",                             // Y-32 Xi'an (Infantry)
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];
if ( isNil "opfor_troup_transports_extension" ) then { opfor_troup_transports_extension = [] };
if ( isNil "opfor_troup_transports_overwrite" ) then { opfor_troup_transports_overwrite = false };
if ( opfor_troup_transports_overwrite ) then { opfor_troup_transports = opfor_troup_transports_extension; } else { opfor_troup_transports = opfor_troup_transports + opfor_troup_transports_extension; };

opfor_choppers = [
	"O_Plane_Fighter_02_F",                                             // To-201 Shikra
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                            // Y-32 Xi'an (Infantry)  
];
if ( isNil "opfor_choppers_extension" ) then { opfor_choppers_extension = [] };
if ( isNil "opfor_choppers_overwrite" ) then { opfor_choppers_overwrite = false };
if ( opfor_choppers_overwrite ) then { opfor_choppers = opfor_choppers_extension; } else { opfor_choppers = opfor_choppers + opfor_choppers_extension; };

opfor_air = [
	"O_Plane_Fighter_02_Stealth_F",                                             // To-201 Shikra (Stealth)
    "O_Plane_Fighter_02_F"                                              // To-201 Shikra
];
if ( isNil "opfor_air_extension" ) then { opfor_air_extension = [] };
if ( isNil "opfor_air_overwrite" ) then { opfor_air_overwrite = false };
if ( opfor_air_overwrite ) then { opfor_air = opfor_air_extension; } else { opfor_air = opfor_air + opfor_air_extension; };


civilians = [
	"C_man_1",
	"C_man_polo_6_F",
	"C_man_polo_3_F",
	"C_man_polo_2_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_1_F",
	"C_man_p_beggar_F",
	"C_man_1_2_F",
	"C_man_p_fugitive_F",
	"C_man_hunter_1_F",
	"C_journalist_F",
	"C_man_shorts_2_F",
	"C_man_w_worker_F"
];
if ( isNil "civilians_extension" ) then { civilians_extension = [] };
if ( isNil "civilians_overwrite" ) then { civilians_overwrite = false };
if ( civilians_overwrite ) then { civilians = civilians_extension; } else { civilians = civilians + civilians_extension; };

civilian_vehicles = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_01_fuel_F",
	"C_Quadbike_01_F"
];
if ( isNil "civilian_vehicles_extension" ) then { civilian_vehicles_extension = [] };
if ( isNil "civilian_vehicles_overwrite" ) then { civilian_vehicles_overwrite = false };
if ( civilian_vehicles_overwrite ) then { civilian_vehicles = civilian_vehicles_extension; } else { civilian_vehicles = civilian_vehicles + civilian_vehicles_extension; };

/* - Default arsenal blacklist method.
Useless if you're using anything other than "kp_liberation_arsenal = 0;" above. A whitelisted arsenal is always more performance friendly then a blacklisted arsenal.
REMEMBER: All static turret and UAV bags should be defined here, to stop players from exploiting free resources via the virtual arsenal.    */
blacklisted_from_arsenal = [
    "U_I_Protagonist_VR",
    "U_C_Protagonist_VR",
    "U_O_Protagonist_VR",
    "U_B_Protagonist_VR",
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

box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "O_Truck_03_covered_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "I_Heli_Transport_02_F", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];
if ( isNil "box_transport_config_extension" ) then { box_transport_config_extension = [] };
box_transport_config = [] + box_transport_config + box_transport_config_extension;

infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [opfor_team_leader,opfor_machinegunner,opfor_medic,opfor_rpg,opfor_sentry,opfor_sentry,opfor_sentry,opfor_sentry];
opfor_squad_8_standard = [opfor_squad_leader,opfor_team_leader,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_grenadier,opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader,opfor_machinegunner,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_sharpshooter,opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_at,opfor_at,opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_aa,opfor_aa,opfor_aa];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F" ];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "O_G_Soldier_SL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F","O_G_Soldier_TL_F"];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions_when_building = [
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_yellow_F",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_HelipadSquare_F",
	"Sign_Sphere100cm_F",
	"TMR_Autorest_Georef",
	"Land_ClutterCutter_large_F"
];
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";


// Items which should be added as allowed Items, when they get blacklisted, even if they are not in the blacklisted_from_arsenal array
KP_liberation_allowed_items_extension = [
    "ACE_Chemlight_Shield_Blue",
    "ACE_Chemlight_Shield_Green",
    "ACE_Chemlight_Shield_Orange",
    "ACE_Chemlight_Shield_Red",
    "ACE_Chemlight_Shield_White",
    "ACE_Chemlight_Shield_Yellow",
    "ACE_launch_NLAW_Used_F",
    "ACE_PreloadedMissileDummy_CUP",
    "ACE_PreloadedMissileDummy_Igla_CUP",
    "ACE_PreloadedMissileDummy_M72A6_CUP",
    "ACE_PreloadedMissileDummy_NLAW_CUP",
    "ACE_PreloadedMissileDummy_RPG18_CUP",
    "ACE_PreloadedMissileDummy_Stinger_CUP",
    "ACE_PreloadedMissileDummy_Strela_2_CUP",
    "ACE_ReserveParachute",
    "BWA3_acc_LLM01_flash_tan",
    "BWA3_acc_LLM01_flash_underbarrel",
    "BWA3_acc_LLM01_flash",
    "BWA3_acc_LLM01_laser_tan",
    "BWA3_acc_LLM01_laser_underbarrel",
    "BWA3_acc_LLM01_laser",
    "BWA3_acc_VarioRay_flash",
    "BWA3_acc_VarioRay_laser",
    "BWA3_Bunkerfaust",
    "BWA3_G36A2_pip",
    "BWA3_G36A2_tan_pip",
    "BWA3_optic_CompM2_G36A2",
    "BWA3_optic_CompM2_tan_G36A2",
    "BWA3_optic_EOTech_G36A2",
    "BWA3_optic_EOTech_Mag_Off",
    "BWA3_optic_EOTech_Mag_On",
    "BWA3_optic_EOTech_sand_G36A2",
    "BWA3_optic_EOTech_tan_Mag_Off",
    "BWA3_optic_EOTech_tan_Mag_On",
    "BWA3_optic_EOTech552_G36A2",
    "BWA3_optic_EOTech552_tan_G36A2",
    "BWA3_optic_Hensoldt_NSV",
    "BWA3_optic_M5Xi_MSR_MicroT2_pip",
    "BWA3_optic_M5Xi_MSR_pip",
    "BWA3_optic_M5Xi_Tremor3_MicroT2_pip",
    "BWA3_optic_M5Xi_Tremor3_pip",
    "BWA3_optic_MicroT1_G36A2",
    "BWA3_optic_MicroT2_G36A2",
    "BWA3_optic_NSA80_G36",
    "BWA3_optic_PMII_DMR_MicroT1_front_NSV_pip",
    "BWA3_optic_PMII_DMR_MicroT1_front_NSV",
    "BWA3_optic_PMII_DMR_MicroT1_front_pip",
    "BWA3_optic_PMII_DMR_MicroT1_rear_NSV_pip",
    "BWA3_optic_PMII_DMR_MicroT1_rear_NSV",
    "BWA3_optic_PMII_DMR_MicroT1_rear_pip",
    "BWA3_optic_PMII_DMR_NSV_pip",
    "BWA3_optic_PMII_DMR_NSV",
    "BWA3_optic_PMII_DMR_pip",
    "BWA3_optic_PMII_ShortdotCC_pip",
    "BWA3_optic_RSAS_brown_G36A2",
    "BWA3_optic_RSAS_G36A2",
    "BWA3_optic_RSAS_sand_G36A2",
    "BWA3_optic_RSAS_tan_G36A2",
    "BWA3_optic_ZO4x30_brown_IRV",
    "BWA3_optic_ZO4x30_brown_NSV",
    "BWA3_optic_ZO4x30_brown_pip",
    "BWA3_optic_ZO4x30_brown_RSAS_IRV_pip",
    "BWA3_optic_ZO4x30_brown_RSAS_IRV",
    "BWA3_optic_ZO4x30_brown_RSAS_NSV_pip",
    "BWA3_optic_ZO4x30_brown_RSAS_NSV",
    "BWA3_optic_ZO4x30_brown_RSAS_pip",
    "BWA3_optic_ZO4x30_IRV",
    "BWA3_optic_ZO4x30_MicroT2_brown_IRV",
    "BWA3_optic_ZO4x30_MicroT2_brown_NSV",
    "BWA3_optic_ZO4x30_MicroT2_IRV",
    "BWA3_optic_ZO4x30_MicroT2_NSV",
    "BWA3_optic_ZO4x30_NSV",
    "BWA3_optic_ZO4x30_pip",
    "BWA3_optic_ZO4x30_RSAS_IRV_pip",
    "BWA3_optic_ZO4x30_RSAS_IRV",
    "BWA3_optic_ZO4x30_RSAS_NSV_pip",
    "BWA3_optic_ZO4x30_RSAS_NSV",
    "BWA3_optic_ZO4x30_RSAS_pip",
    "BWA3_optic_ZO4x30i_MicroT2_pip",
    "BWA3_optic_ZO4x30i_MicroT2_sand_pip",
    "BWA3_optic_ZO4x30i_pip",
    "BWA3_optic_ZO4x30i_RSAS_pip",
    "BWA3_optic_ZO4x30i_RSAS_sand_pip",
    "BWA3_optic_ZO4x30i_sand_pip",
    "BWA3_PzF3_Used",
    "BWA3_PzF3",
    "BWA3_RGW90_Used",
    "BWA3_RGW90",
    "ItemRadioAcreFlagged",
    "rhs_acc_ekp8_18b",
    "rhs_acc_ekp8_18c",
    "rhs_acc_ekp8_18d",
    "rhs_m136_hedp_mag",
    "rhs_m136_hp_mag",
    "rhs_m136_mag",
    "rhs_m72a7_mag",
    "rhs_rpg26_mag",
    "rhs_rshg2_mag",
    "rhs_weap_M136_used",
    "rhsusf_acc_anpeq15_bk_light_h",
    "rhsusf_acc_g33_T1_flip",
    "rhsusf_acc_g33_xps3_flip",
    "rhsusf_acc_g33_xps3_tan_flip",
    "sma_spitfire_03_rds_low_ard_red",
    "UK3CB_BAF_AT4_CS_AP_Mag",
    "UK3CB_BAF_Javelin_Launcher"
];