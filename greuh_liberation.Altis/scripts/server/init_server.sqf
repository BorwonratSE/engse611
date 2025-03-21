[] call compileFinal preprocessFileLineNumbers "scripts\loadouts\init_loadouts.sqf";
send_aircraft_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\send_aircraft_remote_call.sqf";
// AI
add_civ_waypoints = compileFinal preprocessFileLineNumbers "scripts\server\ai\add_civ_waypoints.sqf";
add_defense_waypoints = compileFinal preprocessFileLineNumbers "scripts\server\ai\add_defense_waypoints.sqf";
battlegroup_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\battlegroup_ai.sqf";
building_defence_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\building_defence_ai.sqf";
csat_abandon_vehicle = compileFinal preprocessFileLineNumbers "scripts\server\ai\csat_abandon_vehicle.sqf";
patrol_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\patrol_ai.sqf";
prisonner_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\prisonner_ai.sqf";
troup_transport = compileFinal preprocessFileLineNumbers "scripts\server\ai\troup_transport.sqf";

// Battlegroup
spawn_air = compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\spawn_air.sqf";
spawn_battlegroup = compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\spawn_battlegroup.sqf";

// Game
check_victory_conditions = compileFinal preprocessFileLineNumbers "scripts\server\game\check_victory_conditions.sqf";

// Patrol
manage_one_civilian_patrol = compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_one_civilian_patrol.sqf";
manage_one_patrol = compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_one_patrol.sqf";
reinforcements_manager = compileFinal preprocessFileLineNumbers "scripts\server\patrols\reinforcements_manager.sqf";
send_paratroopers = compileFinal preprocessFileLineNumbers "scripts\server\patrols\send_paratroopers.sqf";

// Resources
recalculate_caps = compileFinal preprocessFileLineNumbers "scripts\server\resources\recalculate_caps.sqf";

// Secondary objectives
fob_hunting = compileFinal preprocessFileLineNumbers "scripts\server\secondary\fob_hunting.sqf";
convoy_hijack = compileFinal preprocessFileLineNumbers "scripts\server\secondary\convoy_hijack.sqf";
search_and_rescue = compileFinal preprocessFileLineNumbers "scripts\server\secondary\search_and_rescue.sqf";

// Sector
attack_in_progress_fob = compileFinal preprocessFileLineNumbers "scripts\server\sector\attack_in_progress_fob.sqf";
attack_in_progress_sector = compileFinal preprocessFileLineNumbers "scripts\server\sector\attack_in_progress_sector.sqf";
destroy_fob = compileFinal preprocessFileLineNumbers "scripts\server\sector\destroy_fob.sqf";
ied_manager = compileFinal preprocessFileLineNumbers "scripts\server\sector\ied_manager.sqf";
manage_ammoboxes = compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_ammoboxes.sqf";
manage_one_sector = compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_one_sector.sqf";
wait_to_spawn_sector = compileFinal preprocessFileLineNumbers "scripts\server\sector\wait_to_spawn_sector.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\server\base\startgame.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\base\huron_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\counter_battlegroup.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\random_battlegroups.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\readiness_increase.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\apply_default_permissions.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\apply_saved_scores.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\capture_vehicles.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\clean.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\cleanup_vehicles.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\manage_time.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\manage_weather.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\periodic_save.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\playtime.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\save_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\spawn_radio_towers.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\game\zeus_synchro.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\offload_calculation.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\offload_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\show_fps.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\patrols\civilian_patrols.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_patrols.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\patrols\reinforcements_resetter.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\manage_resources.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\recalculate_resources.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\recalculate_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\resources\unit_cap.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\sector\lose_sectors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_sectors.sqf";

{
	if ( (_x != player) && (_x distance (getmarkerpos GRLIB_respawn_marker) < 200 ) ) then {
		deleteVehicle _x;
	};
} foreach allUnits;

if (KP_liberation_restart > 0) then {
    execVM "scripts\server\game\server_restart.sqf";
};
