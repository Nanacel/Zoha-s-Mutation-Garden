depth = -y - 20;

tile_size = 128;
grid_x = clamp( floor(mouse_x/tile_size), 0, floor(room_width/tile_size));
grid_y = clamp( floor(mouse_y/tile_size), 0, floor(room_height/tile_size));


recorded = false;
record_x = 0;
record_y = 0;

image = 0;

frame_width = 48;
frame_height = 72;
crop_number = 0;

age = 0;
growth_stage = 0;
growth_stage_timer = 0;
growth_stage_duration = 0;
max_growth_stage = (sprite_get_width(spr_crops)/frame_width) - 1;

grown = false;

number_of_stats = 13
crop_stats = array_create(number_of_stats);

time_increment = 1/60;