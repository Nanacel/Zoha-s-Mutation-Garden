//-------------Inventory-------------//
inv_slots = 20

global.coins = 500000000;
//0 = ITEM
//1 = AMOUNT
//2 = TYPE
	//0 = none, 2 = lands, 3 = seeds, 4 = hoes, 5 = fruits, 6 = vegetables, 7 = furnitures, 8 = flowers, 9 = materials, 10 = shovels, 11 = hatchets
//3 STATS
global.ds_inventory = ds_grid_create(4, inv_slots);

for (var _i = 0; _i< inv_slots; _i++)
	{
	global.ds_inventory[# 3, _i] = -1
	}

global.lands = [];

//-------------Items-------------//
enum item {
	none			= 0,
	the_vegetable_garden,
	cauliflower_seeds,
	tomato_seeds,
	wooden_hoe,
	cauliflower,
	tomato,
	stake,
	sunflower_seeds,
	sunflower,
	wooden_shovel,
	wooden_hatchet,
	log,
	long_branch,
	branch,
	height			= 15
}

//-------------Item Name-------------//
ds_item_infos = ds_grid_create(7, item.height);
var _z = 0; 
var _i = 0;
ds_item_infos[# _z, _i++] = "Nothing"
ds_item_infos[# _z, _i++] = "The Vegetable Garden"
ds_item_infos[# _z, _i++] = "Cauliflower seeds"
ds_item_infos[# _z, _i++] = "Tomato seeds"
ds_item_infos[# _z, _i++] = "Wooden hoe"
ds_item_infos[# _z, _i++] = "Cauliflower"
ds_item_infos[# _z, _i++] = "Tomato"
ds_item_infos[# _z, _i++] = "Stake"
ds_item_infos[# _z, _i++] = "Sunflower seeds"
ds_item_infos[# _z, _i++] = "Sunflower"
ds_item_infos[# _z, _i++] = "Wooden shovel"
ds_item_infos[# _z, _i++] = "Wooden hatchet"
ds_item_infos[# _z, _i++] = "Log"
ds_item_infos[# _z, _i++] = "Long branch"
ds_item_infos[# _z, _i++] = "Branch"


//-------------Item Description-------------//
var _x = 1; 
var _y = 0;

ds_item_infos[# _x, _y++] = ""
ds_item_infos[# _x, _y++] = "A small property located\nin a rural area.\nIts proximity to forests\nand a village make it the\nperfect place for an\napprentice gardener.\nContains 24 tiles."
ds_item_infos[# _x, _y++] = "Ball-shaped seeds that\ngrow into cauliflowers."
ds_item_infos[# _x, _y++] = "These tiny seeds will grow\ninto a tomato bush."
ds_item_infos[# _x, _y++] = "A wooden hoe.\nThis is the first tool you\nwill need as a budding\nfarmer."
ds_item_infos[# _x, _y++] = "A sturdy, white-headed\nvegetable known for its\nhearty texture."
ds_item_infos[# _x, _y++] = "Vibrant and juicy,\nthese red fruits thrive in\nsummer."
ds_item_infos[# _x, _y++] = "A long stick providing\nsupport for growing crops."
ds_item_infos[# _x, _y++] = "Small and edible seeds\nprotected by a thin shell."
ds_item_infos[# _x, _y++] = "A bright flower with\nlarge yellow petals\nproducing edible seeds."
ds_item_infos[# _x, _y++] = "A tool used to dig holes\nand remove plants."
ds_item_infos[# _x, _y++] = "A compact tool commonly\nused for chopping trees."
ds_item_infos[# _x, _y++] = "The most basic crafting\nmaterial. It can be\nused for various things."
ds_item_infos[# _x, _y++] = "A long branch."
ds_item_infos[# _x, _y++] = "A small branch."


//-------------Item Price-------------//
var _a = 2; 
var _b = 0;

ds_item_infos[# _a, _b++] = ""
ds_item_infos[# _a, _b++] = 500000
ds_item_infos[# _a, _b++] = 2000
ds_item_infos[# _a, _b++] = 500
ds_item_infos[# _a, _b++] = 5000
ds_item_infos[# _a, _b++] = 16000
ds_item_infos[# _a, _b++] = 100
ds_item_infos[# _a, _b++] = 1000
ds_item_infos[# _a, _b++] = 300
ds_item_infos[# _a, _b++] = 2400
ds_item_infos[# _a, _b++] = 5000
ds_item_infos[# _a, _b++] = 0
ds_item_infos[# _a, _b++] = 0
ds_item_infos[# _a, _b++] = 0
ds_item_infos[# _a, _b++] = 0

//-------------Item Type-------------//
var _c = 3; 
var _d = 0;

ds_item_infos[# _c, _d++] = ""
ds_item_infos[# _c, _d++] = "lands"
ds_item_infos[# _c, _d++] = "seeds"
ds_item_infos[# _c, _d++] = "seeds"
ds_item_infos[# _c, _d++] = "hoe"
ds_item_infos[# _c, _d++] = "vegetables"
ds_item_infos[# _c, _d++] = "fruits"
ds_item_infos[# _c, _d++] = "furnitures"
ds_item_infos[# _c, _d++] = "seeds"
ds_item_infos[# _c, _d++] = "flowers"
ds_item_infos[# _c, _d++] = "shovel"
ds_item_infos[# _c, _d++] = "hatchet"
ds_item_infos[# _c, _d++] = "materials"
ds_item_infos[# _c, _d++] = "materials"
ds_item_infos[# _c, _d++] = "materials"

//-------------Item Num-------------//
var _e = 4; 
var _f = 0;

ds_item_infos[# _e, _f++] = 0
ds_item_infos[# _e, _f++] = 1
ds_item_infos[# _e, _f++] = 2
ds_item_infos[# _e, _f++] = 3
ds_item_infos[# _e, _f++] = 4
ds_item_infos[# _e, _f++] = 5
ds_item_infos[# _e, _f++] = 6
ds_item_infos[# _e, _f++] = 7
ds_item_infos[# _e, _f++] = 8
ds_item_infos[# _e, _f++] = 9
ds_item_infos[# _e, _f++] = 10
ds_item_infos[# _e, _f++] = 11
ds_item_infos[# _e, _f++] = 12
ds_item_infos[# _e, _f++] = 13
ds_item_infos[# _e, _f++] = 14

//-------------Item Type Num-------------//
var _g = 5; 
var _h = 0;

ds_item_infos[# _g, _h++] = 0
ds_item_infos[# _g, _h++] = 2
ds_item_infos[# _g, _h++] = 3
ds_item_infos[# _g, _h++] = 3
ds_item_infos[# _g, _h++] = 4
ds_item_infos[# _g, _h++] = 6
ds_item_infos[# _g, _h++] = 5
ds_item_infos[# _g, _h++] = 7
ds_item_infos[# _g, _h++] = 3
ds_item_infos[# _g, _h++] = 8
ds_item_infos[# _g, _h++] = 10
ds_item_infos[# _g, _h++] = 11
ds_item_infos[# _g, _h++] = 9
ds_item_infos[# _g, _h++] = 9
ds_item_infos[# _g, _h++] = 9

//-------------Item Stats-------------//
var _j = 6; 
var _k = 0;

ds_item_infos[# _j, _k++] = -1
ds_item_infos[# _j, _k++] = -1
ds_item_infos[# _j, _k++] = [global.ds_crops[# 0, 0], global.ds_crops[# 1, 0], global.ds_crops[# 2, 0], global.ds_crops[# 3, 0], global.ds_crops[# 4, 0], global.ds_crops[# 5, 0], global.ds_crops[# 6, 0], global.ds_crops[# 7, 0], global.ds_crops[# 8, 0], global.ds_crops[# 9, 0], global.ds_crops[# 10, 0], global.ds_crops[# 11, 0], global.ds_crops[# 12, 0]]
ds_item_infos[# _j, _k++] = [global.ds_crops[# 0, 1], global.ds_crops[# 1, 1], global.ds_crops[# 2, 1], global.ds_crops[# 3, 1], global.ds_crops[# 4, 1], global.ds_crops[# 5, 1], global.ds_crops[# 6, 1], global.ds_crops[# 7, 1], global.ds_crops[# 8, 1], global.ds_crops[# 9, 1], global.ds_crops[# 10, 1], global.ds_crops[# 11, 1], global.ds_crops[# 12, 1]]
ds_item_infos[# _j, _k++] = 100
ds_item_infos[# _j, _k++] = [global.ds_crops[# 0, 0], global.ds_crops[# 1, 0], global.ds_crops[# 2, 0], global.ds_crops[# 3, 0], global.ds_crops[# 4, 0], global.ds_crops[# 5, 0], global.ds_crops[# 6, 0], global.ds_crops[# 7, 0], global.ds_crops[# 8, 0], global.ds_crops[# 9, 0], global.ds_crops[# 10, 0], global.ds_crops[# 11, 0], global.ds_crops[# 12, 0]]
ds_item_infos[# _j, _k++] = [global.ds_crops[# 0, 1], global.ds_crops[# 1, 1], global.ds_crops[# 2, 1], global.ds_crops[# 3, 1], global.ds_crops[# 4, 1], global.ds_crops[# 5, 1], global.ds_crops[# 6, 1], global.ds_crops[# 7, 1], global.ds_crops[# 8, 1], global.ds_crops[# 9, 1], global.ds_crops[# 10, 1], global.ds_crops[# 11, 1], global.ds_crops[# 12, 1]]
ds_item_infos[# _j, _k++] = -1
ds_item_infos[# _j, _k++] = [global.ds_crops[# 0, 2], global.ds_crops[# 1, 2], global.ds_crops[# 2, 2], global.ds_crops[# 3, 2], global.ds_crops[# 4, 2], global.ds_crops[# 5, 2], global.ds_crops[# 6, 2], global.ds_crops[# 7, 2], global.ds_crops[# 8, 2], global.ds_crops[# 9, 2], global.ds_crops[# 10, 2], global.ds_crops[# 11, 2], global.ds_crops[# 12, 2]]
ds_item_infos[# _j, _k++] = [global.ds_crops[# 0, 2], global.ds_crops[# 1, 2], global.ds_crops[# 2, 2], global.ds_crops[# 3, 2], global.ds_crops[# 4, 2], global.ds_crops[# 5, 2], global.ds_crops[# 6, 2], global.ds_crops[# 7, 2], global.ds_crops[# 8, 2], global.ds_crops[# 9, 2], global.ds_crops[# 10, 2], global.ds_crops[# 11, 2], global.ds_crops[# 12, 2]]
ds_item_infos[# _j, _k++] = 100
ds_item_infos[# _j, _k++] = 100
ds_item_infos[# _j, _k++] = -1
ds_item_infos[# _j, _k++] = -1
ds_item_infos[# _j, _k++] = -1