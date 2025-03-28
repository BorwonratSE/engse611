class CfgNotifications
{
	class lib_default_notification {
		duration = 10;
		soundClose = "defaultNotificationClose";
		colorIconPicture[] = {1,1,1,1};
		colorIconText[] = {1,1,1,1};
		priority = 5;
	};
    class lib_sector_captured : lib_default_notification
    {
        title = $STR_NOTIFICATION_SECTORCAPTURED_TITLE;
		description = $STR_NOTIFICATION_SECTORCAPTURED_TEXT;
        iconPicture = "res\notif\ui_notif_sec_cap.paa";
		color[] = {0,1,0,1};
		sound = "taskSucceeded";
    };
	class lib_sector_attacked : lib_default_notification
    {
        title = $STR_NOTIFICATION_SECTORATTACKED_TITLE;
		description = $STR_NOTIFICATION_SECTORATTACKED_TEXT;
        iconPicture = "res\notif\ui_notif_sec_una.paa";
		color[] = {1,1,0,1};
		sound = "taskCanceled";
    };
	class lib_sector_lost : lib_default_notification
    {
        title = $STR_NOTIFICATION_SECTORLOST_TITLE;
		description = $STR_NOTIFICATION_SECTORLOST_TEXT;
        iconPicture = "res\notif\ui_notif_sec_los.paa";
		color[] = {1,0,0,1};
		sound = "taskFailed";
    };
	class lib_sector_safe : lib_default_notification
    {
        title = $STR_NOTIFICATION_SECTORSAFE_TITLE;
		description = $STR_NOTIFICATION_SECTORSAFE_TEXT;
        iconPicture = "res\notif\ui_notif_sec_saf.paa";
		color[] = {0,0.35,1,1};
		sound = "taskUpdated";
		priority = 3;
    };
	class lib_fob_built : lib_default_notification
    {
		title = $STR_NOTIFICATION_FOBBUILT_TITLE;
		description = $STR_NOTIFICATION_FOBBUILT_TEXT;
        iconPicture = "res\notif\ui_notif_fob_new.paa";
		color[] = {0,0.35,1,1};
		sound = "taskUpdated";
    };
	class lib_fob_safe : lib_default_notification
    {
		title = $STR_NOTIFICATION_FOBSAFE_TITLE;
		description = $STR_NOTIFICATION_FOBSAFE_TEXT;
        iconPicture = "res\notif\ui_notif_fob_sec.paa";
		color[] = {0,0.35,1,1};
		sound = "taskUpdated";
		priority = 3;
    };
	class lib_fob_attacked : lib_default_notification
    {
		title = $STR_NOTIFICATION_FOBATTACKED_TITLE;
		description = $STR_NOTIFICATION_FOBATTACKED_TEXT;
        iconPicture = "res\notif\ui_notif_fob_und.paa";
		color[] = {1,1,0,1};
		sound = "taskCanceled";
    };
	class lib_fob_lost : lib_default_notification
    {
		title = $STR_NOTIFICATION_FOBLOST_TITLE;
		description = $STR_NOTIFICATION_FOBLOST_TEXT;
        iconPicture = "res\notif\ui_notif_fob_los.paa";
		color[] = {1,0,0,1};
		sound = "taskFailed";
    };
	class lib_battlegroup : lib_default_notification
    {
		title = $STR_NOTIFICATION_BATTLEGROUP_TITLE;
		description = $STR_NOTIFICATION_BATTLEGROUP_TEXT;
        iconPicture = "res\notif\ui_notif_bgp.paa";
		color[] = {1,0,0,1};
		sound = "taskFailed";
    };
    class lib_incoming : lib_battlegroup
    {
		description = $STR_NOTIFICATION_INCOMING_TEXT;
    };
	class lib_intel : lib_default_notification
    {
		title = $STR_NOTIFICATION_INTEL_TITLE;
        iconPicture = "res\notif\ui_notif_int.paa";
		color[] = {0,0.35,1,1};
		sound = "taskUpdated";
    };
	class lib_intel_prisoner : lib_intel
	{
		description = $STR_NOTIFICATION_PRISONER_TEXT;
	};
    class lib_intel_document : lib_intel
    {
		description = $STR_NOTIFICATION_DOCUMENT_TEXT;
    };
    class lib_intel_fob : lib_intel
    {
		description = $STR_NOTIFICATION_FOB_TEXT;
    };
    class lib_intel_convoy : lib_intel
    {
		description = $STR_NOTIFICATION_CONVOY_SPOTTED_TEXT;
    };
	class lib_secondary_fob_destroyed : lib_default_notification
    {
		title = $STR_NOTIFICATION_SECONDARY_TITLE;
		description = $STR_NOTIFICATION_SECONDARY_TEXT;
        iconPicture = "res\notif\ui_notif_sob.paa";
		color[] = {0,1,0,1};
		sound = "taskSucceeded";
    };
    class lib_secondary_convoy_destroyed : lib_secondary_fob_destroyed
    {
		description = $STR_NOTIFICATION_CONVOY_DESTROYED_TEXT;
    };
	class lib_reinforcements : lib_default_notification
    {
		title = $STR_NOTIFICATION_REINFORCEMENTS_TITLE;
		description = $STR_NOTIFICATION_REINFORCEMENTS_TEXT;
        iconPicture = "res\notif\ui_notif_ref.paa";
		color[] = {1,1,0,1};
		sound = "taskCanceled";
    };
	class lib_reinforcementsblu : lib_default_notification
    {
		title = $STR_NOTIFICATION_REINFORCEMENTS_TITLE;
		description = $STR_NOTIFICATION_REINFORCEMENTS_TITLE2;
        iconPicture = "res\notif\ui_notif_ref.paa";
		color[] = {0,1,1,1};
		sound = "taskUpdated";
    };
    class lib_intel_sar : lib_intel
    {
    	description = $STR_NOTIFICATION_SAR_STARTED;
    };
    class lib_intel_sar_failed : lib_secondary_fob_destroyed
    {
    	description = $STR_NOTIFICATION_SAR_FAILED;
    	color[] = {1,0,0,1};
		sound = "taskFailed";
    };
    class lib_intel_sar_succeeded : lib_secondary_fob_destroyed
    {
    	description = $STR_NOTIFICATION_SAR_SUCCESS;
    };
	class JtacReloadNotification
	{
		title = "JTAC";
		iconPicture = "a3\ui_f\data\gui\cfg\communicationmenu\call_ca.paa";
		iconText = "1";
		description = "%1";
		color[] = {0.153, 0.933, 0.122, 1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
	    class lib_restart_60_s : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_SECOND;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
    };
    class lib_restart_5_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_FIVE;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
    };
	class lib_restart_10_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_TEN;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
    };
    class lib_restart_15_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_FIFTEEN;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
    };
	class lib_restart_20_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_TWENTY;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
    };
    class lib_restart_30_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_THIRTY;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
	};
	class lib_restart_40_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_FOURTY;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
	};
	class lib_restart_50_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_FIFTY;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
	};	
		class lib_restart_60_min : lib_default_notification {
        title = $STR_NOTIFICATION_RESTART_TITLE;
        description = $STR_NOTIFICATION_RESTART_THIRTY;
        iconPicture = "res\notif\ui_notif_restart.paa";
        color[] = { 1, 1, 0, 1 };
        sound = "taskCanceled";
    };
};