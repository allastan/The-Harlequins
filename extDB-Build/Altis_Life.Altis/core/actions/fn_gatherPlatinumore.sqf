/*
File: fn_gatherPlatinumore.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["platinumore",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Mining Platinum...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"platinumore",_sum] call life_fnc_handleInv)) then
{
titleText["You have mined some platinum.","PLAIN"];
};
};

life_action_inUse = false;