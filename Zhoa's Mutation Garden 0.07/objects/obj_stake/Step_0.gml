if !is_array(global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y]) exit;
if global.left_hand[# 0, 0] == 0
and instance_exists(id)
and point_in_rectangle(mouse_x, mouse_y, id.x - 64 + 96, id.y - 63  + 160, id.x + 64  + 95, id.y + 64  + 160) 
and global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][7] == 7 //there is a stake
and global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][4] == 0 //no plant on the tile
and !(obj_equipment.load == obj_inventory.inv_slots) //inventory not full
and mouse_check_button_pressed(mb_left)
	{
	audio_play_sound(snd_pick_up, 0, 0)
	scr_additem(7,1,7,-1)
	global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][6] = 0
	global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][7] = 0
	instance_destroy(id)
	}
	
if global.right_hand[# 0, 0] == 0
and instance_exists(id)
and point_in_rectangle(mouse_x, mouse_y, id.x - 64 + 96, id.y - 63  + 160, id.x + 64  + 95, id.y + 64  + 160) 
and global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][7] == 7 //there is a stake
and global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][4] == 0 //no plant on the tile
and !(obj_equipment.load == obj_inventory.inv_slots) //inventory not full
and mouse_check_button_pressed(mb_right)
	{
	audio_play_sound(snd_pick_up, 0, 0)
	scr_additem(7,1,7,-1)
	global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][6] = 0
	global.ds_the_vegetable_garden_tiles[# obj_land.grid_x, obj_land.grid_y][7] = 0
	instance_destroy(id)
	}