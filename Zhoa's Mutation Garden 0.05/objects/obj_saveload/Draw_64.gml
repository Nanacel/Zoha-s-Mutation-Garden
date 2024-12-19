if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1780 + camera_get_view_x(view_camera[0]), 1020 + camera_get_view_y(view_camera[0]), 1850 + camera_get_view_x(view_camera[0]), 1080 + camera_get_view_y(view_camera[0])) 
and global.show_saveload = false
	{
	global.show_saveload = !global.show_saveload; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_world = false;
	global.show_collections = false;
	}
	
if (global.show_saveload = false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _c = c_black;

for (var _i = 0; _i < 5; _i++)
	{
	draw_rectangle_color( 75 , 95 + _i*51, 400, 135 + _i*51, 13553358, 13553358, 13553358, 13553358, false)
	draw_rectangle_color( 75 , 95 + _i*51, 400, 99 + _i*51, 9803157, 9803157, 9803157, 9803157, false)
	draw_rectangle_color( 75 , 131 + _i*51, 400, 135 + _i*51, 9803157, 9803157, 9803157, 9803157, false)
	if date[_i] = 0
		{draw_text_transformed_color(80, 100 + _i*50, "File " + string( _i + 1) + " : ", scale, scale, 0,_c, _c, _c, _c, 1 )}
	else	
		{draw_text_transformed_color(80, 100 + _i*50, "File " + string( _i + 1) + " : " + string(date[_i]), scale, scale, 0,_c, _c, _c, _c, 1 )}
	draw_rectangle( 75 , 95 + _i*51, 400, 135 + _i*51, true)
	draw_rectangle( 74 , 94 + _i*51, 401, 136 + _i*51, true)
	draw_rectangle( 73 , 93 + _i*51, 402, 137 + _i*51, true)
	
	if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 75 , 95 + _i*51, 400, 135 + _i*51)
		{
		mouse_pos = _i
		draw_save = true;
		}
		
	if draw_save = true
		{
		for (var _j = 0; _j < 2; _j++)
			{
			draw_rectangle_color( 808  + _j*147, 823 , 937 + _j*147, 882, 13553358, 13553358, 13553358, 13553358, false)
			draw_rectangle_color( 808  + _j*147, 823 , 937 + _j*147, 830, 9803157, 9803157, 9803157, 9803157, false)
			draw_rectangle_color( 808  + _j*147, 876 , 937 + _j*147, 882, 9803157, 9803157, 9803157, 9803157, false)
			draw_rectangle( 810  + _j*147, 825 , 935 + _j*147, 880, true)
			draw_rectangle( 809  + _j*147, 824 , 936 + _j*147, 881, true)
			draw_rectangle( 808  + _j*147, 823 , 937 + _j*147, 882, true)
			draw_text_transformed_color(770, 840,"       SAVE       LOAD", scale, scale, 0,_c, _c, _c, _c, 1 )
		
			if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,  810 , 825 , 935, 880)
				{
				audio_play_sound(snd_save_load, 0, 0)
				scr_save_game(mouse_pos)
				date[mouse_pos] = string(obj_time.day) + "/" + string(obj_time.month) + "/" + string(obj_time.year)
				draw_save = false;
				scr_save_settings()
				}		
				
			if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,  957, 825 , 1082, 880)
				{
				audio_play_sound(snd_save_load, 0, 0)
				scr_load_game(mouse_pos)
				draw_save = false;
				}		
			}
		}
	}