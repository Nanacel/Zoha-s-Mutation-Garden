if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1710 + camera_get_view_x(view_camera[0]), 1020 + camera_get_view_y(view_camera[0]), 1779 + camera_get_view_x(view_camera[0]), 1080 + camera_get_view_y(view_camera[0]))
and global.show_collections = false
	{
	audio_play_sound(snd_collections, 0, 0)
	global.show_collections = !global.show_collections; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_world = false;
	global.show_saveload = false;
	}
	
if (global.show_collections = false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _c = c_black;

draw_sprite_ext(spr_book, 0, 960, 540, 4, 4, 0, c_white, 1)
draw_text(510, 200,"Chapters:")
draw_text(460, 300,"Achievements ----------- 0 / 0")
draw_text(460, 350,"Monster Hunt ------------ 0 / 0")
draw_text(460, 400,"Ores and Artifacts ------ 0 / 0")
draw_text(460, 450,"Plants --------------------- 0 / 0")
draw_text(460, 500,"Fishes --------------------- 0 / 0")
draw_text(460, 550,"Locations and Items --- 0 / 0")