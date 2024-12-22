if (room = rm_menu) exit;	

if array_contains(global.researched, 0) and obj_world.exploring == false

{
clock += increment
if clock >= 1 {global.research_points += 1; clock = 0}
}