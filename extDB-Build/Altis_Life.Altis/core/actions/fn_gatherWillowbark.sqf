/*
File: fn_gatherWillowbark.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["willowbark",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Gathering Willowbark...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"willowbark",_sum] call life_fnc_handleInv)) then
{
titleText["You have gathered some Willowbark.","PLAIN"];
};
};

life_action_inUse = false;