scale = 1;
depth = 100

xx = 0;
yy = 0;

global.position = 0;
global.unlocked_locations = [0, 1, 2]
global.record_room = 0;
temp_goto = true;

show_map = true;

location_name = array_create(0);
location_sprite = array_create(0);
location_description = array_create(0);
location_x = array_create(0);
location_y = array_create(0);
//location_items = array_create(0);
//location_drop_chance = array_create(0);
//location_enemies = array_create(0);
location_room = array_create(0);

location_name[0] = "The Vegetable Garden";
location_sprite[0] = 0;
location_description[0] = "A small property located in a rural area.\nIts proximity to forests and a village make it\nthe perfect place for an apprentice gardener.\nContains 24 tiles.";
location_x[0] = 260;
location_y[0] = 1180;
//location_items[0] = [0];
//location_drop_chance[0] = [0];
//location_enemies[0] = [0];
location_room[0] = rm_general;

location_name[1] = "Forest of Pink";
location_sprite[1] = 1;
location_description[1] = "One might assume that this forest was\nnamed after the village in the vicinity;\nhowever, the truth is quite the opposite.\nIn autumn, the maple leaves transform into\na stunning shade of red and rose, making\nthis place the pride of the county.";
location_x[1] = 1200;
location_y[1] = 1300;
//location_items[1] = [0];
//location_drop_chance[1] = [0];
//location_enemies[1] = [0];
location_room[1] = rm_forest_of_pink;

location_name[2] = "Pink";
location_sprite[2] = 2;
location_description[2] = "A happy little isolated village, far from\nthe problems of the rest of the world.\nAlthough its population is small,\nits community is lively and joyful.";
location_x[2] = 80;
location_y[2] = 710;
//location_items[2] = [0];
//location_drop_chance[2] = [0];
//location_enemies[2] = [0];
location_room[2] = rm_pink;