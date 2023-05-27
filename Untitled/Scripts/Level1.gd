extends Node

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	MusicController.play_music_stop()
	MusicController.ambient1()
	#MusicController.play_level1()
	


