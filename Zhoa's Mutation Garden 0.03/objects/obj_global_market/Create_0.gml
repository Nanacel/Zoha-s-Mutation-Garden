draw_sell_menu = false;
draw_buy_menu = false;
scale = 1;

//---------Buy (and Sell)---------//
bought = false;

displayed = 0;
scroll = 0
end_scroll_down = false;
end_scroll_up = false;

//---------Sell---------//

max_display = 0;

correct_height = 0;


//---------Lands---------//

for_sale_global_market_lands_name = [obj_inventory.ds_item_infos[# 0, 1]];
for_sale_global_market_lands_description = [obj_inventory.ds_item_infos[# 1, 1]];
for_sale_global_market_lands_price = [obj_inventory.ds_item_infos[# 2, 1]];
for_sale_global_market_lands_type = [obj_inventory.ds_item_infos[# 3, 1]];
for_sale_global_market_lands_num = [obj_inventory.ds_item_infos[# 4, 1]];

draw_lands = false;

//---------Seeds---------//
for_sale_global_market_seeds_name = [obj_inventory.ds_item_infos[# 0, 2], obj_inventory.ds_item_infos[# 0, 3], obj_inventory.ds_item_infos[# 0, 8]];
for_sale_global_market_seeds_description = [obj_inventory.ds_item_infos[# 1, 2], obj_inventory.ds_item_infos[# 1, 3], obj_inventory.ds_item_infos[# 1, 8]];
for_sale_global_market_seeds_price = [obj_inventory.ds_item_infos[# 2, 2], obj_inventory.ds_item_infos[# 2, 3], obj_inventory.ds_item_infos[# 2, 8]];
for_sale_global_market_seeds_type = [obj_inventory.ds_item_infos[# 3, 2], obj_inventory.ds_item_infos[# 3, 3], obj_inventory.ds_item_infos[# 3, 8]];
for_sale_global_market_seeds_num = [obj_inventory.ds_item_infos[# 4, 2], obj_inventory.ds_item_infos[# 4, 3], obj_inventory.ds_item_infos[# 4, 8]];
for_sale_global_market_seeds_type_num = [obj_inventory.ds_item_infos[# 5, 2], obj_inventory.ds_item_infos[# 5, 3], obj_inventory.ds_item_infos[# 5, 8]];
for_sale_global_market_seeds_stats = [obj_inventory.ds_item_infos[# 6, 2], obj_inventory.ds_item_infos[# 6, 3], obj_inventory.ds_item_infos[# 6, 8]];

draw_seeds = false;


//---------Equipment---------//

for_sale_global_market_equipment_name = [obj_inventory.ds_item_infos[# 0, 4], obj_inventory.ds_item_infos[# 0, 10], obj_inventory.ds_item_infos[# 0, 11]];
for_sale_global_market_equipment_description = [obj_inventory.ds_item_infos[# 1, 4], obj_inventory.ds_item_infos[# 1, 10], obj_inventory.ds_item_infos[# 1, 11]];
for_sale_global_market_equipment_price = [obj_inventory.ds_item_infos[# 2, 4], obj_inventory.ds_item_infos[# 2, 10], obj_inventory.ds_item_infos[# 2, 11]];
for_sale_global_market_equipment_type = [obj_inventory.ds_item_infos[# 3, 4], obj_inventory.ds_item_infos[# 3, 10], obj_inventory.ds_item_infos[# 3, 11]];
for_sale_global_market_equipment_num = [obj_inventory.ds_item_infos[# 4, 4], obj_inventory.ds_item_infos[# 4, 10], obj_inventory.ds_item_infos[# 4, 11]];
for_sale_global_market_equipment_type_num = [obj_inventory.ds_item_infos[# 5, 4], obj_inventory.ds_item_infos[# 5, 10], obj_inventory.ds_item_infos[# 5, 11]];
for_sale_global_market_equipment_stats = [obj_inventory.ds_item_infos[# 6, 4], obj_inventory.ds_item_infos[# 6, 10], obj_inventory.ds_item_infos[# 6, 11]];

draw_equipment = false;

//---------Consumables---------//

for_sale_global_market_consumables_name = [obj_inventory.ds_item_infos[# 0, 5], obj_inventory.ds_item_infos[# 0, 6], obj_inventory.ds_item_infos[# 0, 9]];
for_sale_global_market_consumables_description = [obj_inventory.ds_item_infos[# 1, 5], obj_inventory.ds_item_infos[# 1, 6], obj_inventory.ds_item_infos[# 1, 9]];
for_sale_global_market_consumables_price = [obj_inventory.ds_item_infos[# 2, 5], obj_inventory.ds_item_infos[# 2, 6], obj_inventory.ds_item_infos[# 2, 9]];
for_sale_global_market_consumables_type = [obj_inventory.ds_item_infos[# 3, 5], obj_inventory.ds_item_infos[# 3, 6], obj_inventory.ds_item_infos[# 3, 9]];
for_sale_global_market_consumables_num = [obj_inventory.ds_item_infos[# 4, 5], obj_inventory.ds_item_infos[# 4, 6], obj_inventory.ds_item_infos[# 4, 9]];
for_sale_global_market_consumables_type_num = [obj_inventory.ds_item_infos[# 5, 5], obj_inventory.ds_item_infos[# 5, 6], obj_inventory.ds_item_infos[# 5, 9]];
for_sale_global_market_consumables_stats = [obj_inventory.ds_item_infos[# 6, 5], obj_inventory.ds_item_infos[# 6, 6], obj_inventory.ds_item_infos[# 6, 9]];

draw_consumables = false;

//---------Recipes---------//

for_sale_global_market_recipes_name = [];
for_sale_global_market_recipes_description = [];
for_sale_global_market_recipes_price = [];
for_sale_global_market_recipes_type = [];
for_sale_global_market_recipes_num = [];
for_sale_global_market_recipes_type_num = [];

draw_recipes = false;

//---------Ores---------//

for_sale_global_market_ores_name = [];
for_sale_global_market_ores_description = [];
for_sale_global_market_ores_price = [];
for_sale_global_market_ores_type = [];
for_sale_global_market_ores_num = [];
for_sale_global_market_ores_type_num = [];

draw_ores = false;

//---------Materials---------//

for_sale_global_market_materials_name = [obj_inventory.ds_item_infos[# 0, 12], obj_inventory.ds_item_infos[# 0, 13], obj_inventory.ds_item_infos[# 0, 14] ];
for_sale_global_market_materials_description = [obj_inventory.ds_item_infos[# 1, 12], obj_inventory.ds_item_infos[# 1, 13], obj_inventory.ds_item_infos[# 1, 14] ];
for_sale_global_market_materials_price = [obj_inventory.ds_item_infos[# 2, 12], obj_inventory.ds_item_infos[# 2, 13], obj_inventory.ds_item_infos[# 2, 14 ] ];
for_sale_global_market_materials_type = [obj_inventory.ds_item_infos[# 3, 12], obj_inventory.ds_item_infos[# 3, 13], obj_inventory.ds_item_infos[# 3, 14] ];
for_sale_global_market_materials_num = [obj_inventory.ds_item_infos[# 4, 12], obj_inventory.ds_item_infos[# 4, 13], obj_inventory.ds_item_infos[# 4, 14] ];
for_sale_global_market_materials_type_num = [obj_inventory.ds_item_infos[# 5, 12], obj_inventory.ds_item_infos[# 5, 13], obj_inventory.ds_item_infos[# 5, 14] ];
for_sale_global_market_consumables_stats = [obj_inventory.ds_item_infos[# 6, 12], obj_inventory.ds_item_infos[# 6, 13], obj_inventory.ds_item_infos[# 6, 14] ];

draw_materials = false;

//---------Furnitures---------//

for_sale_global_market_furnitures_name = [obj_inventory.ds_item_infos[# 0, 7]];
for_sale_global_market_furnitures_description = [obj_inventory.ds_item_infos[# 1, 7]];
for_sale_global_market_furnitures_price = [obj_inventory.ds_item_infos[# 2, 7]];
for_sale_global_market_furnitures_type = [obj_inventory.ds_item_infos[# 3, 7]];
for_sale_global_market_furnitures_num = [obj_inventory.ds_item_infos[# 4, 7]];
for_sale_global_market_furnitures_type_num = [obj_inventory.ds_item_infos[# 5, 7]];

draw_furnitures = false;

//---------Misc---------//

for_sale_global_market_misc_name = [];
for_sale_global_market_misc_description = [];
for_sale_global_market_misc_price = [];
for_sale_global_market_misc_type = [];
for_sale_global_market_misc_num = [];
for_sale_global_market_misc_type_num = [];

draw_misc = false;


