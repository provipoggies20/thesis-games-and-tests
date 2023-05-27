extends Node

const USERFILE="res://User Data/UserData.json"
var user_data={}
func _ready():
	load_data()
	
func load_data():
	var file=File.new()
	if not file.file_exists(USERFILE):
		user_data={
		"temp_pity": 0, 
		"temp_primogems": 0, 
		"temp_intertwined": 0,
		"temp_acquaint": 0,
		"temp_stardust": 0,
		"temp_starglitter": 0,
		"hide_wish": true,
		"hide_test": true,
		}
		save_data()
	file.open(USERFILE, File.READ)
	var text=file.get_as_text()
	user_data=parse_json(text)
	file.close()
	
func save_data():
	var file=File.new()
	file.open(USERFILE, File.WRITE)
	file.store_line(to_json(user_data))
	file.close()
	
	
