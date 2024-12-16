scale = 1;

grid_x = 0;
grid_y = 0;

tile_size = 128

number_of_stats = 13

//-------------------------------Lands-------------------------------//

global.ds_the_vegetable_garden_crops = ds_grid_create( 7, 4);

for (var _i = 0; _i < room_width/128; _i++)
	{
		for (var _j = 0; _j < room_height/128; _j++)
		{
		global.ds_the_vegetable_garden_crops[# _i, _j] = array_create(number_of_stats, 0);
		}
	}