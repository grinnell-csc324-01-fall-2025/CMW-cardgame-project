// Inherit the parent event
event_inherited();

if(global.music_volume > 0) {
	global.music_volume = 0;
	audio_group_set_gain(gameMusic, 0, 0)	
} else {
	global.music_volume = 1;
	audio_group_set_gain(gameMusic, 1, 0);
}