class Params
{
	class MissionOptions{
		title = $STR_PARAMS_MISSIONOPTIONS;
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Unitcap{
		title = $STR_PARAMS_UNITCAP;
		values[] = {0.5,0.75,1,1.25,1.5,2};
		texts[] = {$STR_PARAMS_UNITCAP1,$STR_PARAMS_UNITCAP2,$STR_PARAMS_UNITCAP3,$STR_PARAMS_UNITCAP4,$STR_PARAMS_UNITCAP5,$STR_PARAMS_UNITCAP6};
		default = 1;
	};
	class Difficulty {
		title = $STR_PARAMS_DIFFICULTY;
		values[] = { 0.5, 0.75, 1, 1.25, 1.5, 2, 4, 10 };
		texts[] = { $STR_PARAMS_DIFFICULTY1, $STR_PARAMS_DIFFICULTY2, $STR_PARAMS_DIFFICULTY3, $STR_PARAMS_DIFFICULTY4, $STR_PARAMS_DIFFICULTY5, $STR_PARAMS_DIFFICULTY6, $STR_PARAMS_DIFFICULTY7, $STR_PARAMS_DIFFICULTY8 };
		default = 10;
	};
	class Aggressivity{
		title = $STR_AGGRESSIVITY_PARAM;
		values[] = {0.25,0.5,1,2,4};
		texts[] = {$STR_AGGRESSIVITY_PARAM0, $STR_AGGRESSIVITY_PARAM1,$STR_AGGRESSIVITY_PARAM2,$STR_AGGRESSIVITY_PARAM3,$STR_AGGRESSIVITY_PARAM4};
		default = 2;
	};
	class AdaptToPlayercount{
		title = $STR_PARAM_ADAPT_TO_PLAYERCOUNT;
		values[] = {1,0};
		texts[] = {$STR_PARAMS_ENABLED,$STR_PARAMS_DISABLED};
		default = 0;
	};
	class DayDuration {
        title = $STR_PARAMS_DAYDURATION;
        values[] = {14, 12, 10, 8, 6, 4, 3, 2, 1};
        texts[] = {"30","1","2","3","4","6","8","12","24"};
        default = 10;
    };
	class ShorterNights {
		title = $STR_SHORTER_NIGHTS_PARAM;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class Weather {
		title = $STR_WEATHER_PARAM;
		values[] = { 1,2,3 };
		texts[] = { $STR_WEATHER_PARAM1, $STR_WEATHER_PARAM2, $STR_WEATHER_PARAM3 };
		default = 3;
	};
	class ResourcesMultiplier {
		title = $STR_PARAMS_RESOURCESMULTIPLIER;
		values[] = { 0.25, 0.5, 0.75, 1, 1.25, 1.5, 2, 3, 5, 10, 20, 50 };
		texts[] = { "x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3","x5","x10","x20","x50" };
		default = 1;
	};
	class ArsenalType {
        title = $STR_PARAMS_ARSENAL;
        values[] = {0, 1};
        texts[] = {$STR_PARAMS_ARSENAL_BI, $STR_PARAMS_ARSENAL_ACE};
        default = 0;
    };
	class ArsenalUsePreset {
        title = $STR_PARAMS_ARSENALUSEPRESET;
        values[] = { 0, 1 };
        texts[] = { $STR_PARAMS_NORESTRICTIONS, $STR_PARAMS_USEPRESET };
        default = 1;
    };
	class Spacer1 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Fatigue {
		title = $STR_PARAMS_FATIGUE;
		values[] = { 0, 1 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
		default = 0;
	};
	class ReviveMode {
        title = $STR_A3_ReviveMode;
        isGlobal = 1;
        values[] = {-100,0,1};                                                                                                                                                                               
        texts[] = {$STR_A3_MissionDefault, $STR_A3_Disabled, $STR_A3_EnabledForAllPlayers};                        
        default =  0;
        function = "bis_fnc_paramReviveMode";
    };
	class Civilians{
		title = $STR_PARAMS_CIVILIANS;
		values[] = {0,0.5,1,2};
		texts[] = {$STR_PARAMS_CIVILIANS1,$STR_PARAMS_CIVILIANS2,$STR_PARAMS_CIVILIANS3,$STR_PARAMS_CIVILIANS4};
		default = 1;
	};
	class TeamkillPenalty{
		title = $STR_PARAM_TEAMKILL_PENALTY;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class PassiveIncome{
		title = $STR_PARAM_PASSIVE_INCOME;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class AmmoBounties{
		title = $STR_AMMO_BOUNTIES;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class CivPenalties{
		title = $STR_CIV_PENALTIES;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class HaloJump{
		title = $STR_HALO_PARAM;
		values[] = {1,5,10,15,20,30,0};
		texts[] = { $STR_HALO_PARAM1, $STR_HALO_PARAM2, $STR_HALO_PARAM3, $STR_HALO_PARAM4, $STR_HALO_PARAM5, $STR_HALO_PARAM6, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class BluforDefenders{
		title = $STR_PARAM_BLUFOR_DEFENDERS;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class Autodanger{
		title = $STR_PARAM_AUTODANGER;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class MaximumFobs{
		title = $STR_PARAM_FOBS_COUNT;
		values[] = {3,5,7,10,15,20,26};
		texts[] = {3,5,7,10,15,20,26};
		default = 26;
	};
	class MaxSquadSize{
		title = $STR_PARAM_SQUAD_SIZE;
		values[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
		texts[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
		default = 6;
	};
	class Space2 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class TechnicalOptions{
		title = $STR_PARAMS_TECHNICALOPTIONS;
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Permissions{
		title = $STR_PERMISSIONS_PARAM;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class CleanupVehicles {
		title = $STR_CLEANUP_PARAM;
		values[] = { 0,1,2,4 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_CLEANUP_PARAM1, $STR_CLEANUP_PARAM2, $STR_CLEANUP_PARAM3 };
		default = 1;
	};
	class Introduction {
		title = $STR_PARAMS_INTRO;
		values[] = { 1, 0 };
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class DeploymentCinematic {
		title = $STR_PARAMS_DEPLOYMENTCAMERA;
		values[] = { 1, 0 };
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class FirstFob {
		title = $STR_PARAMS_FIRSTFOB;
		values[] = { 1, 0 };
		texts[] = { $STR_YES, $STR_NO };
		default = 0;
	};
	class Whitelist {
		title = $STR_WHITELIST_PARAM;
		values[] = { 1, 0 };
		texts[] = { $STR_WHITELIST_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class ServerRestart {
        title = $STR_RESTART_PARAM;
        values[] = {0,1,2,3,4,5,6};
        texts[] = {$STR_PARAMS_DISABLED,"1","2","3","4","5","6"};
        default = 0;
    };
	class WipeSave1{
		title = $STR_WIPE_TITLE;
		values[] = {0,1};
		texts[] =  {$STR_WIPE_NO,$STR_WIPE_YES};
		default = 0;
	};
	class WipeSave2{
		title = $STR_WIPE_TITLE_2;
		values[] = {0,1};
		texts[] = {$STR_WIPE_NO,$STR_WIPE_YES};
		default = 0;
	};
	class DisableRemoteSensors{
		title = "Disable Remote Sensors (experimental!)";
		values[] = {0,1,2};
		texts[] = {"No","Disable for clients without local AIs","Disable for all clients"};
		default = 0;
	};
};
