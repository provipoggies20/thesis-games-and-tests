extends Control

onready var maingridcontainer=get_node("VBoxContainer/HBoxContainer2/ScrollContainer/GridContainer")
var slot_template=preload("res://Resources/UI/InventorySlots.tscn")
var unlocked=0

func _ready():
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
	for i in GameData.weapon_data.keys():
		var slot_new=slot_template.instance()
		var rarity=GameData.weapon_data[i]["Rarity"]
		var weapon_name=GameData.weapon_data[i]["Name"]
		var frame_texture=load("res://Resources/HUD/"+str(rarity)+".png")
		var icon_texture=load("res://Resources/HUD/icon/"+weapon_name+".png")
		var stars_texture=load("res://Resources/HUD/"+str(rarity)+"stars.png")
		slot_new.get_node("border/frame").set_texture(frame_texture)
		slot_new.get_node("border/icon").set_texture(icon_texture)
		slot_new.get_node("border/stars").set_texture(stars_texture)
		slot_new.get_node("border/TextureRect/quantity_name").set_text(weapon_name)
		slot_new.get_node("border/disabled").visible=true
		for c in UserInventory.inventory_data.keys():
			if UserInventory.inventory_data[c]["Item"]!=null:
				if str(UserInventory.inventory_data[c]["Item"])==str(i):
					slot_new.get_node("border/disabled").visible=false
		maingridcontainer.add_child(slot_new, true)
	$VBoxContainer/HBoxContainer2/unlock.set_text("All:"+str(GameData.weapon_data.size()))
func _on_close_pressed():
	get_tree().change_scene("res://Scenes/Wish.tscn")

func _on_close_mouse_entered():
	Hover.play()
