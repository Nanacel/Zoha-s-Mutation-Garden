if room != rm_forest_of_pink exit;

if keyboard_check_pressed(vk_enter) 
	{
	obj_world.show_map = !obj_world.show_map;
	audio_play_sound(snd_enter_location, 0, false); 
	level = 0;
	exploring = false;
	}
	

if !(obj_world.show_map == false) exit;


//if mouse_wheel_down() and end_scroll_down == false and level > max_display
//{scroll -= 1}

//if mouse_wheel_up() and end_scroll_up == false and level > max_display
//{scroll += 1}



