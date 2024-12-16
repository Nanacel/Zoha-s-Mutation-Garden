if (room = rm_menu) exit;	


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 152 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 480 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_global_market = false
	{
	global.show_global_market = true; 
	global.show_lands = false;
	global.show_world = false;
	global.show_equipment = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	}
	
if (global.show_global_market == false) exit;

//----------------------Draw Menu----------------------//

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _c = c_black;
draw_text_transformed_color(60, 100, "          BUY          SELL", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(45, 970, "Coins: " + string(global.coins) + "c", scale, scale, 0,_c, _c, _c, _c, 1 )


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,135, 88, 242, 147)
	{
	draw_sell_menu = false;
	draw_buy_menu = true;
	}
	
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,290, 88, 402, 147)
	{
	draw_sell_menu = true;
	draw_buy_menu = false;
	}

//----------------------Draw Buy Menu----------------------//
if draw_buy_menu == true
{
draw_sprite(spr_market_background, 0, 0 ,20)
draw_text_transformed_color(100, 183,
" LANDS     SEEDS     EQUIPMENT     CONSUMABLES     RECIPES     ORES     MATERIALS     FURNITURES    MISC",
scale, scale, 0,_c, _c, _c, _c, 1 )

draw_text_transformed_color(100, 282," Name", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(730, 282," Type", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1000, 282," Price", scale, scale, 0,_c, _c, _c, _c, 1 )

//Lands
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,95, 170, 238, 222)
	{
	draw_lands = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}


if draw_lands = true
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_lands_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_lands_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_lands_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_lands_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_lands_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_lands_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_lands_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_lands_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_lands_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_lands_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_lands_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_lands_price, _i + scroll)
				{
				audio_play_sound(snd_buy_sell, 0, 0)
				array_insert(global.lands, 0, array_get(for_sale_global_market_lands_num, _i + scroll) )
				global.coins -= array_get(for_sale_global_market_lands_price, _i + scroll)
				array_delete(for_sale_global_market_lands_name, _i + scroll, 1)
				array_delete(for_sale_global_market_lands_description, _i + scroll, 1)
				array_delete(for_sale_global_market_lands_price,_i + scroll, 1)
				array_delete(for_sale_global_market_lands_type, _i + scroll, 1)
				array_delete(for_sale_global_market_lands_num, _i + scroll, 1)
				}
			}
		}
	}
#endregion
	
