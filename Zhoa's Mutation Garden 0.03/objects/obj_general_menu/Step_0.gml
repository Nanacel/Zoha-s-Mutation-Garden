if !(room == rm_general) and global.show_lands == false and global.show_world == false 
and 
(!(room == rm_menu) 
or !(room == rm_pink))
	{
	room_goto(rm_general)
	}