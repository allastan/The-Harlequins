/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {2};
	case "oilp": {1};
	case "heroinu": {2};
	case "heroinp": {1};
	case "cannabis": {2};
	case "marijuana": {1};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {3};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {1};
	case "fuelF": {2};
	case "money": {0};
	case "pickaxe": {1};
	case "copperore": {2};
	case "ironore": {2};
	case "copper_r": {1};
	case "iron_r": {1};
	case "sand": {2};
	case "salt": {2};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {2};
	case "diamondc": {1};
	case "cocaine": {2};
	case "cocainep": {1};
	case "spikeStrip": {15};
	case "rock": {2};
	case "cement": {1};
	case "goldbar": {6};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "platinumore": {2};
	case "platinumbar": {1};
	case "silverore": {2};
	case "silverbar": {1};
	case "mushrooms": {2};
	case "mushroomextract": {1};
	case "willowbark": {2};
	case "willowextract": {1};
	case "wheat": {2};
	case "wheatgrain": {1};
	case "yeast": {1};
	case "sugar": {1};
	case "fungus": {2};
	case "lsd": {1};
	case "tobacco": {2};
	case "cigarette": {1};
	case "poppyseed": {2};
	case "opium": {1};
	case "plastic": {1};
	case "tylenol": {1};
	case "whisky": {1};
	case "vicodin": {1};
	case "morphine": {1};
	case "bread": {1};
	default {1};
};
