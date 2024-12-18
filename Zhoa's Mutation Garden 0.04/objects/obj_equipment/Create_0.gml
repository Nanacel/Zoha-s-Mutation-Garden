scale = 1;

max_display = 0;

displayed = 0;
scroll = 0
end_scroll_down = false;
end_scroll_up = false;

load = 0;

draw_seeds = false;
draw_equipment = false;
draw_consumables = false;
draw_recipes = false;
draw_ores = false;
draw_materials = false;
draw_furnitures = false;
draw_misc = false;

correct_height = 0;

global.left_hand = ds_grid_create(4,1)
global.right_hand = ds_grid_create(4,1)

left_hand_full = false;
right_hand_full = false;