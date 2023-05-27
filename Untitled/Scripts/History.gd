extends Control

onready var maingridcontainer=get_node("VBoxContainer/HBoxContainer2/ScrollContainer/GridContainer")
var slot_template=preload("res://Resources/UI/HistorySlots.tscn")

func _ready():
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
	for i in GlobalSettings.loot_history.keys():
		var slot_new=slot_template.instance()
		var rarity=GameData.weapon_data[str(GlobalSettings.loot_history[i])]["Rarity"]
		var weapon_name=GameData.weapon_data[str(GlobalSettings.loot_history[i])]["Name"]
		var stars_texture=load("res://Resources/HUD/"+str(rarity)+"stars.png")
		slot_new.get_node("name").set_text(weapon_name)
		slot_new.get_node("rarity").set_texture(stars_texture)
		maingridcontainer.add_child(slot_new, true)
func _on_close_pressed():
	get_tree().change_scene("res://Scenes/Wish.tscn")
	
func _on_close_mouse_entered():
	Hover.play()
