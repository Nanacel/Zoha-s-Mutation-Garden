scale = 1;


//Camera
buffer = 50

left_edge = 199
left_edge_max = left_edge + buffer;

right_edge = 1099;
right_edge_max = right_edge - buffer;

top_edge = 199
top_edge_max = top_edge + buffer;

down_edge = 900;
down_edge_max = down_edge - buffer;

view_move_amount = 8;


//Tiles Infos
tile_size = 128;
grid_x = 0;
grid_y = 0;

//-------Set Up Values-------//
//The Vegetable Garden

global.ds_the_vegetable_garden_tiles = ds_grid_create( 7, 4);

for (var _i = 0; _i < room_width/128; _i++)
	{
		for (var _j = 0; _j < room_height/128; _j++)
		{
		global.ds_the_vegetable_garden_tiles[# _i, _j] = [0, 0, 1, 1, 0, 0, 0, 0] //0 = is tilled;   1 = water level;   2 = fertility;   3 = type;   4 = is there a plant or seeds;	5 = tilled timer; 6 = is there an object on it; 7 = object ID?
																                   //0,0 = no; 0,1 = yes                                  3,1 = dirt  4,0 = no; 4,1 = yes                                 6,0 = no; 6,1 = yes           7, 0 = none
		}
	}

time_increment = 1/2.5
limit = 650