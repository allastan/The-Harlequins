/*
	File: fn_processActionMulti.sqf
	Author: Niels "Gamewalker" Kräupl, Bryan "Tonic" Boardwine

	Description:
	Master handling for processing multiple items.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_detMinValArray"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {[["oilu"],"oilp",1200,(localize "STR_Process_Oil")];};
	case "diamond": {[["diamond"],"diamondc",1350,(localize "STR_Process_Diamond")];};
	case "heroin": {[["heroinu"],"heroinp",2500,(localize "STR_Process_Heroin")];};
	case "copper": {[["copperore"],"copper_r",750,(localize "STR_Process_Copper")];};
	case "iron": {[["ironore"],"iron_r",1120,(localize "STR_Process_Iron")];};
	case "sand": {[["sand"],"glass",650,(localize "STR_Process_Sand")];};
	case "salt": {[["salt"],"salt_r",450,(localize "STR_Process_Salt")];};
	case "cocaine": {[["cocaine"],"cocainep",2500,(localize "STR_Process_Cocaine")];};
	case "marijuana": {[["cannabis"],"marijuana",2500,(localize "STR_Process_Marijuana")];};
	case "cement": {[["rock"],"cement",500,(localize "STR_Process_Cement")];};
	case "platinumore": {[["platinumore"],"platinumbar",500,"Processing Platinum"];};
	case "silverore": {[["silverore"],"silverbar",500,"Processing Silver"];};
	case "mushrooms": {[["mushrooms"],"mushroomextract",500,"Processing Mushrooms"];};
	case "willowbark": {[["willowbark"],"willowextract",500,"Processing Willowbark"];};
	case "wheat": {[["wheat"],"wheatgrain",2500,"Processing wheat"];};
	case "fungus": {[["fungus"],"lsd",2500,"Processing Fungus"];};
	case "tobacco": {[["tobacco"],"cigarette",2500,"Processing Tobacco"];};
	case "poppyseed": {[["poppyseed"],"opium",2500,"Processing Poppyseed"];};
	case "plastic": {[["oilp","mushroomextract"],"plastic",2500,"Making Plastic"];};
	case "tylenol": {[["willowextract","plastic"],"tylenol",5000,"Making Tylenol"];};
	case "whisky": {[["wheatgrain","yeast","sugar"],"whisky",5000,"Brewing Whisky"];};
	case "vicodin": {[["cocainep","willowextract","plastic"],"vicodin",5000,"Making Vicodin"];};
	case "morphine": {[["opium","plastic","willowextract"],"morphine",5000,"Making Morphine"];};
	case "bread": {[["wheatgrain","yeast"],"bread",5000,"Making Bread"];};
	default {[];};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItemArray = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;

_detMinValArray = [];
{
	_detMinValArray = _detMinValArray + [missionNamespace getVariable ([_x,0] call life_fnc_varHandle)];
} forEach _oldItemArray;

_oldVal = _detMinValArray call BIS_fnc_lowestNum;

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	{
		if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {
			5 cutText ["","PLAIN"]; 
			life_is_processing = false;
		};
	} forEach _oldItemArray;
	
	if(!life_is_processing) exitWith {};
	
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; 		
		{
			[true,_x,_oldVal] call life_fnc_handleInv; 
		} forEach _oldItemArray;
		life_is_processing = false;
	};
	
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
else
{
	if(life_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	if(life_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	{
		if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {
			5 cutText ["","PLAIN"]; 
			life_is_processing = false;
		};
	} forEach _oldItemArray;
	
	if(!life_is_processing) exitWith {};
	
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; 		
		{
			[true,_x,_oldVal] call life_fnc_handleInv; 
		} forEach _oldItemArray;
		life_is_processing = false;
	};
	
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
};