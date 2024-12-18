//----------------Setup Lists----------------//

if draw_seeds = true
	{

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	if scroll == 0 end_scroll_up = true;
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load

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

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	if scroll == 0 end_scroll_up = true;
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load

		
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

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load	
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

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load	
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

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load	
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

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load	
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

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 7) //7 = furnitures
			{
			displayed += 1
			}
		}				
	}

if draw_misc = true
	{

	if mouse_wheel_down() and obj_equipment.load > 15 and end_scroll_down = false {scroll += 0.5}
	if scroll*2 + 15 >= obj_equipment.load { end_scroll_down = true}
	else end_scroll_down = false;

	if mouse_wheel_up() and scroll > 0 and end_scroll_up = false {scroll -= 0.5}
	else end_scroll_up = false;

	if obj_equipment.load >= 15 {displayed = 15 + scroll}
	else displayed = obj_equipment.load	
	for  (var _i = 0; _i < obj_inventory.inv_slots;_i++)
		{
		if !(global.ds_inventory[# 2,  _i] == 500) //500
			{
			displayed += 1
			}
		}				
	}