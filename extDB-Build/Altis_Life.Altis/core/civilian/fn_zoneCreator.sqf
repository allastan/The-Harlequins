/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones","_platinumZones","_silverZones","_mushroomZones","_willowZones","_wheatZones","_yeastZones","_sugarZones","_fungusZones","_tobaccoZones","_poppyZones"];
_appleZones = ["apple_1","apple_2","apple_3","apple_4"];
_peachZones = ["peaches_1","peaches_2","peaches_3","peaches_4"];
_heroinZones = ["heroin_1","heroin_2"];
_cocaineZones = ["cocaine_1","cocaine_2"];
_weedZones = ["weed_1","weed_2"];
_platinumZones = ["plat_1","plat_2"];
_silverZones = ["silv_1","silv_2"];
_mushroomZones = ["mush_1","mush_2"];
_willowZones = ["willow_1","willow_2"];
_wheatZones = ["wheat_1","wheat_2"];
_yeastZones = ["yeast_1","yeast_2"];
_sugarZones = ["sugar_1","sugar_2"];
_fungusZones = ["fung_1","fung_2"];
_tobaccoZones = ["tob_1","tob_2"];
_poppyZones = ["pop_1","pop_2"];

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction[(localize ""STR_Gather_Apples""),life_fnc_gatherApples,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction[(localize ""STR_Gather_Peaches""),life_fnc_gatherPeaches,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction[(localize ""STR_Gather_Heroin""),life_fnc_gatherHeroin,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction[(localize ""STR_Gather_Cannabis""),life_fnc_gatherCannabis,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction[(localize ""STR_Gather_Cocaine""),life_fnc_gatherCocaine,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;

//Create platinum zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Platinum = player addAction['Gather Platinum',life_fnc_gatherPlatinumore,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Platinum;"];
} foreach _platinumZones;

//Create silver zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Silver = player addAction['Gather Silver',life_fnc_gatherSilverore,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Silver;"];
} foreach _silverZones;

//Create mushroom zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Mushrooms = player addAction['Gather Mushrooms',life_fnc_gatherMushrooms,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Mushrooms;"];
} foreach _mushroomZones;

//Create willow zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Willowbark = player addAction['Gather Willowbark',life_fnc_gatherWillowbark,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Willowbark;"];
} foreach _willowZones;

//Create wheat zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Wheat = player addAction['Gather Wheat',life_fnc_gatherWheat,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Wheat;"];
} foreach _wheatZones;

//Create yeast zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Yeast = player addAction['Gather Yeast',life_fnc_gatherYeast,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Yeast;"];
} foreach _yeastZones;

//Create sugar zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Sugar = player addAction['Gather Sugar',life_fnc_gatherSugar,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Sugar;"];
} foreach _sugarZones;

//Create fungus zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Fungus = player addAction['Gather Fungus',life_fnc_gatherFungus,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Fungus;"];
} foreach _fungusZones;

//Create tobacco zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Tobacco = player addAction['Gather Tobacco',life_fnc_gatherTobacco,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Tobacco;"];
} foreach _tobaccoZones;

//Create Poppy zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Poppyseed = player addAction['Gather Poppyseed',life_fnc_gatherPoppyseed,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Poppyseed;"];
} foreach _poppyZones;