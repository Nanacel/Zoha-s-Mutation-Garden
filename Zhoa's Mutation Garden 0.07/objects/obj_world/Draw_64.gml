if (room = rm_menu) exit;	

if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 481 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 664 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_world = false
	{
	global.show_world = !global.show_world; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	room_goto(rm_general)
	temp_goto = false;
	}


if (global.show_world = false) exit;


if !(global.record_room == 0) and temp_goto == false {room_goto(global.record_room)}
temp_goto = true

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _c = c_black;

if show_map = true
	{
	if point_in_rectangle(mouse_x, mouse_y, 0, 60, 1920, 100) {yy -= 3}
	if point_in_rectangle(mouse_x, mouse_y, 0, 980, 1920, 1020) {yy += 3}

	if point_in_rectangle(mouse_x, mouse_y, 732, 60, 772, 1020) {xx -= 3}
	if point_in_rectangle(mouse_x, mouse_y, 1880, 60, 1920, 1020) {xx += 3}

	draw_sprite_part_ext(spr_world_map, 0, xx, yy -23, 640, 340, 0, 0, 3, 3, c_white, 1)
	draw_sprite(spr_world_map_background, 0, 0, 0)

	if point_in_rectangle(mouse_x, mouse_y, 732, 60, 1920, 1020)
		{
		for (var _i = 0; _i < array_length(global.unlocked_locations); _i++)
			{
			draw_rectangle( 732 + location_x[_i] - xx*3, 60 + location_y[_i] - yy*3, 732 + location_x[_i] - xx*3 + 150, 60 + location_y[_i] - yy*3 + 150, true)
			if point_in_rectangle(mouse_x, mouse_y, 732 + location_x[_i] - xx*3, 60 + location_y[_i] - yy*3, 732 + location_x[_i] - xx*3 + 150, 60 + location_y[_i] - yy*3 + 150)
				{
				draw_set_font(fnt_plus);
				draw_text(70, 100, location_name[_i]);
				draw_rectangle(77, 187, 338, 448, false );
				draw_sprite_stretched(spr_map_icons, location_sprite[_i], 80, 190, 256, 256 );
				draw_set_font(global.font_main);
				draw_text(70, 500, location_description[_i]);
				if mouse_check_button_pressed(mb_left)
					{
					room_goto(location_room[_i]);
					global.position = location_sprite[_i]
					global.record_room = location_room[_i];
					}
				}
			}
		}

	draw_set_font(global.font_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	//draw_text(mouse_x, mouse_y + 100, string(room));


	draw_text(30, 900, "Press ENTER to enter the current location")
	draw_text(30, 930, "Current location: " + location_name[global.position])
	}

if keyboard_check_pressed(vk_enter) and global.position = 0 //The Vegetable Garden
	{
	audio_play_sound(snd_enter_location, 0, false); 
	global.show_lands = !global.show_lands; 
	global.show_global_market = false;
	global.show_world = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	}

if !(obj_world.show_map == false) exit;