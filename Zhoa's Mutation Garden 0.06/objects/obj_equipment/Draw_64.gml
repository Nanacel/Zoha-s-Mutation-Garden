if (room = rm_menu) exit;	


if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 665 + camera_get_view_x(view_camera[0]), 0 + camera_get_view_y(view_camera[0]), 918 + camera_get_view_x(view_camera[0]), 60 + camera_get_view_y(view_camera[0])) and global.show_equipment = false
	{
	global.show_equipment = !global.show_equipment; 
	global.show_global_market = false;
	global.show_lands = false;
	global.show_world = false;
	global.show_status = false;
	global.show_research = false;
	global.show_crafting = false;
	global.show_saveload = false;
	global.show_collections = false
	}
	
//Empty hands if item count = 0
if global.left_hand[# 1, 0] = 0
	{
	global.player.player_left_hand = "Nothing"
	global.left_hand[# 0, 0] = 0
	global.left_hand[# 2, 0] = 0
	global.left_hand[# 3, 0] = -1
	left_hand_full = false;
	}
	
if global.right_hand[# 1, 0] = 0
	{
	global.player.player_right_hand = "Nothing"
	global.right_hand[# 0, 0] = 0
	global.right_hand[# 2, 0] = 0
	global.right_hand[# 3, 0] = -1
	right_hand_full = false;
	}
	
//Delete damaged equipment
if global.left_hand[# 3, 0] = 0
	{
	global.player.player_left_hand = "Nothing"
	global.left_hand[# 0, 0] = 0
	global.left_hand[# 1, 0] = 0
	global.left_hand[# 2, 0] = 0
	left_hand_full = false;
	}
	
if global.right_hand[# 3, 0] = 0
	{
	global.player.player_right_hand = "Nothing"
	global.right_hand[# 0, 0] = 0
	global.right_hand[# 1, 0] = 0
	global.right_hand[# 2, 0] = 0
	right_hand_full = false;
	}

if (global.show_equipment = false) exit;

draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _c = c_black;

draw_text(520, 930, "Press C to sort the inventory\nHover over a stack and press X to delete it")

draw_sprite(spr_equipment_background, 0, 0 ,20)
draw_text_transformed_color(100, 183,
"SEEDS     EQUIPMENT     CONSUMABLES     RECIPES     ORES     MATERIALS     FURNITURES    MISC         "
+ string(load) + "/"
+ string(obj_inventory.inv_slots),
scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(100, 282," Name", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(460, 282," Type", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(620, 282," Amount", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(45, 930, "Backpack: None" , scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(45, 970, "Coins: " + string(global.coins) + "c", scale, scale, 0,_c, _c, _c, _c, 1 )

draw_text_transformed_color(1250, 275,"Helmet:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 320,"Glasses:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 365,"Mask:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 410,"Cape:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 455,"Shirt:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 500,"Suit:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 545,"Gloves:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 590,"Pants:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 635,"Shoes:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 680,"Medaillon:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 725,"Ring 1:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 770,"Ring 2:", scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 815,"Left hand: " + string(global.player.player_left_hand), scale, scale, 0,_c, _c, _c, _c, 1 )
draw_text_transformed_color(1250, 860,"Right hand: " + string(global.player.player_right_hand), scale, scale, 0,_c, _c, _c, _c, 1 )

//Unequip Left Hand when clicked on it
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1245, 810, 1705, 850) and !(load == obj_inventory.inv_slots)
	{	
	scr_additem(global.left_hand[# 0, 0], global.left_hand[# 1, 0] ,global.left_hand[# 2, 0] ,global.left_hand[# 3, 0])
	global.left_hand[# 0, 0] = 0
	global.left_hand[# 1, 0] = 0
	global.left_hand[# 2, 0] = 0
	global.left_hand[# 3, 0] = -1
	left_hand_full = false;
	}

//Unequip Right Hand when clicked on it
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 1245, 860, 1705, 900) and !(load == obj_inventory.inv_slots)
	{
	scr_additem(global.right_hand[# 0, 0], global.right_hand[# 1, 0] ,global.right_hand[# 2, 0] ,global.right_hand[# 3, 0])
	global.right_hand[# 0, 0] = 0
	global.right_hand[# 1, 0] = 0
	global.right_hand[# 2, 0] = 0
	global.right_hand[# 3, 0] = -1
	right_hand_full = false;
	}

//Seeds
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,90, 170, 228, 222)
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
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(800, 610, "Stats: " + "?",
				scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(800, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				if mouse_check_button_pressed(mb_left) and left_hand_full == false
					{
					global.left_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.left_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.left_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.left_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_left_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + " (" + string(global.left_hand[# 1, 0]) + ")"
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					left_hand_full = true;
					}
				if mouse_check_button_pressed(mb_right) and right_hand_full == false
					{
					global.right_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.right_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.right_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.right_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_right_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + " (" + string(global.right_hand[# 1, 0]) + ")"
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					right_hand_full = true;
					}
					
					
				if mouse_check_button_pressed(mb_left) and left_hand_full == true
					{
					scr_additem(global.left_hand[# 0, 0] ,global.left_hand[# 1, 0] , global.left_hand[# 2, 0], global.left_hand[# 3, 0] )
					global.left_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.left_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.left_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.left_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_left_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + " (" + string(global.left_hand[# 1,0]) + ")"
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					}
				if mouse_check_button_pressed(mb_right) and right_hand_full == true
					{
					scr_additem(global.right_hand[# 0, 0] ,global.right_hand[# 1, 0] ,global.right_hand[# 2, 0], global.right_hand[# 3, 0] )
					global.right_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.right_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.right_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.right_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_right_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + " (" + string(global.right_hand[# 1, 0]) + ")"
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					}	
					
				}
			}
		else correct_height += 1
		}
	}
#endregion

//Equipment
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,229, 170, 464, 222)
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
		if (global.ds_inventory[# 2,  _i + scroll] == 4 //4 = hoes
		or global.ds_inventory[# 2,  _i + scroll] == 10 //10 = shovels
		or global.ds_inventory[# 2,  _i + scroll] == 11) //11 = hatchets
		and max_display < 15
			{
				
			max_display += 1;
			
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]), scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(800, 610, "Condition: " +
				string(ds_grid_get(global.ds_inventory, 3,  _i + scroll)) + "/" + string(ds_grid_get(obj_inventory.ds_item_infos, 6, global.ds_inventory[# 0, _i + scroll])),
				scale, scale, 0,_c, _c, _c, _c, 1 )
				
				draw_text_transformed_color(800, 640,  ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				if mouse_check_button_pressed(mb_left) and left_hand_full == false
					{
					global.left_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.left_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.left_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]	
					global.left_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_left_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1	
					left_hand_full = true;
					}
				if mouse_check_button_pressed(mb_right) and right_hand_full == false
					{
					global.right_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.right_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.right_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.right_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_right_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					right_hand_full = true;
					}	
					
				if mouse_check_button_pressed(mb_left) and left_hand_full == true
					{
					scr_additem(global.left_hand[# 0, 0] ,global.left_hand[# 1, 0] ,global.left_hand[# 2, 0], global.left_hand[# 3, 0] )
					global.left_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.left_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.left_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.left_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_left_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					}
				if mouse_check_button_pressed(mb_right) and right_hand_full == true
					{
					scr_additem(global.right_hand[# 0, 0] ,global.right_hand[# 1, 0], global.right_hand[# 2, 0], global.right_hand[# 3, 0] )
					global.right_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.right_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.right_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.right_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_right_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					}
				}
			}
			else correct_height += 1
		}
	}
#endregion

//Consumables
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y, 465, 170, 750, 222)
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
			
			max_display += 1;
				
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + "\n"
				+ ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				}
			}
			else correct_height += 1
		}
	}
#endregion

//Recipes
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,751, 170, 930, 222)
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
		if global.ds_inventory[# 2,  _i + scroll] == 500 //500
		and max_display < 15
			{
			
			max_display += 1;
				
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + "\n"
				+ ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				}
			}
			else correct_height += 1
		}
	}
#endregion

//Ores
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,931, 170, 1067, 222)
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
		if global.ds_inventory[# 2,  _i + scroll] == 500 //500
		and max_display < 15
			{
			
			max_display += 1;
				
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + "\n"
				+ ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				}
			}
			else correct_height += 1
		}
	}
#endregion

//Materials
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1068, 170, 1289, 222)
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
		if global.ds_inventory[# 2,  _i + scroll] == 9 //9 = materials
		and max_display < 15
			{
			
			max_display += 1;
				
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + "\n"
				+ ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				}
			}
			else correct_height += 1
		}
	}
#endregion

//Furnitures
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1290, 170, 1536, 222)
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
			
			max_display += 1;
				
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + "\n"
				+ ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				if mouse_check_button_pressed(mb_left) and left_hand_full == false
					{
					global.left_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.left_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.left_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]	
					global.left_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_left_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1	
					left_hand_full = true;
					}
				if mouse_check_button_pressed(mb_right) and right_hand_full == false
					{
					global.right_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.right_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.right_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.right_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_right_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					right_hand_full = true;
					}	
					
				if mouse_check_button_pressed(mb_left) and left_hand_full == true
					{
					scr_additem(global.left_hand[# 0, 0] ,global.left_hand[# 1, 0] ,global.left_hand[# 2, 0], global.left_hand[# 3, 0] )
					global.left_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.left_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.left_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.left_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_left_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					}
				if mouse_check_button_pressed(mb_right) and right_hand_full == true
					{
					scr_additem(global.right_hand[# 0, 0] ,global.right_hand[# 1, 0], global.right_hand[# 2, 0], global.right_hand[# 3, 0] )
					global.right_hand[# 0, 0] = global.ds_inventory[# 0, _i + scroll]
					global.right_hand[# 1, 0] = global.ds_inventory[# 1, _i + scroll]
					global.right_hand[# 2, 0] = global.ds_inventory[# 2, _i + scroll]
					global.right_hand[# 3, 0] = global.ds_inventory[# 3, _i + scroll]
					global.player.player_right_hand = ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll])
					global.ds_inventory[# 0, _i + scroll] = 0
					global.ds_inventory[# 1, _i + scroll] = 0
					global.ds_inventory[# 2, _i + scroll] = 0
					global.ds_inventory[# 3, _i + scroll] = -1
					}
				}
			}
			else correct_height += 1
		}
	}
#endregion

//Misc
#region
if mouse_check_button_pressed(mb_left) and point_in_rectangle(mouse_x, mouse_y,1537, 170, 1650, 222)
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
		if global.ds_inventory[# 2,  _i + scroll] == 500 //500
		and max_display < 15
			{
			
			max_display += 1;
				
			//Name
			draw_text_transformed_color(110, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Type
			draw_text_transformed_color(465, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(obj_inventory.ds_item_infos, 3, global.ds_inventory[# 0, _i + scroll]),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			//Amount
			draw_text_transformed_color(625, 355 + (_i-correct_height)*35 - 35*scroll,
			ds_grid_get(global.ds_inventory, 1 , _i + scroll),
			scale, scale, 0,_c, _c, _c, _c, 1 )

			draw_rectangle(81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll, true)
			if point_in_rectangle(mouse_x, mouse_y, 81, 353 + (_i-correct_height)*35 - 35*scroll, 765, 386 +(_i-correct_height)*35 - 35*scroll)
				{
				draw_text_transformed_color(800, 580, 
				ds_grid_get(obj_inventory.ds_item_infos, 0, global.ds_inventory[# 0, _i + scroll]) + "\n"
				+ ds_grid_get(obj_inventory.ds_item_infos, 1, global.ds_inventory[# 0, _i + scroll]),
				scale, scale, 0,_c, _c, _c, _c, 1 )

				draw_sprite_stretched(spr_icons,
				ds_grid_get(obj_inventory.ds_item_infos, 4, global.ds_inventory[# 0, _i + scroll]),
				863, 295, 256, 256)
				
				if keyboard_check_pressed(ord("X")) 
				{global.ds_inventory[# 0, _i + scroll] = 0; global.ds_inventory[# 1, _i + scroll] = 0;
				global.ds_inventory[# 2, _i + scroll] = 0; global.ds_inventory[# 3, _i + scroll] = -1} 
				
				}
			}
			else correct_height += 1
		}
	}
#endregion

//DELETE FROM INVENTORY:
//global.ds_inventory[# 0, _i + scroll] = 0 //Nothing
//global.ds_inventory[# 1, _i + scroll] = 0 ///Amount = 0
//global.ds_inventory[# 2, _i + scroll] = 0 ///Type: none