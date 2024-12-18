draw_text(900, 100, 
string(global.left_hand[# 0, 0]) + " " 
+ string(global.left_hand[# 1, 0]) + " "
+ string(global.left_hand[# 2, 0]) + " "
+ string(global.left_hand[# 3, 0]) + "     "
+ string(global.right_hand[# 0, 0]) + " " 
+ string(global.right_hand[# 1, 0]) + " "
+ string(global.right_hand[# 2, 0]) + " "
+ string(global.right_hand[# 3, 0]))

for (var _i = 0; _i< 20; _i++)
	{
	draw_text(900, 40*_i + 220, 
	string(global.ds_inventory[# 0, _i]) + " " 
	+ string(global.ds_inventory[# 1, _i]) + " "
	+ string(global.ds_inventory[# 2, _i]) + " "
	+ string(global.ds_inventory[# 3, _i]))
	}