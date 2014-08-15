/*
File: fn_gatherPoppyseed.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["poppyseed",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Picking Poppyseed...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"poppyseed",_sum] call life_fnc_handleInv)) then
{
titleText["You have gathered some Poppyseed.","PLAIN"];
};
};

life_action_inUse = false;