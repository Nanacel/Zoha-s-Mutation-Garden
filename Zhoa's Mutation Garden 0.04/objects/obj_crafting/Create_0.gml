scale = 1;

correct_height = 0;
scroll = 0;

end_scroll_up = false;
end_scroll_down = false;

crafted = false;
finished = false;
finished_tools = false;
finished_left = false;
finished_right = false;

recipe = [];
quantities = [];
tools = [];
tools_usure = [];
endcode = false;

global.learned_recipes = [0, 1, 2];

recipe_name = array_create(0);
recipe_number = array_create(0);
recipe_sprite = array_create(0);
//recipe_category = array_create(0);
recipe_ingredients = array_create(0);
recipe_quantities = array_create(0);
recipe_quantitiy_output = array_create(0);
recipe_tools_needed = array_create(0);
recipe_tools_damage = array_create(0);

recipe_name[0] = "Stake";
recipe_number[0] = 0;
recipe_sprite[0] = 7;
//recipe_category[0] = 0; //Gardening
recipe_ingredients[0] = [13]; //Long branch
recipe_quantities[0] = [1];
recipe_quantitiy_output[0] = 1;
recipe_tools_needed[0] = [11]; //11 = Hatchets
recipe_tools_damage[0] = [1]