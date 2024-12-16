
//Play Music
if music_asset != target_music_asset
	{
	if audio_is_playing(music_instance)
		{
		array_push(fade_out_inst, music_instance);
		array_push(fade_out_inst_volume, fade_in_instance_volume);
		array_push(fade_out_inst_time, end_fade_out_time);
		music_instance = noone;
		music_asset = noone;
		}	
		
		if audio_exists(target_music_asset)
			{
			//Play music if old music has faded out
			music_instance = audio_play_sound(target_music_asset, 4, false);
			audio_sound_gain(music_instance, 0, 0);
			fade_in_instance_volume = 0;
			music_asset = target_music_asset;
			}
	}

//Volume Control
if audio_is_playing(music_instance)
	{
	//Fade In
	if start_fade_in_time > 0
		{
		if fade_in_instance_volume < 1 {fade_in_instance_volume += 1/start_fade_in_time;}
		}
	else {fade_in_instance_volume = 1;}
		
	//Set Gain
	audio_sound_gain(music_instance, fade_in_instance_volume*global.music_volume, 0);
	
	}
	
for (var _i = 0; _i < array_length(fade_out_inst); _i++)
	{
	if fade_out_inst_time[_i] > 0
		{
		if fade_out_inst_volume[_i] > 0 {fade_out_inst_volume[_i] -= 1/fade_out_inst_time[_i];};
		}
	else 
		{
		fade_out_inst_volume[_i] = 0;
		}
	audio_sound_gain(fade_out_inst[_i], fade_out_inst_volume[_i]*global.music_volume, 0);
	
	if fade_out_inst_volume[_i] > 0 
		{
		if audio_is_playing(fade_out_inst[_i] ){ audio_stop_sound(fade_out_inst[_i]) };
		array_delete(fade_out_inst, _i, 1)
		array_delete(fade_out_inst_volume, _i, 1)
		array_delete(fade_out_inst_time, _i, 1)
		
		_i--;
		
		}
	}
	
if !audio_is_playing(music_instance)
	{
	randomize()
	random_music_the_vegetable_garden = choose(mus_flower_bed_lullaby)
	
	if room == rm_general or room == rm_the_vegetable_garden
		{
		scr_set_music_ingame(random_music_the_vegetable_garden, 60, 0)
		}
	}