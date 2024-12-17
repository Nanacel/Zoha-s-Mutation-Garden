scale = 1;
draw_save = false;
mouse_pos = 0;
date = array_create(5)

skip_room_save = false;

global.level_data =
	{
	general : 0,
	the_vegetable_garden : 0,
	
	general_b : 0,
	the_vegetable_garden_b : 0,
	}
	
global.stat_data =
	{
	save_rm : "rm_general",
	coins : 0,
	item_name : array_create(0),
	item_amount : array_create(0),
	item_type : array_create(0),
	item_stats : array_create(0),
	
	day : 0,
	month : 0,
	year : 0,
	
	date : 0,
	
	position : 0,
	record_room : 0,
	
	research_points: 0,
	researched: 0,
	learned_recipes: 0,
	
	lands : 0,
	the_vegetable_garden_tiles : array_create(0),
	
	the_vegetable_garden_crops : array_create(0),
	
	player : 0,
		player_hp : 0,
		player_maxhp : 0,
		player_left_hand : array_create(0),
		player_right_hand : array_create(0),
	}
	
global.save_settings = 
	{
	save_name : 0
	}