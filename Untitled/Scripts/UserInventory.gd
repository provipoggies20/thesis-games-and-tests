extends Node

const INVENTORYFILE="res://User Data/InventoryData.json"
var inventory_data={}

func _ready():
	var file=File.new()
	if not file.file_exists(INVENTORYFILE):
		inventory_data={
			1:{
				"Item":null,
				"Quantity":0
			},
		}
		save_data()
	file.open(INVENTORYFILE, File.READ)
	var text=file.get_as_text()
	inventory_data=parse_json(text)
	file.close()

func save_data():
	var file=File.new()
	file.open(INVENTORYFILE, File.WRITE)
	file.store_line(to_json(inventory_data))
	file.close()
	
