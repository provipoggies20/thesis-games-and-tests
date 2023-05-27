extends Control

onready var maingridcontainer=get_node("VBoxContainer/HBoxContainer2/ScrollContainer/GridContainer")
onready var variantgridcontainer=get_node("VBoxContainer/HBoxContainer2/MarginContainer/VBoxContainer/GridContainer")
var slot_template=preload("res://Resources/UI/InventorySlots.tscn")
func _ready():
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
	for i in UserInventory.inventory_data.keys():
		var slot_new=slot_template.instance()
		if UserInventory.inventory_data[i]["Item"]!=null:
			var rarity=GameData.weapon_data[str(UserInventory.inventory_data[i]["Item"])]["Rarity"]
			var weapon_name=GameData.weapon_data[str(UserInventory.inventory_data[i]["Item"])]["Name"]
			var quantity=UserInventory.inventory_data[i]["Quantity"]
			var frame_texture=load("res://Resources/HUD/"+str(rarity)+".png")
			var icon_texture=load("res://Resources/HUD/icon/"+weapon_name+".png")
			var stars_texture=load("res://Resources/HUD/"+str(rarity)+"stars.png")
			slot_new.get_node("border/frame").set_texture(frame_texture)
			slot_new.get_node("border/icon").set_texture(icon_texture)
			slot_new.get_node("border/stars").set_texture(stars_texture)
			slot_new.get_node("border/TextureRect/quantity_name").set_text(str(quantity))
			maingridcontainer.add_child(slot_new, true)
func _on_close_pressed():
	get_tree().change_scene("res://Scenes/Wish.tscn")

func _on_close_mouse_entered():
	Hover.play()
