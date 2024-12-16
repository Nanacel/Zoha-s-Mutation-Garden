grid_x = clamp( floor(mouse_x/tile_size), 0, floor(room_width/tile_size));
grid_y = clamp( floor(mouse_y/tile_size), 0, floor(room_height/tile_size));

//Grow the plant.   //Growth speed  = 1/60 + fertility/200
time_increment = 1/60 + global.ds_the_vegetable_garden_tiles[# record_x, record_y][2]/1000
if grown == false {growth_stage_timer += time_increment};
age += time_increment
					//Growth stage duration = plant stats
growth_stage_duration = global.ds_the_vegetable_garden_crops[# record_x, record_y][5];

growth_stage = clamp(growth_stage, 0, max_growth_stage)

if growth_stage_timer > growth_stage_duration and !(growth_stage == max_growth_stage)
	{
	growth_stage += 1; 
	if growth_stage == max_growth_stage {grown = true};
	growth_stage_timer = 0;
	} 

var _lay_id = layer_get_id("Tiles_1");
var _map_id = layer_tilemap_get_id(_lay_id);

//Destroy Crop if Health = 0
for (var _i = 0; _i < 7; _i++) //ds_grid_get(global.ds_the_vegetable_garden_crops, grid_x, grid_y)
	{
		for (var _j = 0; _j < 4; _j++)
		{
		if global.ds_the_vegetable_garden_crops[# record_x, record_y][1] <= 0 
			{
			global.ds_the_vegetable_garden_tiles[# record_x, record_y][4] = 0
			global.ds_the_vegetable_garden_crops[# record_x, record_y] = array_create(number_of_stats, 0) 
			instance_destroy(id)
			}
		}
	}

if (room == rm_general) or (room == rm_menu) or global.show_world == true exit;	

if !instance_exists(id) exit;

//Remove Plant (Shovels)
#region
if point_in_rectangle(mouse_x, mouse_y, id.x - 64 + 96, id.y - 63  + 160, id.x + 64  + 95, id.y + 64  + 160) 
and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] == 1 //there is a plant
and !(room == rm_general)
	{
	if mouse_check_button_pressed(mb_left) and global.left_hand[# 2, 0] == 10 //10 = Shovels
		{
		audio_play_sound(snd_digging, 0 , 0)
		global.left_hand[# 3, 0] -= 1
		global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] = 0
		global.ds_the_vegetable_garden_crops[# grid_x, grid_y] = array_create(number_of_stats, 0) 
		instance_destroy(id)
		}
	if mouse_check_button_pressed(mb_right) and global.right_hand[# 2, 0] == 10 //10 = Shovels
		{
		audio_play_sound(snd_digging, 0 , 0)
		global.right_hand[# 3, 0] -= 1
		global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] = 0
		global.ds_the_vegetable_garden_crops[# grid_x, grid_y] = array_create(number_of_stats, 0) 
		instance_destroy(id)
		}
	}

#endregion

if !instance_exists(obj_crop) exit;

if grown == true  
and (((mouse_check_button_pressed(mb_left) and global.left_hand[# 0, 0] == 0) 
or (mouse_check_button_pressed(mb_right) and global.right_hand[# 0, 0] == 0)) //hands are empty
or ((mouse_check_button_pressed(mb_left) and global.left_hand[# 2, 0] == 3) 
or (mouse_check_button_pressed(mb_right) and global.right_hand[# 2, 0] == 3))) //or there is a seed inhand
and point_in_rectangle(mouse_x, mouse_y, id.x - 64 + 96, id.y - 63  + 160, id.x + 64  + 95, id.y + 64  + 160)
	{
		var _ds_inv = global.ds_inventory;
		var _xx = 0; repeat(obj_inventory.inv_slots) 
			{
			if  (_ds_inv[# 1, _xx] <= 9 and 
			(_ds_inv[# 2, _xx] == 5 // 5 = fruits
			or _ds_inv[# 2, _xx] == 6  // 6 = vegetables
			or _ds_inv[# 2, _xx] == 8 ) // 8 = flowers
			and _ds_inv[# 0, _xx] = (global.ds_the_vegetable_garden_crops[# record_x, record_y][8] )) 
			or !(obj_inventory.inv_slots == obj_equipment.load) 
		
				{
				if global.ds_the_vegetable_garden_crops[# record_x, record_y][4] = 0 //if you can't harvest multiple times
					{
					audio_play_sound(snd_harvest, 0, 0)
					scr_additem(global.ds_the_vegetable_garden_crops[# record_x, record_y][8] ,
					global.ds_the_vegetable_garden_crops[# record_x, record_y][3],
					global.ds_the_vegetable_garden_crops[# record_x, record_y][9], 
					global.ds_the_vegetable_garden_crops[# record_x, record_y])
					
					global.ds_the_vegetable_garden_crops[# grid_x, grid_y] = array_create(number_of_stats, 0) 
					global.ds_the_vegetable_garden_tiles[# record_x, record_y][4] = 0;
					instance_destroy((id));
					}
		
				if global.ds_the_vegetable_garden_crops[# record_x, record_y][4] = 1 //if you can harvest multiple times
		
					{
					audio_play_sound(snd_harvest, 0, 0)
					scr_additem(global.ds_the_vegetable_garden_crops[# record_x, record_y][8] , 
					global.ds_the_vegetable_garden_crops[# record_x, record_y][3],
					global.ds_the_vegetable_garden_crops[# record_x, record_y][9],
					global.ds_the_vegetable_garden_crops[# record_x, record_y])
		
					id.growth_stage -= 1;
					growth_stage_timer = 0
					id.grown = false;
					}
				break;
				}
			_xx += 1
			}
	}