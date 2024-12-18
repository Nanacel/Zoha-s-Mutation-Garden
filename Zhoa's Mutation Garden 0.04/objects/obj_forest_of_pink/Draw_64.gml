if !(obj_world.show_map == false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

//------------------------------Setting Up HUD------------------------------//

if room == rm_forest_of_pink
	{
	draw_sprite(spr_exploration_background, 0, 0, 0)
	draw_text( 40, 100, "Press ENTER to return to the world map" )

	if exploring == false
		{
		draw_rectangle_color(495, 890, 665, 944, 9145227, 9145227, 9145227, 9145227, false)
		draw_rectangle_color(495, 895, 665, 939, 12961221, 12961221, 12961221, 12961221, false)
		draw_rectangle(495, 890, 665, 944, true)
		draw_rectangle(494, 889, 666, 945, true)
		draw_rectangle(493, 888, 667, 946, true)
		 draw_text( 505, 900, "EXPLORE")
		}

	if exploring == true
		{
		draw_rectangle_color(410, 890, 755, 944, 9145227, 9145227, 9145227, 9145227, false)
		draw_rectangle_color(410, 895, 755, 939, 12961221, 12961221, 12961221, 12961221, false)
		draw_rectangle(410, 890, 755, 944, true)
		draw_rectangle(409, 889, 756, 945, true)
		draw_rectangle(408, 888, 757, 946, true)
		 draw_text( 420, 900, "STOP EXPLORATION")
		}

	if point_in_rectangle(mouse_x, mouse_y, 493, 888, 667, 946 ) and mouse_check_button_pressed(mb_left)
	and exploring == false and clicked == false
		{
		exploring = true
		clicked = true;
		}
	
	if point_in_rectangle(mouse_x, mouse_y, 408, 888, 757, 946 ) and mouse_check_button_pressed(mb_left)
	and exploring == true and clicked == false
		{
		exploring = false
		clicked = true;
		}
	
	clicked = false;
	}

draw_text( 200, 200, string(event));
//------------------------------Exploration------------------------------//

if exploring == true
	{
	chrono += time_increment
	if chrono >= cycle_duration
		{
		randomize()
		event = irandom_range(0, 1);
		script_execute_ext(forest_of_pink_event_effect[event], forest_of_pink_event_arg[event]);
		level += 1
		array_push(event_list,forest_of_pink_event_text[event])
		chrono = 0;
		}
	}
	
if (level >= 0 and exploring == true and  room = rm_forest_of_pink) or (level > 0 and room = rm_forest_of_pink)
{draw_text_ext( 1160, 180, "You enter a magical forest.", 24, 700)} //38 characters max, 20 lines

for (var _i = 0; _i < level; _i++)
	{
	if room = rm_forest_of_pink
		{
		draw_text( 1160, 215 + 35*_i, event_list[_i] );
		}
	}