if (room = rm_menu) exit;	


draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _c = c_black;

//Menu
draw_sprite(spr_menu_background, 0, 0 ,0)

draw_text_transformed_color(15 ,15, "LANDS   |", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(185, 15, "GLOBAL MARKET   |", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(515, 15, "WORLD   |", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(700 , 15, "EQUIPMENT   |", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(950 , 15, "STATUS   |", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1130 , 15, "RESEARCH   |", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1365 , 15, "CRAFTING   |", scale, scale, 0,_c, _c, _c, _c, 1 )

draw_line_width(-1, 60, 1920, 60, 3)


//Date
draw_text_transformed_color(45, 1035, "Date: " 
+ string(obj_time.day_string) + string(obj_time.day) + " / "
+ string(obj_time.monthname) + " / Year "
+ string(obj_time.year), 
scale, scale, 0,_c, _c, _c, _c, 1 )

draw_line_width(-1, 1020, 1920, 1020, 3)

if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1850 + camera_get_view_x(view_camera[0]), 1020 + camera_get_view_y(view_camera[0]), 1920 + camera_get_view_x(view_camera[0]), 1080 + camera_get_view_y(view_camera[0]))
	{
	game_end()
	}