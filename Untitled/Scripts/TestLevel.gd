extends Control

onready var preview=$bgpreview

func _ready():
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
		
func _on_Back_pressed():
	FadeScene.change_scene("res://Scenes/StartScreen.tscn", "shortfade")

func _on_Back_mouse_entered():
	Hover.play()

func _on_Level1_mouse_entered():
	Hover.play()
	preview.texture=load("res://Resources/BG/1level.jpg")
	preview.visible=true
	MusicController.play_music_stop()
	MusicController.stop_level2()
	MusicController.stop_level3()
	MusicController.stop_level4()
	MusicController.play_level1()

func _on_Level2_mouse_entered():
	Hover.play()
	preview.texture=load("res://Resources/BG/2level.jpg")
	preview.visible=true
	MusicController.play_music_stop()
	MusicController.stop_level1()
	MusicController.stop_level3()
	MusicController.stop_level4()
	MusicController.play_level2()

func _on_Level3_mouse_entered():
	Hover.play()
	preview.texture=load("res://Resources/BG/3level.png")
	preview.visible=true
	MusicController.play_music_stop()
	MusicController.stop_level1()
	MusicController.stop_level2()
	MusicController.stop_level4()
	MusicController.play_level3()

func _on_Level4_mouse_entered():
	Hover.play()
	preview.texture=load("res://Resources/BG/4level.jpg")
	preview.visible=true
	MusicController.play_music_stop()
	MusicController.stop_level1()
	MusicController.stop_level2()
	MusicController.stop_level3()
	MusicController.play_level4()

func _on_Level1_mouse_exited():
	preview.visible=false
	MusicController.stop_level1()
	MusicController.play_music()

func _on_Level2_mouse_exited():
	preview.visible=false
	MusicController.stop_level2()
	MusicController.play_music()

func _on_Level3_mouse_exited():
	preview.visible=false
	MusicController.stop_level3()
	MusicController.play_music()

func _on_Level4_mouse_exited():
	preview.visible=false
	MusicController.stop_level4()
	MusicController.play_music()
