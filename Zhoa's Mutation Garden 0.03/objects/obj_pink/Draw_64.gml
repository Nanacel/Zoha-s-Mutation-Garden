if !(obj_world.show_map == false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_text( 40, 100, "Welcome to Pink! There is nothing interesting here for now...\nPress ENTER to return to the world map " )