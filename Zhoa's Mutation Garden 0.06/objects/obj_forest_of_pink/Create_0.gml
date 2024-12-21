//----------Scroll----------//
max_display = 9;

displayed = 0;
scroll = 0
end_scroll_down = false;
end_scroll_up = false;

stop_automatic_scroll = false;
auto_scroll_count = 0;

skip = 0;
reinit = true;

//----------Set Up----------//
exploring = false;
clicked = false;

time_increment = 1/60;
cycle_duration = 3;
chrono = 0;

how_mny_t_true = 0;

event = 0;
level = 0;
event_list = []
event_num_list = []

//----------Events----------//
forest_of_pink_event_name = array_create(0);
forest_of_pink_event_text = array_create(0);
forest_of_pink_event_effect = array_create(0);
forest_of_pink_event_arg = array_create(0);
forest_of_pink_event_prob = array_create(0);

forest_of_pink_event_name[0] = "Nothing";
forest_of_pink_event_text[0] = "You're wandering in the forest..." ;
forest_of_pink_event_effect[0] = noone; 
forest_of_pink_event_arg[0] = noone ;
forest_of_pink_event_prob[0] = 4;

forest_of_pink_event_name[1] = "Branch";
forest_of_pink_event_text[1] = "You pick up a branch.";
forest_of_pink_event_effect[1] = scr_additem;
forest_of_pink_event_arg[1] = [14, 1, 9, -1];
forest_of_pink_event_prob[1] = 2;


forest_of_pink_total_prob = 0;
for (var _i = 0; _i < array_length(forest_of_pink_event_prob); _i++)
	{
	forest_of_pink_total_prob += forest_of_pink_event_prob[_i] ;
	}
