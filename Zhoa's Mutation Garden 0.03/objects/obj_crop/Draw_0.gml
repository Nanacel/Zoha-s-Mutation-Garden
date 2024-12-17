if (room = rm_menu) exit;	

//EXIT IF NOT AT HOME
if (global.position != 0) {exit;}	

if instance_exists(obj_crop){
draw_text(mouse_x + 50, mouse_y + 350, string(obj_crop.growth_stage_timer) + " " + string(obj_crop.growth_stage) )
}

if (room == rm_general) or (room == rm_menu)  exit;	

if is_array(global.ds_the_vegetable_garden_crops[# grid_x, grid_y]) and recorded == false
	{
	record_x = grid_x;
	record_y = grid_y
	recorded = true;
	}
	
if recorded == true and is_array(global.ds_the_vegetable_garden_crops[# record_x, record_y])
	{
	draw_sprite_part_ext(spr_crops, global.ds_the_vegetable_garden_crops[# record_x, record_y][0],
	growth_stage*frame_width, 
	0,
	frame_width, frame_height,
	x, y - 110, 4, 4, c_white, 1)
	}