if (room == rm_general) or (room == rm_menu)  exit;	

var _xx = camera_get_view_x(view_camera[0]);
var _yy = camera_get_view_y(view_camera[0]);

var _lay_id = layer_get_id("Tiles_1");
var _map_id = layer_tilemap_get_id(_lay_id);

//draw_text(mouse_x, mouse_y, string(mouse_x) + " " + string(mouse_y))
draw_text(mouse_x, mouse_y + 160, string(global.ds_the_vegetable_garden_tiles[# grid_x, grid_y]))
draw_text(mouse_x, mouse_y + 190, string(global.ds_the_vegetable_garden_crops[# grid_x, grid_y]))
draw_text(mouse_x, mouse_y + 220, 
string(global.left_hand[# 0, 0]) + " " 
+ string(global.left_hand[# 1, 0]) + " "
+ string(global.left_hand[# 2, 0]) + " "
+ string(global.left_hand[# 3, 0]) + "     "
+ string(global.right_hand[# 0, 0]) + " " 
+ string(global.right_hand[# 1, 0]) + " "
+ string(global.right_hand[# 2, 0]) + " "
+ string(global.right_hand[# 3, 0]))

draw_text(mouse_x, mouse_y + 250, string(tile_get_index(tilemap_get(layer_tilemap_get_id(layer_get_id("Tiles_1") ), grid_x, grid_y))))