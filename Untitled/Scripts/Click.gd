extends Node

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta):
	if Input.is_action_just_pressed("Left_Mouse"):
		$Mouse.volume_db=SaveFile.game_data.sfx_vol
		$Mouse.play()
