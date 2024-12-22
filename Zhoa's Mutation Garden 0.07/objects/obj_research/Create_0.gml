scale = 1;

temp = 0;

clock = 0;
increment = 1/60;

global.research_points = 300;

global.researched = [];

number_of_techs = 1;

tech_name = array_create(0);
tech_number = array_create(0);
tech_sprite = array_create(0);
tech_description = array_create(0);
tech_description_effect = array_create(0);
tech_effect = array_create(0);
tech_requirements = array_create(0);
tech_cost = array_create(0);
tech_x = array_create(0);
tech_y = array_create(0);

//-------------------------TECHS-------------------------//

tech_name[0] = "Basics of Research";
tech_number[0] = 0;
tech_sprite[0] = 3;
tech_description[0] = "Thinking and understanding concepts are key\nto progress in every aspect of life.";
tech_description_effect[0] = "Research Points +1/s";
tech_effect[0] = -1;
tech_requirements[0] = [-1]; //No Requirements
tech_cost[0] = 300;
tech_x[0] = 1000;
tech_y[0] = 850;
