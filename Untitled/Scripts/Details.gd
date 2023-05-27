extends Control

func _ready():
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
		
func _on_close_pressed():
	get_tree().change_scene("res://Scenes/Wish.tscn")

func _on_close_mouse_entered():
	Hover.play()
