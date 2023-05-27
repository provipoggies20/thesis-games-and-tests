extends Node

var signal_pull=0
var loot_history={}
signal fps_displayed(value)

func toggle_fullscreen(value):
	OS.window_fullscreen=value
	SaveFile.game_data.fullscreen_on=value
	SaveFile.save_data()

func toggle_vsync(value):
	OS.vsync_enabled=value
	SaveFile.game_data.vsync_on=value
	SaveFile.save_data()
	
func toggle_fps_display(value):
	emit_signal("fps_displayed", value)
	SaveFile.game_data.display_fps=value
	SaveFile.save_data()

func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	SaveFile.game_data.master_vol=vol
	SaveFile.save_data()

func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	SaveFile.game_data.music_vol=vol
	SaveFile.save_data()

func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	SaveFile.game_data.sfx_vol=vol
	SaveFile.save_data()
	
func update_ambient_vol(vol):
	AudioServer.set_bus_volume_db(3, vol)
	SaveFile.game_data.ambient_vol=vol
	SaveFile.save_data()
