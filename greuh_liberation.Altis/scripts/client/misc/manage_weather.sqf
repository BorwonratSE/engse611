waitUntil {sleep 1; !isNil "chosen_weather" };
private _old_weather = -1;
private _weathertime = 60 * 15;
skipTime -24;
86400 setOvercast chosen_weather;
skipTime 24;


while { true } do {
	if (chosen_weather != _old_weather) then {
		_weathertime setOvercast chosen_weather;
		if ( overcast <= 0.5 ) then { 
			startLightning = 0; 
			0 setRain 0;
			 0 setGusts 0; 
			 0 setFog 0; 
			 forceWeatherChange;
			};
		if ( overcast > 0.5 && overcast <= 0.75 ) then { 
			startLightning = 0; 
			0 setRain 0;
			 0 setGusts 0.2; 
			 0 setFog 0;
			 forceWeatherChange;
			 };
		if ( overcast > 0.75 && overcast <= 0.80 ) then { 
			startLightning = 0;
			2 setRain 0.1; 
			 2 setGusts 1;
			 2 setFog 0;  
			 forceWeatherChange;
			 };
		if ( overcast > 0.80 && overcast <= 0.90  ) then {
			 0 setFog 0.15;
			 0 setRain 0.2;
			 0 setGusts 1; 
			 forceWeatherChange;
			}; // Removed heavy rain due to severe fps issues
		if ( overcast > 0.90 && overcast <= 0.98 ) then { 
				startLightning = 0;
				0 setFog 0.3;
				2 setRain 0.25; 
				 2 setGusts 1;
				 2 setFog 0;  
				 forceWeatherChange;
				 };
		if ( overcast > 0.98 )  then {
			0 setFog 0.7;   
			[1] call BIS_fnc_setOvercast;
			0 setRain 1;
			2 setGusts 1;
			startLightning = 1; 
			null = [12000, 3, 6, player] execVM "scripts\client\misc\Lightning.sqf"; 
			forceWeatherChange;
		};
		_old_weather = chosen_weather;
	};sleep _weathertime;
};