function scr_set_music_ingame(_music, _fade_out_current_music = 0, _fade_in = 0)
	{
	with obj_music
		{
		target_music_asset = _music;
		end_fade_out_time = _fade_out_current_music;
		start_fade_in_time = _fade_in;
		}
	}