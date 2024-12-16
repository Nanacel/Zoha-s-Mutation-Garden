	var _lay_id = layer_get_id("Tiles_1");
	var _map_id = layer_tilemap_get_id(_lay_id);

		
	for (var _i = 0; _i < room_width/128; _i++)
		{
		for (var _j = 0; _j < room_height/128; _j++)
			{
			if is_array(global.ds_the_vegetable_garden_tiles[# _i,_j]) 
			and array_first(global.ds_the_vegetable_garden_tiles[# _i, _j]) = 1
			and !(tile_get_index(tilemap_get(_map_id, _i, _j)) == 6)
				{
				tilemap_set(_map_id, 6, _i, _j );
				}
		
			if is_array(global.ds_the_vegetable_garden_tiles[# _i,_j]) 
			and array_first(global.ds_the_vegetable_garden_tiles[# _i, _j]) = 0
			and !(tile_get_index(tilemap_get(_map_id, _i, _j)) == 1)
				{
				tilemap_set(_map_id, 1, _i, _j );
				}
		
			}
		}