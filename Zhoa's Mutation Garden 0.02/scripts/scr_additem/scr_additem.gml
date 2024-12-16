function scr_additem(_item, _num, _type, _stats)
	{
	var _ds_inv = global.ds_inventory;
	var _picked_up = false;
	//check if item exists in inventory
	var _break = false;
	var _yy = 0; repeat(obj_inventory.inv_slots) 
	{
		
	var _xx = 0; repeat(obj_inventory.inv_slots)
		{
		if (((_ds_inv[# 0, _xx] != _item) and (_ds_inv[# 0, _xx] != 0))
		
		or 
		
		((_ds_inv[# 0, _xx] == _item)
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
		if _xx >= obj_inventory.inv_slots {_break = true; obj_global_market.bought = true; obj_crafting.crafted = true};
		}
	if _break == false
	{
	if (_ds_inv[# 0, _yy] == _item) 
	and  ((_ds_inv[# 1, _yy] <= 99 and _ds_inv[# 2, _yy] == 3)  // 3 = seeds
	or (_ds_inv[# 1, _yy] <= 0 and _ds_inv[# 2, _yy] == 4) // 4 = tools
	or (_ds_inv[# 1, _yy] <= 9 and _ds_inv[# 2, _yy] == 6) // 6 = vegetables
	or (_ds_inv[# 1, _yy] <= 0 and _ds_inv[# 2, _yy] == 4) // 4 = furniture
	or (_ds_inv[# 1, _yy] <= 9 and _ds_inv[# 2, _yy] == 8) // 8 = flowers
	or (_ds_inv[# 1, _yy] <= 9 and _ds_inv[# 2, _yy] == 9) // 9 = materials
	or (_ds_inv[# 1, _yy] <= 9 and _ds_inv[# 2, _yy] == 5)) // 5 = fruits
		{
		_ds_inv[# 1, _yy] += _num
		_ds_inv[# 2, _yy] = _type
		_ds_inv[# 3, _yy] = _stats
		_picked_up = true;
		break;
		} 
	else { _yy +=1 }
	}
	}
	//otherwise add it to an empty slot
	if !_picked_up 
		{
		_yy = 0; 
		repeat(obj_inventory.inv_slots) 
			{
			if _ds_inv[# 0, _yy] == item.none 
				{
				_ds_inv[# 0, _yy] += _item;
				_ds_inv[# 1, _yy] += _num;
				_ds_inv[# 2, _yy] = _type;
				_ds_inv[# 3, _yy] = _stats
				_picked_up = true;
				break;
				} 
			else { _yy +=1 }
			}
		}
	}
