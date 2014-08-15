/*
File: fn_gatherSugar.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["sugar",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Harvesting Sugar...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"sugar",_sum] call life_fnc_handleInv)) then
{
titleText["You have harvested some sugar.","PLAIN"];
};
};

life_action_inUse = false;