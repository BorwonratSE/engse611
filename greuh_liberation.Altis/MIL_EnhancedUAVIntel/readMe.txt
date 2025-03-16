///////
//Enhanced UAV Intel
//By: Millenwise (beno_83au)
///////
//Use and abuse as required. Please just give credit to those deserving.
///////

MIL_EnhancedUAVIntel adds a few more useful bits on information to the UAV camera.

Features:

- Laser on/off to activate the display.
- Display inlcudes UAV position, laser marker position and bearing/ground distance from UAV, and vehicle type if one is under the laser.
- Actions to pause intel display and lock camera (globally) to target position.

To use:	

- Copy MIL_EnhancedUAVIntel into your mission folder.
- Add the following line to your init.sqf or initServer.sqf (it will only run on the server):
	nul = [] execVM "MIL_EnhancedUAVIntel\init.sqf";