if room != rm_pink exit;

if keyboard_check_pressed(vk_enter) {obj_world.show_map = !obj_world.show_map}

if !(obj_world.show_map == false) exit;