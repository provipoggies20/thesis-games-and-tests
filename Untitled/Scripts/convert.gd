extends Popup

func _process(delta):
	if UserData.user_data.temp_primogems>=1600:
		$confirm.visible=true
		$cancel/Label2.visible=false
	else:
		$confirm.visible=false
		$cancel/Label2.visible=true
		
