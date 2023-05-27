extends Node

func _ready():
	MusicController.titlestop()
	MusicController.stopwish()
	MusicController.play_music()

func _process(delta):
	if Input.is_action_pressed("console"):
		$Console.visible=true
		
	if UserData.user_data.hide_wish==true:
		$UI/Menu/Update/Wish.visible=false
	else:
		$UI/Menu/Update/Wish.visible=true
	
	if UserData.user_data.hide_test==true:
		$UI/Menu/Buttons/Test.visible=false
	else:
		$UI/Menu/Buttons/Test.visible=true

func _on_Back_pressed():
	FadeScene.change_scene("res://Scenes/TitleScreen.tscn", "shortfade")
	
func _on_NewGame_mouse_entered():
	Hover.play()
	
func _on_Options_mouse_entered():
	Hover.play()
	
func _on_Quit_mouse_entered():
	Hover.play()
	
func _on_Quit_pressed():
	$QuitScene.visible=true

func _on_Developer_mouse_entered():
	$Devs.visible=true

func _on_Developer_mouse_exited():
	$Devs.visible=false

func _on_Continue_mouse_entered():
	Hover.play()

func _on_Test_mouse_entered():
	Hover.play()

func _on_Options_pressed():
	$Options.visible=true

func _on_Test_pressed():
	FadeScene.change_scene("res://Scenes/Test.tscn", "shortfade")

func _on_Wish_mouse_entered():
	Hover.play()

func _on_Wish_pressed():
	FadeScene.change_scene("res://Scenes/Wish.tscn", "shortfade")
	MusicController.playwish()

func _on_Pseudo_mouse_entered():
	Hover.play()

func _on_Pseudo_pressed():
	FadeScene.change_scene("res://Scenes/Pseudo.tscn", "shortfade")
	MusicController.playwish()

func _on_Uniform_mouse_entered():
	Hover.play()

func _on_Uniform_pressed():
	FadeScene.change_scene("res://Scenes/Uniform.tscn", "shortfade")
	MusicController.playwish()

