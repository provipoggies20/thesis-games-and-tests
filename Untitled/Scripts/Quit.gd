extends Control

func _ready():
	if SaveFile.game_data.display_fps==true:
		$fps.visible=true
		
func _on_yes_pressed():
	get_tree().quit()

func _on_yes_mouse_entered():
	Hover.play()
	
func _on_no_pressed():
	self.visible=false
		
func _on_no_mouse_entered():
	Hover.play()





