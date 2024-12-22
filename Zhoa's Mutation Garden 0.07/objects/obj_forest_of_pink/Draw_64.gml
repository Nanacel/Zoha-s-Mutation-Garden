if global.show_world == false  {show_infos = false;}

if !(obj_world.show_map == false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

//------------------------------Setting Up HUD------------------------------//

if room == rm_forest_of_pink
	{
	if show_infos == false {draw_sprite(spr_exploration_background, 0, 0, 0)}
	if show_infos == true {draw_sprite(spr_exploration_background, 1, 0, 0)}
	draw_text( 40, 100, "Press ENTER to return to the world map" )
	
	if point_in_rectangle(mouse_x, mouse_y,1007, 183, 1069, 245) and mouse_check_button_pressed(mb_left)
	{
	if show_infos == true {audio_play_sound(snd_menu_off, 0, false)}
	if show_infos == false {audio_play_sound(snd_menu_on, 0, false)}
	show_infos = !show_infos
	}

	if obj_world.exploring == false
		{
		draw_rectangle_color(495, 890, 665, 944, 9145227, 9145227, 9145227, 9145227, false)
		draw_rectangle_color(495, 895, 665, 939, 12961221, 12961221, 12961221, 12961221, false)
		draw_rectangle(495, 890, 665, 944, true)
		draw_rectangle(494, 889, 666, 945, true)
		draw_rectangle(493, 888, 667, 946, true)
		 draw_text( 505, 900, "EXPLORE")
		}

	if obj_world.exploring == true
		{
		draw_rectangle_color(410, 890, 755, 944, 9145227, 9145227, 9145227, 9145227, false)
		draw_rectangle_color(410, 895, 755, 939, 12961221, 12961221, 12961221, 12961221, false)
		draw_rectangle(410, 890, 755, 944, true)
		draw_rectangle(409, 889, 756, 945, true)
		draw_rectangle(408, 888, 757, 946, true)
		 draw_text( 420, 900, "STOP EXPLORATION")
		}

	if point_in_rectangle(mouse_x, mouse_y, 493, 888, 667, 946 ) and mouse_check_button_pressed(mb_left)
	and obj_world.exploring == false and clicked == false
		{
		obj_world.exploring = true
		clicked = true;
		}
	
	if point_in_rectangle(mouse_x, mouse_y, 408, 888, 757, 946 ) and mouse_check_button_pressed(mb_left)
	and obj_world.exploring == true and clicked == false
		{
		obj_world.exploring = false
		clicked = true;
		}
	
	clicked = false;
	}
//------------------------------Exploration------------------------------//

if obj_world.exploring == true
	{
	chrono += time_increment
	if chrono >= cycle_duration
		{
		randomize()
		var _t = irandom_range(1, forest_of_pink_total_prob);
		for (var _j = 0; _j < array_length(forest_of_pink_event_prob); _j++; )
			{
			if (event <= _t and _t <= (event + forest_of_pink_event_prob[_j])) {event = _j; break;}
			else {event += forest_of_pink_event_prob[_j]}
			}
		if (forest_of_pink_event_effect[event] = scr_additem) 
		{forest_of_pink_event_arg[event][1] = irandom_range(1, 5)}
		if forest_of_pink_event_effect[event] != noone
			{
			script_execute_ext(forest_of_pink_event_effect[event], forest_of_pink_event_arg[event]);
			}
		level += 1
		array_push(event_list,forest_of_pink_event_text[event])
		if is_array(forest_of_pink_event_arg[event]) {array_push(event_num_list,forest_of_pink_event_arg[event][1])}
		else {array_push(event_num_list,0)}
		}
	}

if (level >= 0 and obj_world.exploring == true and  room = rm_forest_of_pink) or (level > 0 and room = rm_forest_of_pink)

//38 characters max, 20 lines

for (var _i = 0; _i < level + 1; _i++)
	{
	if reinit == true {skip = 0; reinit = false;};
	if _i >= auto_scroll_count or (_i < max_display and auto_scroll_count == 0)
		{
		if _i = 0 {draw_text_ext( 1160, 180 + 35*scroll, "1. You enter a magical forest.", 24, 700)}
		}
	if _i == level {break;};
	if room = rm_forest_of_pink
		{
		if _i +1 >= auto_scroll_count and _i < (max_display + auto_scroll_count) 
			{
			if (_i != 0 and string_length(event_list[_i - 1]) > 38 ) and !(_i  +1= level - max_display)
			{skip += 1;}; 
			if (_i != 0 and string_length(event_list[_i - 1]) > 76 ) and !(_i +1 = level - max_display) 
			{skip += 2;};
			if (_i != 0 and string_length(event_list[_i - 1]) <= 38 ) {}
			
			if event_num_list[_i] != 0
				{
				draw_text_ext( 1160, 215 + 35*_i + 35*scroll + 25*skip ,
				string(_i + 2) + ". " + event_list[_i] + " x" + string(event_num_list[_i]),
				30, 700);
				}
			
			if event_num_list[_i] == 0
				{
				draw_text_ext( 1160, 215 + 35*_i + 35*scroll + 25*skip ,
				string(_i + 2) + ". " + event_list[_i],
				30, 700);
				}
			}
		if level >= max_display and stop_automatic_scroll == false and chrono >= cycle_duration
		and  level + scroll > max_display
		{scroll -= 1; auto_scroll_count += 1; stop_automatic_scroll = true;};
		}
	}
	
if obj_world.exploring == true and chrono >= cycle_duration {chrono = 0}
stop_automatic_scroll = false;
reinit = true;

//------------------------------Info Menu------------------------------//
if show_infos == true 
	{
	draw_sprite(spr_about_exploration, 0, 1100, 182)
	draw_text( 1110, 192, "    ABOUT EXPLORATION")
	draw_text( 1110, 250, "- Every 3 seconds, an event will\noccur, ranging from nothing to\na (hostile?) encounter, finding items,\nor discovering secrets.")
	draw_text( 1110, 415, "- Time pauses during exploration,\nso you don't have to worry about\nyour crops decaying.")
	draw_text( 1110, 540, "- You cannot save during encounters!")
	draw_text( 1110, 585, "- Actions may require specific items\n(e.g., an axe to cut down a tree).\nThe prioritized item will be the one\nin your right hand, followed by\nyour left hand, and then items\nfrom your inventory.")
	draw_text( 1110, 815, "- Different items can be found at\ndifferent periods of the year. They will\nbe recorded in the collection book.")
	}