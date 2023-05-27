extends Node

func _ready():
	MusicController.play_music_stop()
	if SaveFile.game_data.display_fps==true:
		$Control/fps.visible=true
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("console"):
		$Console.visible=true
	$Control/GridContainer/TopContainer/TextureRect/primogemholder.set_text(str(UserData.user_data.temp_primogems))
	$Control/GridContainer/TopContainer/TextureRect2/intertwinedholder.set_text(str(UserData.user_data.temp_intertwined))
	$Control/GridContainer/TopContainer/TextureRect3/acquaintholder.set_text(str(UserData.user_data.temp_acquaint))
	if UserData.user_data.temp_intertwined<10:
		$Control/GridContainer/BotContainer/TextureRect3/pull10.add_color_override("font_color", Color(255,0,0))
	else:
		$Control/GridContainer/BotContainer/TextureRect3/pull10.add_color_override("font_color", Color(90,90,90))
	if UserData.user_data.temp_intertwined<1:
		$Control/GridContainer/BotContainer/TextureRect2/pull1.add_color_override("font_color", Color(255,0,0))
	else:
		$Control/GridContainer/BotContainer/TextureRect2/pull1.add_color_override("font_color", Color(90,90,90))
func _on_close_pressed():
	FadeScene.change_scene("res://Scenes/StartScreen.tscn", "shortfade")

func _on_close_mouse_entered():
	Hover.play()
	
func _on_inventory_mouse_entered():
	Hover.play()

func _on_inventory_pressed():
	get_tree().change_scene("res://Scenes/Inventory.tscn")
	
func _on_history_pressed():
	get_tree().change_scene("res://Scenes/History.tscn")

func _on_history_mouse_entered():
	Hover.play()

func _on_archive_mouse_entered():
	Hover.play()

func _on_archive_pressed():
	get_tree().change_scene("res://Scenes/Archive.tscn")

func _on_details_pressed():
	get_tree().change_scene("res://Scenes/Details.tscn")

func _on_details_mouse_entered():
	Hover.play()

func _on_pull1_pressed():
	if UserData.user_data.temp_intertwined>=1:
		GlobalSettings.signal_pull=1
		get_tree().change_scene("res://Scenes/AfterWish.tscn")
		UserData.user_data.temp_intertwined-=1
		UserData.save_data()
		MusicController.stopwish()
	else:
		$convert.visible=true
	
func _on_pull10_pressed():
	if UserData.user_data.temp_intertwined>=10:
		GlobalSettings.signal_pull=10
		get_tree().change_scene("res://Scenes/AfterWish.tscn")
		UserData.user_data.temp_intertwined-=10
		UserData.save_data()
		MusicController.stopwish()
	else:
		$convert.visible=true

func _on_disclaimer_mouse_entered():
	Hover.play()

func _on_disclaimer_toggled(button_pressed):
	if(button_pressed):
		$Control/GridContainer/BotContainer/disclaimer/TextureRect.visible=true
	else:
		$Control/GridContainer/BotContainer/disclaimer/TextureRect.visible=false
		
func _on_cancel_pressed():
	$convert.visible=false
	
func _on_confirm_pressed():
	UserData.user_data.temp_primogems-=1600
	UserData.user_data.temp_intertwined+=10
	UserData.save_data()
	$convert.visible=false