//Seeds
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,239, 170, 386, 222)
	{
	draw_seeds = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_seeds = true
	{
	draw_lands = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_seeds_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_seeds_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_seeds_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_seeds_name)
	
	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_seeds_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_seeds_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_seeds_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_seeds_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_seeds_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_seeds_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_seeds_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_seeds_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_seeds_num, _i + scroll),
				1, array_get(for_sale_global_market_seeds_type_num, _i + scroll), array_get(for_sale_global_market_seeds_stats, _i + scroll))
				if bought == false {global.coins -= array_get(for_sale_global_market_seeds_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Equipment
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,387, 170, 620, 222)
	{
	draw_equipment = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if draw_equipment = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_equipment_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_equipment_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_equipment_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_equipment_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_equipment_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_equipment_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_equipment_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_equipment_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_equipment_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_equipment_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_equipment_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_equipment_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_equipment_num, _i + scroll),
				1, array_get(for_sale_global_market_equipment_type_num, _i + scroll), array_get(for_sale_global_market_equipment_stats, _i + scroll))
				if bought == false {global.coins -= array_get(for_sale_global_market_equipment_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Consumables
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,621, 170, 908, 222)
	{
	draw_consumables = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if draw_consumables = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_equipment = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_consumables_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_consumables_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_consumables_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_consumables_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_consumables_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_consumables_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_consumables_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_consumables_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_consumables_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_consumables_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_consumables_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_consumables_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_consumables_num, _i + scroll),
				1, array_get(for_sale_global_market_consumables_type_num, _i + scroll), array_get(for_sale_global_market_consumables_stats, _i + scroll))
				if bought == false {global.coins -= array_get(for_sale_global_market_consumables_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Recipes
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,909, 170, 1090, 222)
	{
	draw_recipes = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if 	draw_recipes = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_recipes_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_recipes_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_recipes_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_recipes_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_recipes_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_recipes_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_recipes_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_recipes_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_recipes_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_recipes_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_recipes_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_recipes_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_recipes_num, _i + scroll),
				1, array_get(for_sale_global_market_recipes_type_num, _i + scroll), -1)
				if bought == false {global.coins -= array_get(for_sale_global_market_recipes_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Ores
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1091, 170, 1232, 222)
	{
	draw_ores = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if 	draw_ores = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_ores_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_ores_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_ores_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_ores_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_ores_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_ores_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_ores_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_ores_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_ores_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_ores_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_recipes_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_ores_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_ores_num, _i + scroll),
				1, array_get(for_sale_global_market_ores_type_num, _i + scroll), -1)
				if bought == false {global.coins -= array_get(for_sale_global_market_ores_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Materials
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1233, 170, 1452, 222)
	{
	draw_materials = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if 	draw_materials = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_furnitures = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_materials_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_materials_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_materials_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_materials_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_materials_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_materials_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_materials_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_materials_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_materials_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_materials_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_materials_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_seeds_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_materials_num, _i + scroll),
				1, array_get(for_sale_global_market_materials_type_num, _i + scroll), -1)
				if bought == false {global.coins -= array_get(for_sale_global_market_materials_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Furnitures
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1453, 170, 1700, 222)
	{
	draw_furnitures = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if 	draw_furnitures = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_misc = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_furnitures_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_furnitures_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_furnitures_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_furnitures_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_furnitures_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_furnitures_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_furnitures_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_furnitures_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_furnitures_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_furnitures_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_furnitures_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_furnitures_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_furnitures_num, _i + scroll),
				1, array_get(for_sale_global_market_furnitures_type_num, _i + scroll), -1)
				if bought == false {global.coins -= array_get(for_sale_global_market_furnitures_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion

//Misc
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1701, 170, 1827, 222)
	{
	draw_misc = true;
	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}
	
if 	draw_misc = true
	{
	draw_lands = false;
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	
	if mouse_wheel_down() and array_length(for_sale_global_market_misc_name)> 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= array_length(for_sale_global_market_misc_name) { end_scroll_down = true}
	else end_scroll_down = false;
	
	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;
	
	if array_length(for_sale_global_market_misc_name) >= 15 {displayed = 15 + scroll}
	else displayed = array_length(for_sale_global_market_misc_name)

	for  (var _i = scroll; _i < displayed;_i++)
		{			
		draw_text_transformed_color(110, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_misc_name, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(740, 355 + _i*35 - 35*scroll,
		array_get(for_sale_global_market_misc_type, _i + scroll),
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_text_transformed_color(1010, 355 + _i*35 - 35*scroll,
		string(array_get(for_sale_global_market_misc_price, _i + scroll)) + "c",
		scale, scale, 0,_c, _c, _c, _c, 1 )
		
		draw_rectangle(81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll, true)
		if point_in_rectangle(mouse_x, mouse_y, 81, 353 + _i*35 - 35*scroll, 1282, 386 +_i*35 - 35*scroll)
			{
			draw_text_transformed_color(1385, 580, 
			string(array_get(for_sale_global_market_misc_name, _i + scroll)) + "\n"
			+ "Price: " + string(array_get(for_sale_global_market_misc_price, _i + scroll)) + "\n"
			+ array_get(for_sale_global_market_misc_description, _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_sprite_stretched(spr_icons,
			array_get(for_sale_global_market_misc_num, _i + scroll),
			1447, 295, 256, 256)
			
			if mouse_check_button_pressed(mb_left) and global.coins >= array_get(for_sale_global_market_misc_price, _i + scroll)
				{
				scr_additem( array_get(for_sale_global_market_misc_num, _i + scroll),
				1, array_get(for_sale_global_market_misc_type_num, _i + scroll), -1)
				if bought == false {global.coins -= array_get(for_sale_global_market_misc_price, _i + scroll); audio_play_sound(snd_buy_sell, 0, 0)}
				bought = false;
				}
			}
		}
	}
#endregion
}