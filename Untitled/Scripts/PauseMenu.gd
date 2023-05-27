extends Control

func _on_Title_pressed():
	MusicController.stop_level1()
	MusicController.stop_level2()
	MusicController.stop_level3()
	MusicController.stop_level4()
	MusicController.amb1stop()
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")

func _on_Quit_pressed():
	$QuitScene.visible=true

func _on_Title_mouse_entered():
	Hover.play()

func _on_Quit_mouse_entered():
	Hover.play()	

func _on_Restart_pressed():
	get_tree().reload_current_scene()

func _on_Restart_mouse_entered():
	Hover.play()

func _on_Options_pressed():
	$Options.visible=true

func _on_Options_mouse_entered():
	Hover.play()

func _on_Back_pressed():
	self.hide()

func _on_Back_mouse_entered():
	Hover.play()
