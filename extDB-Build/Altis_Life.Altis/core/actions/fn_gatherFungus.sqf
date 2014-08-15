/*
File: fn_gatherFungus.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["fungus",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Picking Fungus...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"fungus",_sum] call life_fnc_handleInv)) then
{
titleText["You have gathered some Fungus.","PLAIN"];
};
};

life_action_inUse = false;