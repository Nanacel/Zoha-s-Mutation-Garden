if (room = rm_menu) exit;	


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1336 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 1558 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_crafting = false
	{
	global.show_crafting = !global.show_crafting; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_world = false;
	global.show_saveload = false;
	global.show_collections = false
	}
	
if (global.show_crafting = false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_sprite(spr_craft_menu, 0, 0, 0);

var _c = c_black;
draw_text_transformed_color(90, 120, "RECIPES:", scale, scale, 0,_c, _c, _c, _c, 1 )

if (scroll <=0) {end_scroll_up = true} else {end_scroll_up = false}
if (array_length(global.learned_recipes) <= 12) {end_scroll_down = true}

if (mouse_wheel_down() and end_scroll_down == false) {scroll += 1}
if (mouse_wheel_up() and end_scroll_up == false) {scroll -= 1}

correct_height = 0;
for (var _m = 0; _m < array_length(recipe_number); _m++)
	{
	if array_contains(global.learned_recipes, _m)
		{
		draw_text(60,  177 + 50*_m - 50*correct_height -50*scroll, recipe_name[_m] )
		draw_rectangle( 30,  172 + 50*_m - 50*correct_height -50*scroll, 652,  220 + 50*_m - 50*correct_height -50*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 30,  172 + 50*_m - 50*correct_height -50*scroll, 652,  220 + 50*_m - 50*correct_height -50*scroll)
			{
			draw_text( 950,  125, recipe_name[_m] + " x " + string(recipe_quantitiy_output[_m]))
			draw_sprite_ext(spr_icons,recipe_sprite[_m] , 1579, 145, 4, 4, 0, c_white, 1)
			draw_text( 950,  175, obj_inventory.ds_item_infos[# 1 , recipe_sprite[_m] ])
			
			draw_text( 950,  414, "Requirements: ") 
			for (var _p = 0; _p < array_length(recipe_ingredients[_m]); _p++)
				{
				draw_text( 950,  444 + _p*35, string(ds_grid_get(obj_inventory.ds_item_infos, 0, array_get(array_get(recipe_ingredients, _m ) , _p))));
				draw_text( 1200,  444 + _p*35, string(array_get(array_get(recipe_quantities, _m ), _p)));
				}
				
			draw_text(1377, 414, "Tools needed: ")
			for (var _p = 0; _p < array_length(recipe_tools_needed[_m]); _p++)
				{
				draw_text( 1377,  444 + _p*35, string(ds_grid_get(obj_inventory.ds_item_infos, 3, array_get(array_get(recipe_tools_needed, _m ) , _p))));
				draw_text( 1580,  444 + _p*35, string(array_get(array_get(recipe_tools_damage, _m ), _p)) + " damage");
				}
			
			if mouse_check_button_pressed(mb_left)
				{
				scr_sort_inventory()
				//Setting up temp arrays
				recipe = []
				quantities = []
				tools = []
				tools_usure = []
				for (var _z = 0; _z < array_length(recipe_ingredients[_m]); _z++)
					{
					array_insert(recipe, _z, recipe_ingredients[_m][_z])
					array_insert(quantities, _z, recipe_quantities[_m][_z])
					}
				for (var _z = 0; _z < array_length(recipe_tools_needed[_m]); _z++)
					{
					array_insert(tools, _z, recipe_tools_needed[_m][_z])
					array_insert(tools_usure, _z, recipe_tools_damage[_m][_z])
					}
					

					
				for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
					{
					for (var _j = 0; _j < array_length(recipe); _j++)
						{
						//Check we have enough materials and tools
						if (global.ds_inventory[# 0, _i] == recipe[_j])
						and (global.ds_inventory[# 1, _i] >= quantities[_j])
							{
							array_delete(recipe, _j, 1)
							array_delete(quantities, _j, 1)
							}
							
					for (var _w = 0; _w < array_length(tools); _w++)
						{	
						if
						((global.left_hand[# 2, 0] == tools[_w])
						and (global.left_hand[# 3, 0] >= tools_usure[_w]))
						or ((global.right_hand[# 2, 0] == tools[_w])
						and (global.right_hand[# 3, 0] >= tools_usure[_w]))
						or
						((global.ds_inventory[# 2, _i] == tools[_w])
						and (global.ds_inventory[# 3, _i] >= tools_usure[_w]))
							{
							array_delete(tools, _j, 1)
							array_delete(tools_usure, _j, 1)
							}							
						}
							//Check if inventory is not full
							var _ds_inv = global.ds_inventory;
							var _xx = 0; repeat(obj_inventory.inv_slots)
								{
								if (((_ds_inv[# 0, _xx] != recipe_sprite[_m]) and (_ds_inv[# 0, _xx] != 0))
								or 
								((_ds_inv[# 0, _xx] == recipe_sprite[_m])
								and ((_ds_inv[# 1, _xx] > 99 and _ds_inv[# 2, _xx] == 3) // 3 = seeds
								or (_ds_inv[# 1, _xx] > 0 and _ds_inv[# 2, _xx] == 4) // 4 = hoes
								or (_ds_inv[# 1, _xx] > 0 and _ds_inv[# 2, _xx] == 10) // 10 = shovels
								or (_ds_inv[# 1, _xx] > 0 and _ds_inv[# 2, _xx] == 11) // 11 = hatchets
								or (_ds_inv[# 1, _xx] > 9 and _ds_inv[# 2, _xx] == 6) // 6 = vegetables
								or (_ds_inv[# 1, _xx] > 0 and _ds_inv[# 2, _xx] == 7) // 7 = furnitures
								or (_ds_inv[# 1, _xx] > 9 and _ds_inv[# 2, _xx] == 8) // 8 = flowers
								or (_ds_inv[# 1, _xx] > 9 and _ds_inv[# 2, _xx] == 9) // 9 = materials
								or (_ds_inv[# 1, _xx] > 9 and _ds_inv[# 2, _xx] == 5)))) // 5 = fruits
								{_xx += 1}
								if _xx >= obj_inventory.inv_slots {endcode = true};
								}
						if endcode == true exit;
						
						//If we have enough
						if array_length(recipe) == 0 and array_length(tools) == 0
							{							
							for (var _z = 0; _z < array_length(recipe_ingredients[_m]); _z++)
								{
								array_insert(recipe, _z, recipe_ingredients[_m][_z])
								array_insert(quantities, _z, recipe_quantities[_m][_z])
								}
							for (var _z = 0; _z < array_length(recipe_tools_needed[_m]); _z++)
								{
								array_insert(tools, _z, recipe_tools_needed[_m][_z])
								array_insert(tools_usure, _z, recipe_tools_damage[_m][_z])
								}
							
							
							for (var _k = 0; _k < obj_inventory.inv_slots; _k++)
								{
									
								//Tools	
								for (var _l = 0; _l < array_length(tools); _l++)
									{	
									if((global.left_hand[# 2, 0] == tools[_l])
									and (global.left_hand[# 3, 0] >= tools_usure[_l]))
									and finished_tools = false
									and finished_left = false
										{
										global.left_hand[# 3, 0] -= tools_usure[_l]
										array_delete(tools, _l, 1)
										array_delete(tools_usure, _l, 1)
										if array_length(tools) == 0
											{
											finished_tools = true;
											}
										}
									}
								finished_left = true
									
								for (var _l = 0; _l < array_length(tools); _l++)
									{
									if ((global.right_hand[# 2, 0] == tools[_l])
									and (global.right_hand[# 3, 0] >= tools_usure[_l]))	
									and finished_tools = false
									and finished_right = false
										{
										global.right_hand[# 3, 0] -= tools_usure[_l]
										array_delete(tools, _l, 1)
										array_delete(tools_usure, _l, 1)
										if array_length(tools) == 0
											{
											finished_tools = true;
											}
										}
									}
								finished_right = true

								for (var _l = 0; _l < array_length(tools); _l++)
									{
									if (global.ds_inventory[# 2, _k] == tools[_l])
									and (global.ds_inventory[# 3, _k] >= tools_usure[_l])
									and finished_tools = false
										{
										global.ds_inventory[# 3, _k] -= tools_usure[_l]
										array_delete(tools, _l, 1)
										array_delete(tools_usure, _l, 1)
										if array_length(tools) == 0
											{
											finished_tools = true;
											}
										}
									}
										

										
									
								//Items	
								for (var _l = 0; _l < array_length(recipe); _l++)
									{
									if (global.ds_inventory[# 0, _k] == recipe[_l])
									and (global.ds_inventory[# 1, _k] >= quantities[_l])
									and finished = false
										{
										global.ds_inventory[# 1, _k] -= quantities[_l]
										array_delete(recipe, _l, 1)
										array_delete(quantities, _l, 1)
										audio_play_sound(snd_hammer, 0, false);
										if array_length(recipe) == 0
											{
											scr_additem(recipe_sprite[_m], recipe_quantitiy_output[_m], obj_inventory.ds_item_infos[# 5, recipe_sprite[_m]], obj_inventory.ds_item_infos[# 6, recipe_sprite[_m]]);
											finished = true;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		
		}
	else correct_height += 1
	}
finished = false;
finished_tools = false;
finished_left = false
finished_right = false
endcode = false;