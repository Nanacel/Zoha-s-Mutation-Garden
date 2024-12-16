if (room = rm_menu) exit;	


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1102 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 1335 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_research = false
	{
	global.show_research = !global.show_research; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_world = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	}
	
if (global.show_research = false) exit;

draw_set_font(fnt_plus);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_sprite(spr_research_menu, 0, 0, 0)

var _c = c_black;
draw_text_transformed_color(105, 95, string(global.research_points), scale, scale, 0,_c, _c, _c, _c, 1 )



for (var _i = 0; _i < number_of_techs; _i++)
	{		
	//Can Be Researched
	if (array_contains(tech_requirements[_i], -1) and !(array_contains(global.researched, tech_number[_i])))
	or (array_contains_ext(global.researched, tech_requirements[_i], true ) and !(array_contains(global.researched, tech_number[_i])))
		{
		draw_set_font(fnt_plus);
		draw_sprite_ext(spr_research_sprites, 0, tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 0.5)
		draw_sprite_ext(spr_research_sprites, tech_sprite[_i], tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 0.5)
		if point_in_rectangle( mouse_x, mouse_y, tech_x[_i], tech_y[_i], tech_x[_i] + 102, tech_y[_i] + 102)
				{
				draw_text( 60, 200, string(tech_name[_i]))
				draw_set_font(fnt_plus_small);
				draw_text( 60, 280, "Cost: " + string(tech_cost[_i]))
				draw_text( 60, 430, string(tech_description[_i]))
				draw_text( 60, 600, string(tech_description_effect[_i]))
				draw_text( 60, 750, "CLICK TO RESEARCH")
				draw_text( 60, 800, "Requirements: ")
				for (var _j = 0; _j < array_length(tech_requirements[_i]) ; _j++)
					{
					 if !(tech_requirements[_i][_j] == -1) {draw_text( 60, 835 + 35*_j, tech_name[tech_requirements[_i][_j]])}
					}
				
				if mouse_check_button_pressed(mb_left) and global.research_points >= tech_cost[_i]
					{
					array_insert(global.researched, 0, tech_number[_i] );
					global.research_points -= tech_cost[_i];
					}
				}
		}
	
	//Researched
	if array_contains(global.researched, tech_number[_i])
		{
		draw_sprite_ext(spr_research_sprites, 0, tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 1)
		draw_sprite_ext(spr_research_sprites, tech_sprite[_i], tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 1)
		if point_in_rectangle( mouse_x, mouse_y, tech_x[_i], tech_y[_i], tech_x[_i] + 102, tech_y[_i] + 102)
				{
				draw_text( 60, 200, string(tech_name[_i]))
				draw_set_font(fnt_plus_small);
				draw_text( 60, 280, "Cost: " + string(tech_cost[_i]))
				draw_text( 60, 430, string(tech_description[_i]))
				draw_text( 60, 600, string(tech_description_effect[_i]))
				draw_text( 60, 750, "RESEARCHED")
				draw_text( 60, 800, "Requirements: ")
				for (var _j = 0; _j < array_length(tech_requirements[_i]) ; _j++)
					{
					if !(tech_requirements[_i][_j] == -1) {draw_text( 60, 835 + 35*_j, tech_name[tech_requirements[_i][_j]])}
					}
				}
		}
	//Not Researched but visible
	if array_contains_ext(global.researched, tech_requirements[_i], false ) and !array_contains_ext(global.researched, tech_requirements[_i], true )
		{
		draw_sprite_ext(spr_research_sprites, 0, tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 0.5)
		draw_sprite_ext(spr_research_sprites, tech_sprite[_i], tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 0.5)
		draw_sprite_ext(spr_research_sprites, 1, tech_x[_i], tech_y[_i], 3, 3, 0, c_white, 1)
		if point_in_rectangle( mouse_x, mouse_y, tech_x[_i], tech_y[_i], tech_x[_i] + 102, tech_y[_i] + 102)
				{
				draw_text( 60, 200, "???")
				draw_set_font(fnt_plus_small);
				draw_text( 60, 280, "Cost: " + "???")
				draw_text( 60, 430, "???")
				draw_text( 60, 600, "???")
				draw_text( 60, 750, "UNLOCK REQUIREMENTS TO RESEARCH")
				draw_text( 60, 800, "Requirements: ")
				for (var _j = 0; _j < array_length(tech_requirements[_i]) ; _j++)
					{
					if !(tech_requirements[_i][_j] == -1) {draw_text( 60, 835 + 35*_j, tech_name[tech_requirements[_i][_j]])}
					}
				}
		}
	}
	
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

//draw_text_transformed_color(670, 68, "General  |  Cooking  |  Fighting  |  Tools  |  Gardening", scale, scale, 0,_c, _c, _c, _c, 1 )