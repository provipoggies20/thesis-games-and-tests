extends Control

onready var wish=load("res://Scenes/StartScreen.tscn")

func _ready() -> void:
	grab_focus()
	
func _on_inputarea_text_entered(text) -> void:
	if text == "primogems":
		$VBoxContainer/info/Label.set_text("Added 1600 Primogems")
		$VBoxContainer/input/inputarea.clear()
		UserData.user_data.temp_primogems+=1600
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "whale":
		$VBoxContainer/info/Label.set_text("Added 32000 Primogems")
		$VBoxContainer/input/inputarea.clear()
		UserData.user_data.temp_primogems+=32000
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "intertwined":
		$VBoxContainer/info/Label.set_text("Added 1 Intertwined Fate")
		$VBoxContainer/input/inputarea.clear()
		UserData.user_data.temp_intertwined+=1
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "acquaint":
		$VBoxContainer/info/Label.set_text("Added 1 Acquaint Fate")
		$VBoxContainer/input/inputarea.clear()
		UserData.user_data.temp_acquaint+=1
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "unhide wish":
		$VBoxContainer/info/Label.set_text("Wish Button Added")
		UserData.user_data.hide_wish=false
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "hide wish":
		$VBoxContainer/info/Label.set_text("Wish Button Hidden")
		UserData.user_data.hide_wish=true
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "unhide test":
		$VBoxContainer/info/Label.set_text("Test Button Added")
		UserData.user_data.hide_wish=false
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
	elif text == "hide test":
		$VBoxContainer/info/Label.set_text("Test Button Hidden")
		UserData.user_data.hide_wish=true
		UserData.save_data()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
		
	else:
		$VBoxContainer/info/Label.set_text("No command exist")
		$VBoxContainer/input/inputarea.clear()
		yield(get_tree().create_timer(1),"timeout")
		self.visible=false
