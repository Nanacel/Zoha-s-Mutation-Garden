if (room = rm_menu) exit;	


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 919 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 1101 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_status = false
	{
	global.show_status = !global.show_status; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_world = false;
	global.show_equipment = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	}
	
if (global.show_status = false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _c = c_black;
draw_text_transformed_color(60, 80, "Health: "
+ string(global.player.player_health) + " / "
+ string(global.player.player_maxhealth)
, scale, scale, 0,_c, _c, _c, _c, 1 )