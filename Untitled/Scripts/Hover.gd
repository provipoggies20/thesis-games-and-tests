extends Node

func play():
	$sound.volume_db=SaveFile.game_data.sfx_vol
	$sound.play()
