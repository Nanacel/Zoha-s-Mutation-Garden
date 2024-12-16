function scr_sort_inventory()
	{
	
	repeat 10
		{
		for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
			{
			if global.ds_inventory[# 0, _i] == 0 { global.ds_inventory[# 1, _i] = 0;}
			if global.ds_inventory[# 1, _i] <= 0 { global.ds_inventory[# 1, _i] = 0; global.ds_inventory[# 0, _i] = 0}
			}		
		
			{
			var _temp = array_create(0)
			var _ds_inv = global.ds_inventory;
			for (var _i = 0; _i < obj_inventory.inv_slots; _i++)
				{
				for (var _j = 0; _j < obj_inventory.inv_slots; _j++)
					{
					if (_ds_inv[# 0, _i] == _ds_inv[# 0, _j])
					and (_i != _j)
					and !(array_contains(_temp, _i))
					and //item is not stackable
					(!(_ds_inv[# 2, _i] == 4) //tools
					and !(_ds_inv[# 2, _i] == 10) //shovels
					and !(_ds_inv[# 2, _i] == 11) //hatchets
					and !(_ds_inv[# 2, _i] == 7)) //furnitures
			
					//and ((_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 99 and _ds_inv[# 2, _i] == 3) // 3 = seeds
					//or (_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 0 and _ds_inv[# 2, _i] == 4) // 4 = tools
					//or (_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 9 and _ds_inv[# 2, _i] == 6) // 6 = vegetables
					//or (_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 0 and _ds_inv[# 2, _i] == 7) // 7 = furnitures
					//or (_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 9 and _ds_inv[# 2, _i] == 8) // 8 = flowers
					//or (_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 9 and _ds_inv[# 2, _i] == 9) // 9 = materials
					//or (_ds_inv[# 1, _i] + _ds_inv[# 1, _j] <= 9 and _ds_inv[# 2, _i] == 5))// 5 = fruits			
						{
						//_ds_inv[# 1, _i] += 1
						scr_additem(_ds_inv[# 0, _i], 1, _ds_inv[# 2, _i], _ds_inv[# 3, _i])
						_ds_inv[# 1, _j] -= 1
						array_push(_temp, _j)
			
						}
					}
				}
			}
		}
	}