//Decrease health when bad season
for (var _i = 0; _i < 7; _i++)
	{
	for (var _j = 0; _j < 4; _j++)
		{
		if is_array(global.ds_the_vegetable_garden_crops[# _i, _j])
			{
			for (var _k = 0; _k < array_length(global.ds_the_vegetable_garden_crops[# _i, _j][11]); _k++)
				{
				if obj_time.month == array_get(global.ds_the_vegetable_garden_crops[# _i, _j][11], _k)
					{
					global.ds_the_vegetable_garden_crops[# _i, _j][1] -= global.ds_the_vegetable_garden_crops[# _i, _j][12]/60
					break;
					}
				}
			}
		}
	}

if (room == rm_general) or (room == rm_menu) or global.show_world == true exit;	

grid_x =  floor(mouse_x/tile_size)
grid_y =  floor(mouse_y/tile_size)

var _xx = camera_get_view_x(view_camera[0]);
var _yy = camera_get_view_y(view_camera[0]);


//EXIT IF NOT AT HOME
if (global.position != 0) {exit;}	

if point_in_rectangle(mouse_x, mouse_y, 199 +_xx, 199 +_yy, 1099 +_xx, 990 +_yy) and !is_undefined(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y])
	{
		
		
	if room == rm_the_vegetable_garden
		{
		//Plant seeds
		if mouse_check_button(mb_left) and global.left_hand[# 2, 0] == 3  // Seeds inhand
		and !(global.left_hand[# 1, 0] == 0) 
		and array_get(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y], 4) == 0  //Nothing Planted
		and array_get(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y], 0) == 1 // Tilled
		
		and ((global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 0 // No object on the cell
		and global.left_hand[# 3, 0][10] == 0) // AND the plant DON'T need a stake
		or // OR
		((global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 1) // There is an object
		and (global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][7] = 7) // This object is a stake 
		and global.left_hand[# 3, 0][10] == 1)) // AND the plant needs a stake
			{
			global.left_hand[# 3, 0][1] = global.left_hand[# 3, 0][2]

			if is_array(global.left_hand[# 3, 0])
			{
			global.ds_the_vegetable_garden_crops[# grid_x, grid_y] = [];
			var _cnt = 0;
			while(_cnt < array_length(global.left_hand[# 3, 0]))
				{
				global.ds_the_vegetable_garden_crops[# grid_x, grid_y][_cnt] = global.left_hand[# 3, 0][_cnt]
				_cnt++;
				}
			}
			
			array_set(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 4, 1)
			instance_create_layer(grid_x*tile_size - 32, grid_y*tile_size - 97, "Instances", obj_crop)
			global.left_hand[# 1, 0] -=1
			global.player.player_left_hand =  ds_grid_get(obj_inventory.ds_item_infos, 0, global.left_hand[# 0,0]) + " (" + string(global.left_hand[# 1, 0]) + ")"
			}
			
		if mouse_check_button(mb_right) 
		and global.right_hand[# 2, 0] == 3  // Seeds inhand
		and !(global.right_hand[# 1, 0] == 0) 
		and array_get(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y], 4) == 0 //Nothing Planted
		and array_get(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y], 0) == 1// Tilled
		
		and ((global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 0 // No object on the cell
		and global.right_hand[# 3, 0][10] == 0) // AND the plant DON'T need a stake
		or // OR
		((global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][6] = 1) // There is an object
		and (global.ds_the_vegetable_garden_tiles[# grid_x,grid_y][7] = 7) // This object is a stake 
		and global.right_hand[# 3, 0][10] == 1)) // AND the plant needs a stake
			{
			global.right_hand[# 3, 0][1] = global.right_hand[# 3, 0][2]
			
			if is_array(global.right_hand[# 3, 0])
			{
			global.ds_the_vegetable_garden_crops[# grid_x, grid_y] = [];
				var _cnt = 0;
				while(_cnt < array_length(global.right_hand[# 3, 0]))
					{
					global.ds_the_vegetable_garden_crops[# grid_x, grid_y][_cnt] = global.right_hand[# 3, 0][_cnt]
					_cnt++;
					}
				}
			
			array_set(global.ds_the_vegetable_garden_tiles[# grid_x,grid_y], 4, 1)
			instance_create_layer(grid_x*tile_size - 32, grid_y*tile_size - 97, "Instances", obj_crop)
			global.right_hand[# 1, 0] -=1
			global.player.player_right_hand =  ds_grid_get(obj_inventory.ds_item_infos, 0, global.right_hand[# 0,0]) + " (" + string(global.right_hand[# 1, 0]) + ")"
			}
		}	
	}