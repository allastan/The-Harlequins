/*
File: fn_gatherWheat.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["wheat",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Harvesting Wheat...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"wheat",_sum] call life_fnc_handleInv)) then
{
titleText["You have harvested some Wheat.","PLAIN"];
};
};

life_action_inUse = false;