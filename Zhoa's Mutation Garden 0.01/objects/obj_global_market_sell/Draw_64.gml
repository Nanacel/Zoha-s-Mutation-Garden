if (room = rm_menu) exit;	


draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _c = c_black;

//Delete sold equipment
for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
{
if global.ds_inventory[# 1, _i] = 0
	{
	global.ds_inventory[# 0, _i] = 0
	global.ds_inventory[# 2, _i] = 0
	global.ds_inventory[# 3, _i] = -1
	}
}


if (global.show_global_market == false) exit;

//----------------------Draw Sell Menu----------------------//
if obj_global_market.draw_sell_menu == true
{
draw_sprite(spr_market_background, 0, 0 ,20)
draw_text_transformed_color(100, 183,
"           SEEDS     EQUIPMENT     CONSUMABLES     RECIPES     ORES     MATERIALS     FURNITURES    MISC",
scale, scale, 0,_c, _c, _c, _c, 1 )

draw_text_transformed_color(100, 282,"Name", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(500, 282,"Amount", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(730, 282,"Type", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1000, 282,"Price", scale, scale, 0,_c, _c, _c, _c, 1 )

//Seeds
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,179, 170, 326, 222)
	{
	draw_seeds = true;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_seeds = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 3//3 = seeds 
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price (seeds: (base obj_inventory price)/2)
			draw_text_transformed_color(1000, 355 + (_i-correct_height)*35 - 35*scroll,
			floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/2),
			scale, scale, 0,_c, _c, _c, _c, 1 )	

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 610, "Stats: " + "?",
				scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					global.coins += 
					floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/2)
					global.ds_inventory[# 1, _i + scroll] -= 1
					}

					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Equipment
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,327, 170, 560, 222)
	{
	draw_seeds = false;
	draw_equipment = true;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_equipment = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 4//4 = tools
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price ((base price/4) * (current wear/max wear))
			draw_text_transformed_color(1000, 355 + (_i-correct_height)*35 - 35*scroll,
			floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/4
			* (ds_grid_get(global.ds_inventory, 3,  _i + scroll) / ds_grid_get(obj_inventory.ds_item_infos, 6, global.ds_inventory[# 0, _i + scroll]))),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 610, "Condition: " +
				string(ds_grid_get(global.ds_inventory, 3,  _i + scroll)) + "/" + string(ds_grid_get(obj_inventory.ds_item_infos, 6, global.ds_inventory[# 0, _i + scroll])),
				scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					global.coins += 
					floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/4
					* (ds_grid_get(global.ds_inventory, 3,  _i + scroll) / ds_grid_get(obj_inventory.ds_item_infos, 6, global.ds_inventory[# 0, _i + scroll])))
					global.ds_inventory[# 1, _i + scroll] -= 1
					}
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Consumables
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,561, 170, 848, 222)
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = true;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_consumables = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if (global.ds_inventory[# 2,  _i + scroll] == 5 //5 = fruits
		or global.ds_inventory[# 2,  _i + scroll] == 6 //6 = vegetables
		or global.ds_inventory[# 2,  _i + scroll] == 8) //8 = flowers
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price: (plants: (base obj_inventory price)/2)
			draw_text_transformed_color(1000, 355 + (_i-correct_height)*35 - 35*scroll,
			floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/2),
			scale, scale, 0,_c, _c, _c, _c, 1 )	

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 610, "Stats: " + "?",
				scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					global.coins += 
					floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/2)
					global.ds_inventory[# 1, _i + scroll] -= 1
					}
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Recipes
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,849, 170, 1030, 222)
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = true;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_recipes = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 500//500
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price


			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					}	
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Ores
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1031, 170, 1172, 222)
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = true;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_ores = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 500//500
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price


			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					}	
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Materials
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1173, 170, 1392, 222)
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = true;
	draw_furnitures = false;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_materials = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 9//9 = materials
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price


			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					}	
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Furnitures
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1393, 170, 1640, 222)
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = true;
	draw_misc = false;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_furnitures = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 7 //7 = furnitures
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price ((base price/4)
			draw_text_transformed_color(1000, 355 + (_i-correct_height)*35 - 35*scroll,
			floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/4),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 610,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					global.coins += 
					floor(ds_grid_get(obj_inventory.ds_item_infos, 2, global.ds_inventory[# 0, _i + scroll])/4)
					global.ds_inventory[# 1, _i + scroll] -= 1
					}
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Misc
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1641, 170, 1767, 222)
	{
	draw_seeds = false;
	draw_equipment = false;
	draw_consumables = false;
	draw_recipes = false;
	draw_ores = false;
	draw_materials = false;
	draw_furnitures = false;
	draw_misc = true;

	scroll = 0;
	end_scroll_down = false;
	end_scroll_up = false;
	displayed = 0;
	}

if draw_misc = true
	{

	correct_height = 0;
	max_display = 0;
	
	for  (var _i = scroll; _i < displayed;_i++)
		{
		if global.ds_inventory[# 2,  _i + scroll] == 500//500
		and max_display < 15
			{
				
			max_display += 1
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(740, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(500, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )
			
			//Price


			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 1284, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(1385, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(1385, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				1447, 295, 256, 256)
				
				if mouse_check_button_pressed(mb_left)
					{
					audio_play_sound(snd_buy_sell, 0, 0)
					}	
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

}

