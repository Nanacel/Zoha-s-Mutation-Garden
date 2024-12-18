exploring = false;
clicked = false;

time_increment = 1/60;
cycle_duration = 3;
chrono = 0;

how_mny_t_true = 0;

event = 0;
level = 0;
event_list = []

forest_of_pink_event_name = array_create(0);
forest_of_pink_event_text = array_create(0);
forest_of_pink_event_effect = array_create(0);
forest_of_pink_event_arg = array_create(0);
forest_of_pink_event_prob = array_create(0);

forest_of_pink_total_prob = 0;

forest_of_pink_event_name[0] = "Nothing";
forest_of_pink_event_text[0] = "You're wandering in the forest..." ;
forest_of_pink_event_effect[0] = scr_additem; 
forest_of_pink_event_arg[0] = [0, 0, 0, -1] ;
forest_of_pink_event_prob[0] = 1;

forest_of_pink_event_name[1] = "Branch";
forest_of_pink_event_text[1] = "You pick up a branch.";
forest_of_pink_event_effect[1] = scr_additem;
forest_of_pink_event_arg[1] = [14, 1, 9, -1];
forest_of_pink_event_prob[1] = 1;


for (var _i = 0; _i < array_length(forest_of_pink_event_prob); _i++)
	{
	forest_of_pink_total_prob += forest_of_pink_event_prob[_i] ;
	}
