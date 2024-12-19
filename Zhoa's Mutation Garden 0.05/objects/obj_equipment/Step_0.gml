for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
	{
	if global.ds_inventory[# 0, _i] == 0 { global.ds_inventory[# 1, _i] = 0;}
	if global.ds_inventory[# 1, _i] <= 0 { global.ds_inventory[# 1, _i] = 0; global.ds_inventory[# 0, _i] = 0}
	if global.ds_inventory[# 2, _i] == 7 //furnitures
		{global.ds_inventory[# 1, _i] = 1;}
	if global.ds_inventory[# 3, _i] == 0 { global.ds_inventory[# 0, _i] = 0;}
	}

//----------------Setup Load----------------//

load = clamp(load, 0, obj_inventory.inv_slots)

load = 0
	
for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
	{
	if !(global.ds_inventory[# 2, _i] == 0) { load += 1}
	}

//----------------Setup Lists----------------//

if draw_seeds = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	if scroll == 0 end_scroll_up = true;
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load

	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 3) //3 = seeds 
			{
			displayed += 1
			}
		}
	}

if draw_equipment = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	if scroll == 0 end_scroll_up = true;
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load

		
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 4) //4 = hoes
		or !(global.ds_inventory[# 2,  _i] == 10) //10 = shovels
		or !(global.ds_inventory[# 2,  _i] == 11) //11 = hatchets
			{
			displayed += 1
			}
		}				
	}

if draw_consumables = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 5) //5 = fruits
		or !(global.ds_inventory[# 2,  _i] == 6) //6 = vegetables
		or !(global.ds_inventory[# 2,  _i] == 8) //8 = flowers
			{
			displayed += 1
			}
		}				
	}

if draw_recipes = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 500) //500
			{
			displayed += 1
			}
		}				
	}

if draw_ores = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 500) //500
			{
			displayed += 1
			}
		}				
	}

if draw_materials = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 9) //9 = materials
			{
			displayed += 1
			}
		}				
	}

if draw_furnitures = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 7) //7 = furniture
			{
			displayed += 1
			}
		}				
	}

if draw_misc = true
	{

	if mouse_wheel_down() and load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if load >= 15 {displayed = 15 + scroll}
	else displayed = load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 500) //500
			{
			displayed += 1
			}
		}				
	}
	
if !(global.show_equipment == true)  exit	
	{
	if keyboard_check_pressed(ord("C")) {scr_sort_inventory()}
	}