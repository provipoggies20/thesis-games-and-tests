extends Node

onready var maingridcontainer=get_node("HBoxContainer/VBoxContainer/GridContainer")
onready var fivestarone=load("res://Resources/HUD/5 star, 1 pull.ogv")
onready var fivestarten=load("res://Resources/HUD/5 star, 10 pull.ogv")
onready var fourstarten=load("res://Resources/HUD/4 star, 10 pull.ogv")
onready var fourstarone=load("res://Resources/HUD/4 star, 1 pull.ogv")
onready var threestar=load("res://Resources/HUD/3 star pull.ogv")
var slot_template=preload("res://Resources/UI/LootSlots.tscn")
var wish=load("res://wishFinal.gdns").new()
var temp_loot={}

func _ready():
	if GlobalSettings.signal_pull==1:
		SinglePull()
	elif GlobalSettings.signal_pull==10:
		TenPull()
	else:
		pass

func SinglePull():
	for i in 1:
		i+=1
		if UserData.user_data.temp_pity<75:
			temp_loot[i]=wish.belowsoftpity()
			UserData.user_data.temp_pity+=1
			UserData.save_data()
			if str(GameData.weapon_data[str(temp_loot[i])]["Rarity"])==str("5"):
				UserData.user_data.temp_pity=0
		if UserData.user_data.temp_pity>=75:
			temp_loot[i]=wish.atsoftpity()
			UserData.user_data.temp_pity+=1
			UserData.save_data()
			if str(GameData.weapon_data[str(temp_loot[i])]["Rarity"])==str("5"):
				UserData.user_data.temp_pity=0
		if UserData.user_data.temp_pity==90:
			temp_loot[i]=wish.atpity()
			UserData.user_data.temp_pity=0
			UserData.save_data()
		var slot_new=slot_template.instance()
		var rarity=GameData.weapon_data[str(temp_loot[i])]["Rarity"]
		var weapon_name=GameData.weapon_data[str(temp_loot[i])]["Name"]
		var weapon_type=GameData.weapon_data[str(temp_loot[i])]["WeaponType"]
		var icon_texture=load("res://Resources/HUD/wish/"+str(weapon_name)+".png")
		var type_texture=load("res://Resources/HUD/bg-"+str(weapon_type)+".png")
		var stars_texture=load("res://Resources/HUD/"+str(rarity)+"stars.png")
		slot_new.get_node("border/icon").set_texture(icon_texture)
		slot_new.get_node("border/type").set_texture(type_texture)
		slot_new.get_node("border/stars").set_texture(stars_texture)
		var lot=GlobalSettings.loot_history.size()
		GlobalSettings.loot_history[lot]=temp_loot[i]
		lot+=1
		maingridcontainer.add_child(slot_new, true)
		if str(rarity)=="5":
			$VideoPlayer.stream=fivestarone
			break
		elif str(rarity)=="4":
			$VideoPlayer.stream=fourstarone
		else:
			$VideoPlayer.stream=threestar
	$VideoPlayer.visible=true
	$VideoPlayer.play()
func TenPull():
	for i in 10:
		i+=1
		if UserData.user_data.temp_pity<75:
			temp_loot[i]=wish.belowsoftpity()
			UserData.user_data.temp_pity+=1
			UserData.save_data()
			if str(GameData.weapon_data[str(temp_loot[i])]["Rarity"])==str("5"):
				UserData.user_data.temp_pity=0
			if i==10:
				temp_loot[i]=wish.guaranteed4star()
		if UserData.user_data.temp_pity>=75:
			temp_loot[i]=wish.atsoftpity()
			UserData.user_data.temp_pity+=1
			UserData.save_data()
			if str(GameData.weapon_data[str(temp_loot[i])]["Rarity"])==str("5"):
				UserData.user_data.temp_pity=0
			if i==10:
				temp_loot[i]=wish.guaranteed4star()
		if UserData.user_data.temp_pity==90:
			temp_loot[i]=wish.atpity()
			UserData.user_data.temp_pity=0
			UserData.save_data()
		var slot_new=slot_template.instance()
		var rarity=GameData.weapon_data[str(temp_loot[i])]["Rarity"]
		var weapon_name=GameData.weapon_data[str(temp_loot[i])]["Name"]
		var weapon_type=GameData.weapon_data[str(temp_loot[i])]["WeaponType"]
		var icon_texture=load("res://Resources/HUD/wish/"+str(weapon_name)+".png")
		var type_texture=load("res://Resources/HUD/bg-"+str(weapon_type)+".png")
		var stars_texture=load("res://Resources/HUD/"+str(rarity)+"stars.png")
		slot_new.get_node("border/icon").set_texture(icon_texture)
		slot_new.get_node("border/type").set_texture(type_texture)
		slot_new.get_node("border/stars").set_texture(stars_texture)
		var lot=GlobalSettings.loot_history.size()
		GlobalSettings.loot_history[lot]=temp_loot[i]
		lot+=1
		maingridcontainer.add_child(slot_new, true)
	for i in temp_loot.keys():
		if GameData.weapon_data[str(temp_loot[i])]["Rarity"]==int("5"):
			$VideoPlayer.stream=fivestarten
			break
		else:
			$VideoPlayer.stream=fourstarten
	$VideoPlayer.visible=true
	$VideoPlayer.play()
func _on_VideoPlayer_finished():
	$VideoPlayer.visible=false
	MusicController.playwish()
	for i in temp_loot.keys():
		UserInventory.inventory_data[UserInventory.inventory_data.size()+1]={"Item":temp_loot[i],"Quantity":1}
		UserInventory.save_data()
			
func _on_close_pressed():
	get_tree().change_scene("res://Scenes/Wish.tscn")

func _on_close_mouse_entered():
	Hover.play()
