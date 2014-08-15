/*
File: fn_gatherTobacco.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["tobacco",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Harvesting Tobacco...","PLAIN"];
titleFadeOut 2;
sleep 2;
if(([true,"tobacco",_sum] call life_fnc_handleInv)) then
{
playSound "bag.ogg"; // this only if you want the sound for the bag when you gather it 
titleText["You have harvested some tobacco.","PLAIN"];
};
};

life_action_inUse = false;