extends Node

var weapon_data={}

func _ready():
	var user_data_folder=File.new()
	var weapon_data_file=File.new()
	weapon_data_file.open("res://User Data/WeaponData.json", File.READ)
	var weapon_data_json=JSON.parse(weapon_data_file.get_as_text())
	weapon_data_file.close()
	weapon_data=weapon_data_json.result
