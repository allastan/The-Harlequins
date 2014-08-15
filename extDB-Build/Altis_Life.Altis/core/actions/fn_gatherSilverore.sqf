/*
File: fn_gatherSilverore.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["silverore",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Mining Silver...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"silverore",_sum] call life_fnc_handleInv)) then
{
titleText["You have mined some Silver.","PLAIN"];
};
};

life_action_inUse = false;