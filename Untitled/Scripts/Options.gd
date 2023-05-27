extends Control

onready var displayoptions=$HBoxContainer/UI/Video/HBoxContainer/VBoxContainer2/displaymenu
onready var vsyncoption=$HBoxContainer/UI/Video/HBoxContainer/VBoxContainer2/vsync
onready var fpsoption=$HBoxContainer/UI/Video/HBoxContainer/VBoxContainer2/fpsdisplay
onready var masterslider=$HBoxContainer/UI/Audio/HBoxContainer/VBoxContainer/MasterSlider
onready var musicslider=$HBoxContainer/UI/Audio/HBoxContainer/VBoxContainer/MusicSlider
onready var sfxslider=$HBoxContainer/UI/Audio/HBoxContainer/VBoxContainer/SFXSlider
onready var ambientslider=$HBoxContainer/UI/Audio/HBoxContainer/VBoxContainer/AmbientSlider

func _ready():
	add_item()
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
	displayoptions.select(1 if SaveFile.game_data.fullscreen_on else 0)
	############IMPORTANT FOR OTHER SCENES DECLARATION###############
	GlobalSettings.toggle_fullscreen(SaveFile.game_data.fullscreen_on)
	vsyncoption.pressed=SaveFile.game_data.vsync_on
	fpsoption.pressed=SaveFile.game_data.display_fps
	masterslider.value=SaveFile.game_data.master_vol 
	musicslider.value=SaveFile.game_data.music_vol
	sfxslider.value=SaveFile.game_data.sfx_vol
	ambientslider.value=SaveFile.game_data.ambient_vol
	
func add_item():
	$HBoxContainer/UI/Video/HBoxContainer/VBoxContainer2/displaymenu.add_item("Windowed")
	$HBoxContainer/UI/Video/HBoxContainer/VBoxContainer2/displaymenu.add_item("Fullscreen")
	
func _on_Back_pressed():
	self.visible=false

func _on_Video_mouse_entered():
	Hover.play()

func _on_Audio_mouse_entered():
	Hover.play()

func _on_Apply_mouse_entered():
	Hover.play()

func _on_Back_mouse_entered():
	Hover.play()
	
func _on_Video_pressed():
	$HBoxContainer/UI/Audio.visible=false
	$HBoxContainer/UI/Video.visible=true

func _on_Audio_pressed():
	$HBoxContainer/UI/Video.visible=false
	$HBoxContainer/UI/Audio.visible=true

func _on_displaymenu_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index==1 else false)

func _on_vsync_toggled(button_pressed):
	GlobalSettings.toggle_vsync(button_pressed)

func _on_fpsdisplay_toggled(button_pressed):
	GlobalSettings.toggle_fps_display(button_pressed)
	
func _on_MasterSlider_value_changed(value):
	GlobalSettings.update_master_vol(value)
	
func _on_MusicSlider_value_changed(value):
	GlobalSettings.update_music_vol(value)
	
func _on_SFXSlider_value_changed(value):
	GlobalSettings.update_sfx_vol(value)	

func _on_AmbientSlider_value_changed(value):
	GlobalSettings.update_ambient_vol(value)	
