class CfgCommunicationMenu
{
    class missileBomb
    {
        text = "Cruise Missile";
        expression = "[] spawn fnc_CruiseMissile";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class clustermissileBomb
    {
        text = "Cluster Missile";
        expression = "[] spawn fnc_ClusterMissile";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class mytank
    {
        text = "Call Airdrop";
        expression = "[] spawn fnc_vehicledrop";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class fight
    {
        text = "Spawn Fighter Jet";
        expression = "[] spawn fnc_fighter";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class cas_1
    {
        text = "Spawn Fighter CAS";
        expression = "[] spawn fnc_cas1";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class cas_2
    {
        text = "Spawn Fighter CAS";
        expression = "[] spawn fnc_cas2";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class fight2
    {
        text = "Spawn Fighter Jet";
        expression = "[] spawn fnc_htransport";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class hcas
    {
        text = "Spawn Gunship";
        expression = "[] spawn fnc_hcas";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
		
    };

	class mobile
    {
        text = "Call Airdrop";
        expression = "[] spawn fnc_mobile";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
        removeAfterExpressionCall = 0;
		
    };

    class service
    {
        text = "Call Airdrop";
        expression = "[] spawn fnc_service";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
        removeAfterExpressionCall = 0;
		
    };

    class hunter
    {
        text = "Call Airdrop";
        expression = "[] spawn fnc_hunter";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
        removeAfterExpressionCall = 0;
		
    };

    class buzz
    {
        text = "Spawn Fighter Jet";
        expression = "[] spawn fnc_buzz";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
    };

	class riffleman
	{
		text = "Call Airdrop";
        expression = "[] spawn fnc_riffle";
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
        removeAfterExpressionCall = 0;
	}

	    class GOM_aircraftLoadoutMenu
    {
        text = "Aircraft Loadout Module";
        submenu = "";
        expression = "[player] spawn GOM_fnc_aircraftLoadout"; // Code executed upon activation
        icon = "\a3\Ui_f\data\gui\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
        cursor = "\a3\Ui_f\data\gui\Cfg\CommunicationMenu\call_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    };

};