random_music_the_vegetable_garden = 0;
	
music_instance = noone;
music_asset = noone;
target_music_asset = noone;

global.music_volume = 1;

end_fade_out_time = 0; //frames to fade out music
start_fade_in_time = 0; //frames to fade in new music
fade_in_instance_volume = 1;
test = 0

fade_out_inst = array_create(0); //audio instances to fade out
fade_out_inst_volume = array_create(0); //volume of audio instances
fade_out_inst_time = array_create(0); //fade out duration