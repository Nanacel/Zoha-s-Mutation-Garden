if !(obj_world.show_map == false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);


//------------------------------Setting Up HUD------------------------------//
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

//------------------------------Exploration------------------------------//

if exploring == false exit;

draw_text( 1160, 180, "You enter a magical forest.") //38 characters max
if string_length("You enter a magical forest.") > 38 
	{
	if string_last_pos(" ", "You enter a magical forest.")
		{
		}
	}

chrono += time_increment

if chrono >= cycle_duration
	{
	chrono = 0;
	}