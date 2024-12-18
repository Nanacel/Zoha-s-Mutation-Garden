function scr_save_room()
	{
	var _lay_id = layer_get_id("Tiles_1");
	var _map_id = layer_tilemap_get_id(_lay_id);

	for (var _i = 0; _i < room_width/128; _i++ )
		{
		for (var _j = 0; _j < room_height/128; _j++)
			{
			savedtile = tilemap_get(_map_id, _i, _j )
			savedroomtiles[_i][_j] = savedtile
			}
		}
		
	//Get Count	
	var _stake_num = instance_number(obj_stake)
	
	var _room_struct_b = 
		{
		stake_num : _stake_num,
		stake_data : array_create(_stake_num),		
		}
		
	//Get Data
		//Stakes
		for (var _i = 0; _i < _stake_num; _i++)
		{
		var _inst = instance_find(obj_stake, _i)
		_room_struct_b.stake_data[_i] = 
			{
			x : _inst.x,
			y : _inst.y,
			}
		}
		
	//Store Room Struct in global.level_data
	if room == rm_general {global.level_data.general_b = _room_struct_b;};
	if room == rm_the_vegetable_garden {global.level_data.the_vegetable_garden_b = _room_struct_b;};		

	}











function scr_load_room()
	{
	var _lay_id = layer_get_id("Tiles_1");
	var _map_id = layer_tilemap_get_id(_lay_id);

	for (var _i = 0; _i < room_width/128; _i++ )
		{
		for (var _j = 0; _j < room_height/128; _j++)
			{
			tilemap_set(_map_id, savedroomtiles[_i][_j], _i, _j )
			}
		}
		
	for (var _i = 0; _i < room_width/128; _i++)
		{
		for (var _j = 0; _j < room_height/128; _j++)
			{
			if is_array(global.ds_the_vegetable_garden_tiles[# _i,_j]) 
			and array_first(global.ds_the_vegetable_garden_tiles[# _i, _j]) = 1
			and !(tile_get_index(tilemap_get(_map_id, _i, _j)) == 6)
				{
				tilemap_set(_map_id, 6, _i, _j );
				}
		
			if is_array(global.ds_the_vegetable_garden_tiles[# _i,_j]) 
			and array_first(global.ds_the_vegetable_garden_tiles[# _i, _j]) = 0
			and !(tile_get_index(tilemap_get(_map_id, _i, _j)) == 1)
				{
				tilemap_set(_map_id, 1, _i, _j );
				}
		
			}
		}
		
	var _room_struct_b = 0;
	
	if room == rm_the_vegetable_garden {_room_struct_b = global.level_data.the_vegetable_garden_b;};
	if room == rm_general {_room_struct_b = global.level_data.general_b;};
	
	if !is_struct(_room_struct_b) {exit;};
	
	//Stakes
	if instance_exists(obj_stake) {instance_destroy(obj_stake);};
	for (var _i = 0; _i < _room_struct_b.stake_num; _i++)
		{
		instance_create_layer(_room_struct_b.stake_data[_i].x, _room_struct_b.stake_data[_i].y, layer, obj_stake);
		}	

	}
	
	
	
	










function scr_save_game(_file_num = 0)
	{
	var _save_array = array_create(0);

	scr_save_room();
	
	//Get Count	
	var _crop_num = instance_number(obj_crop)
	
	var _room_struct = 
		{
		crop_num : _crop_num,
		crop_data : array_create(_crop_num),
		
		}
		
	//Get Data
		//Crops
		for (var _i = 0; _i < _crop_num; _i++)
		{
		var _inst = instance_find(obj_crop, _i)
		_room_struct.crop_data[_i] = 
			{
			x : _inst.x,
			y : _inst.y,
			record_x : _inst.record_x,
			record_y : _inst.record_y,
			age : _inst.age,
			growth_stage : _inst.growth_stage,
			growth_stage_timer : _inst.growth_stage_timer,
			growth_stage_duration : _inst.growth_stage_duration,
			max_growth_stage : _inst.max_growth_stage,
			grown : _inst.grown,
			}
		}
	
	//Store Room Struct in global.level_data
	if room == rm_general {global.level_data.general = _room_struct;};
	if room == rm_the_vegetable_garden {global.level_data.the_vegetable_garden = _room_struct;};		

	//----------------Saving stats----------------//
	#region
	  global.stat_data.save_rm = room_get_name(room);

	global.stat_data.coins = global.coins;
	global.stat_data.item_name = [];
	global.stat_data.item_amount = [];
	global.stat_data.item_type = [];
	global.stat_data.item_stats = [];
	
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		array_push(global.stat_data.item_name, global.ds_inventory[# 0, _i])
		}
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		array_push(global.stat_data.item_amount,global.ds_inventory[# 1, _i])
		}
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		array_push(global.stat_data.item_type, global.ds_inventory[# 2, _i])
		}
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		array_push(global.stat_data.item_stats, global.ds_inventory[# 3, _i])
		}	
	
	global.stat_data.day = obj_time.day;
	global.stat_data.month = obj_time.month;
	global.stat_data.year = obj_time.year;	

	global.stat_data.lands = global.lands;
	
	global.stat_data.position = global.position;
	global.stat_data.record_room = global.record_room;
	
	global.stat_data.research_points = global.research_points;
	global.stat_data.researched = global.researched;
	global.stat_data.learned_recipes = global.learned_recipes;
	
	global.stat_data.the_vegetable_garden_tiles = []
	for (var _i = 0; _i < 7; _i++)
		{
		for (var _j = 0; _j < 4; _j++)
			{
			array_push(global.stat_data.the_vegetable_garden_tiles, global.ds_the_vegetable_garden_tiles[# _i, _j])
			}
		}

	global.stat_data.the_vegetable_garden_crops = []
	for (var _i = 0; _i < 7; _i++)
		{
		for (var _j = 0; _j < 4; _j++)
			{
			array_push(global.stat_data.the_vegetable_garden_crops, global.ds_the_vegetable_garden_crops[# _i, _j])
			}
		}
		
	global.stat_data.player = global.player;
		global.stat_data.player_hp = global.player.player_health;
		global.stat_data.player_maxhp = global.player.player_maxhealth;

	global.stat_data.player_left_hand = []
	global.stat_data.player_right_hand = []
	for (var _i = 0; _i < 4; _i++)
		{
		for (var _j = 0; _j < 1; _j++)
			{
			array_push(global.stat_data.player_left_hand, global.left_hand[# _i, _j])
			}
		}	

	for (var _i = 0; _i < 4; _i++)
		{
		for (var _j = 0; _j < 1; _j++)
			{
			array_push(global.stat_data.player_right_hand, global.right_hand[# _i, _j])
			}
		}		
	
	#endregion

	array_push(_save_array, global.stat_data);
	array_push(_save_array, global.level_data);

	//Saving
	var _file_name = "savedata" + string(_file_num) + ".sav";
	var _json = json_stringify(_save_array);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);

	buffer_save(_buffer, _file_name);
	buffer_delete(_buffer);
	

	
	}






	
	

function scr_load_game(_file_num = 0)
	{
	var _file_name = "savedata" + string(_file_num) + ".sav";
	if !file_exists(_file_name) exit;

	//Load buffer
	var _buffer = buffer_load(_file_name);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);

	//Get data array
	var _load_array = json_parse(_json);

	//Set data
	global.stat_data = array_get(_load_array, 0);
	global.level_data = array_get(_load_array, 1);

	//----------------Loading stats----------------//
	global.coins = global.stat_data.coins;
	
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{ 
		global.ds_inventory[# 0, _i] = global.stat_data.item_name[0]
		array_delete(global.stat_data.item_name, 0, 1)
		}
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		global.ds_inventory[# 1, _i] = global.stat_data.item_amount[0]
		array_delete(global.stat_data.item_amount, 0, 1)
		}
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		global.ds_inventory[# 2, _i] = global.stat_data.item_type[0]
		array_delete(global.stat_data.item_type, 0, 1)
		}		
	for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
		{
		global.ds_inventory[# 3, _i] = global.stat_data.item_stats[0]
		array_delete(global.stat_data.item_stats, 0, 1)
		}
	
	obj_time.day = global.stat_data.day; 
	obj_time.month = global.stat_data.month;
	obj_time.year = global.stat_data.year;		

	global.lands = global.stat_data.lands;
	
	global.position = global.stat_data.position;
	global.record_room = global.stat_data.record_room;
	
	global.research_points = global.stat_data.research_points;
	global.researched = global.stat_data.researched;
	global.learned_recipes = global.stat_data.learned_recipes;
	
	for (var _i = 0; _i < 7; _i++)
		{
		for (var _j = 0; _j < 4; _j++)
			{
			global.ds_the_vegetable_garden_tiles[# _i, _j] = array_first(global.stat_data.the_vegetable_garden_tiles)
			array_delete(global.stat_data.the_vegetable_garden_tiles, 0, 1)
			}
		}
		
	for (var _i = 0; _i < 7; _i++)
		{
		for (var _j = 0; _j < 4; _j++)
			{
			global.ds_the_vegetable_garden_crops[# _i, _j] = array_first(global.stat_data.the_vegetable_garden_crops)
			array_delete(global.stat_data.the_vegetable_garden_crops, 0, 1)
			}
		}		

	global.player = global.stat_data.player
		global.player.player_health = global.stat_data.player_hp;
		global.player.player_maxhealth = global.stat_data.player_maxhp;
		
	for (var _i = 0; _i < 4; _i++)
		{
		for (var _j = 0; _j < 1; _j++)
			{
			global.left_hand[# _i, _j] = array_first(global.stat_data.player_left_hand)
			array_delete(global.stat_data.player_left_hand, 0, 1)
			}
		}
		
	for (var _i = 0; _i < 4; _i++)
		{
		for (var _j = 0; _j < 1; _j++)
			{
			global.right_hand[# _i, _j] = array_first(global.stat_data.player_right_hand)
			array_delete(global.stat_data.player_right_hand, 0, 1)
			}
		}
		
	//Load room
	  var _load_room = asset_get_index(global.stat_data.save_rm);
	  obj_saveload.skip_room_save = true;
	  room_goto(_load_room)
	scr_load_room();
	
	var _room_struct = 0;
	
	if room == rm_the_vegetable_garden {_room_struct = global.level_data.the_vegetable_garden;};
	if room == rm_general {_room_struct = global.level_data.general;};
	
	if !is_struct(_room_struct) {exit;};
	
	//Crops: delete crops and create crops with saved data
	if instance_exists(obj_crop) {instance_destroy(obj_crop);};
	for (var _i = 0; _i < _room_struct.crop_num; _i++)
		{
		//instance_create_layer(_room_struct.crop_data[_i].x, _room_struct.crop_data[_i].y, layer, obj_crop);
		with (instance_create_depth(_room_struct.crop_data[_i].x, _room_struct.crop_data[_i].y, -bbox_bottom, obj_crop))
			{
			record_x = _room_struct.crop_data[_i].record_x;
			record_y = _room_struct.crop_data[_i].record_y;
			recorded = true;
			age = _room_struct.crop_data[_i].age;
			growth_stage = _room_struct.crop_data[_i].growth_stage;
			growth_stage_timer = _room_struct.crop_data[_i].growth_stage_timer;
			growth_stage_duration = _room_struct.crop_data[_i].growth_stage_duration;
			max_growth_stage = _room_struct.crop_data[_i].max_growth_stage;
			grown = _room_struct.crop_data[_i].grown;
			}
		}
	
	}
	
	
function scr_save_settings()
	{
	var _save_array_2 = array_create(0);
	global.save_settings.save_name = []
	global.save_settings.save_name = obj_saveload.date
	array_push(_save_array_2, global.save_settings);
	
	var _file_name_2 = "settings.sav";
	var _json_2 = json_stringify(_save_array_2);
	var _buffer_2 = buffer_create(string_byte_length(_json_2) + 1, buffer_fixed, 1);
	buffer_write(_buffer_2, buffer_string, _json_2);

	buffer_save(_buffer_2, _file_name_2);
	buffer_delete(_buffer_2);
	}

function scr_load_settings()
	{	
	var _file_name_2 = "settings.sav";
	if !file_exists(_file_name_2) exit;
	
	var _buffer_2 = buffer_load(_file_name_2);
	var _json_2 = buffer_read(_buffer_2, buffer_string)
	buffer_delete(_buffer_2);
	
	var _load_array_2 = json_parse(_json_2);
	
	global.save_settings = array_get(_load_array_2, 0);
	
	obj_saveload.date = array_create(0)
	obj_saveload.date = global.save_settings.save_name

	}