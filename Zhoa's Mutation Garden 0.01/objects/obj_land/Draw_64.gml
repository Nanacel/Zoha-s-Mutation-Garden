if (room = rm_menu) exit;	


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 0 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 153 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_lands = false
	{
	global.show_lands = !global.show_lands; 
	global.show_global_market = false;
	global.show_world = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	scr_sort_inventory()
	}
	
if (global.show_lands = false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _c = c_black;

if (array_length(global.lands) == 0) 
	{
	draw_text_transformed_color(60, 80, "You don't own any land!", scale, scale, 0,_c, _c, _c, _c, 1 );
	if !(room == rm_general) {room_goto(rm_general)}
	exit;
	}

if !(room == rm_the_vegetable_garden)
	{room_goto(rm_the_vegetable_garden)}
	
draw_sprite(spr_land_view,0 ,0 ,0)

//---------Camera---------//

//Camera
var _xx = camera_get_view_x(view_camera[0]);
var _yy = camera_get_view_y(view_camera[0]);

_xx = clamp(camera_get_view_x(view_camera[0]), -room_width, room_width)
_yy = clamp(camera_get_view_y(view_camera[0]), -room_height, room_height)

if point_in_rectangle(mouse_x, mouse_y, 199 +_xx, 199 +_yy, 1099 +_xx, 990 +_yy)
	{
	if device_mouse_x_to_gui(0) >= left_edge and device_mouse_x_to_gui(0) <= left_edge_max
		{
		_xx -= view_move_amount
		}
	if device_mouse_x_to_gui(0) <= right_edge and device_mouse_x_to_gui(0) >= right_edge_max
		{
		_xx += view_move_amount
		}
	if device_mouse_y_to_gui(0) >= top_edge and device_mouse_y_to_gui(0) <= top_edge_max
		{
		_yy -= view_move_amount
		}
	if device_mouse_y_to_gui(0) <= down_edge and device_mouse_y_to_gui(0) >= down_edge_max
		{
		_yy += view_move_amount
		}
	camera_set_view_pos(view_camera[0], _xx, _yy);
	}

