extends Node
	
func _ready():
	MusicController.playtitlestart()
	
func _on_Click_pressed():
	FadeScene.change_scene("res://Scenes/StartScreen.tscn", "fade")
