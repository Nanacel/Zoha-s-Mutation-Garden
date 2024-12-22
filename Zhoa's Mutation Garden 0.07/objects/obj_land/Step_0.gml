if (room == rm_general) or (room == rm_menu) or global.show_world == true exit;	

grid_x = floor(mouse_x/tile_size);
grid_y = floor(mouse_y/tile_size);


//EXIT IF NOT AT HOME
if (global.position != 0) {exit;}	

//-------Land Interactions-------//
var _xx = camera_get_view_x(view_camera[0]);
var _yy = camera_get_view_y(view_camera[0]);

var _lay_id = layer_get_id("Tiles_1");
var _map_id = layer_tilemap_get_id(_lay_id);


for (var _i = 0; _i < room_width/128; _i++)
	{
		for (var _j = 0; _j < room_height/128; _j++)
		{
		if global.ds_the_vegetable_garden_tiles[# _i, _j][0] == 0 
			{tilemap_set(_map_id, 1, _i, _j )}
		}
	}

if point_in_rectangle(mouse_x, mouse_y, 199 +_xx, 199 +_yy, 1099 +_xx, 990 +_yy) and !is_undefined(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y])
	{
		
	//Plant Stake
	if mouse_check_button_pressed(mb_left) and global.left_hand[# 0, 0] == 7 //7 = Stake
	and !(room == rm_general) and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] = 0 //No Plant
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][0] = 1 //Is Tilled
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 0 //No Object On The Cell
		{
		audio_play_sound(snd_place_stake, 0, 0)
		global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 1;
		global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][7] = 7;

		instance_create_depth((grid_x*128) - 32, (grid_y*128) - 111, -bbox_bottom, obj_stake)

		//remove it from hand
		global.left_hand[# 0, 0] = 0
		global.left_hand[# 1, 0] = 0
		global.left_hand[# 2, 0] = 0
		global.left_hand[# 3, 0] = -1
		}
		
	if mouse_check_button_pressed(mb_right) and global.right_hand[# 0, 0] == 7 //7 = Stake
	and !(room == rm_general) and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] = 0 //No Plant
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][0] = 1 //Is Tilled
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 0 //No Object On The Cell
		{
		audio_play_sound(snd_place_stake, 0, 0)
		global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 1;
		global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][7] = 7;
		
		instance_create_depth((grid_x*128) - 32, (grid_y*128) - 111, -bbox_bottom, obj_stake)

		//remove it from hand
		global.right_hand[# 0, 0] = 0
		global.right_hand[# 1, 0] = 0
		global.right_hand[# 2, 0] = 0
		global.right_hand[# 3, 0] = -1
		}

	//Till (Hoes)
	#region
	if mouse_check_button_pressed(mb_left) and global.left_hand[# 2, 0] == 4 //4 = Hoes
	and !(room == rm_general) and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] = 0 //No Plant
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][0] == 0 //Is Not Tilled
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] == 0 //No Object On The Cell
		{
		audio_play_sound(snd_till, 0, 0)
		tilemap_set(_map_id, 6, grid_x, grid_y );
		//increse fertility
		array_set(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 2, array_get(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 2) + 1)
		//set tile to 1
		array_set(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 0, 1)
		//damage it
		global.left_hand[# 3, 0] -= 1
		}

	if mouse_check_button_pressed(mb_right) and global.right_hand[# 2, 0] == 4 //4 = Hoes
	and !(room == rm_general) and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][4] = 0 //No Plant
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][0] == 0 //Is Not Tilled
	and global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] == 0//No Object On The Cell
		{
		audio_play_sound(snd_till, 0, 0)
		tilemap_set(_map_id, 6, grid_x, grid_y );
		//increse fertility
		array_set(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 2, array_get(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 2) + 1)
		//set tile to 1
		array_set(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 0, 1)
		//damage it
		global.right_hand[# 3, 0] -= 1		
		}
	#endregion
	
	}
	
	
// Turn tiles of the vegetable garden back to normal if nothing is above them
for (var _i = 0; _i < room_width/128; _i++)
	{
		for (var _j = 0; _j < room_height/128; _j++)
		{
		if global.ds_the_vegetable_garden_tiles[# _i, _j][0] == 1 and global.ds_the_vegetable_garden_tiles[# _i, _j][4] == 0 
		and !(global.ds_the_vegetable_garden_tiles[# _i, _j][7] == 7)
			{
			global.ds_the_vegetable_garden_tiles[# _i, _j][5] += time_increment
			if global.ds_the_vegetable_garden_tiles[# _i, _j][5] == limit
				{
				global.ds_the_vegetable_garden_tiles[# _i, _j][0] = 0
				}
			}
		else
			{
			global.ds_the_vegetable_garden_tiles[# _i, _j][5] = 0;
			}
		}
	}