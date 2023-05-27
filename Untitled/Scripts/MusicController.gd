extends Node

var title_menu=load("res://Resources/Sounds/bg-menu.mp3")
var level1bg=load("res://Resources/BG/1.mp3")
var level2bg=load("res://Resources/BG/2.mp3")
var level3bg=load("res://Resources/BG/3.mp3")
var level4bg=load("res://Resources/BG/4.mp3")
var level1amb=load("res://Resources/BG/amb1.wav")
var title_start=load("res://Resources/Sounds/bgnew.mp3")
var wish=load("res://Resources/HUD/wishbgmusic.wav")

func play_music():
	$TitleMenu.volume_db=SaveFile.game_data.music_vol
	$TitleMenu.stream=title_menu
	$TitleMenu.play() 
	
func play_music_stop():
	$TitleMenu.stop()
	
func playtitlestart():
	$Titlestart.volume_db=SaveFile.game_data.music_vol
	$Titlestart.stream=title_start
	$Titlestart.play()
	
func titlestop():
	$Titlestart.stop()

func play_level1():
	$level1.volume_db=SaveFile.game_data.music_vol
	$level1.stream=level1bg
	$level1.play()
	
func stop_level1():
	$level1.stop()
	
func play_level2():
	$level2.volume_db=SaveFile.game_data.music_vol
	$level2.stream=level2bg
	$level2.play()

func stop_level2():
	$level2.stop()
	
func play_level3():
	$level3.volume_db=SaveFile.game_data.music_vol
	$level3.stream=level3bg
	$level3.play()
	
func stop_level3():
	$level3.stop()
	
func play_level4():
	$level4.volume_db=SaveFile.game_data.music_vol
	$level4.stream=level4bg
	$level4.play()
	
func stop_level4():
	$level4.stop()
	
func footstep1():
	$footsteprun1.volume_db=SaveFile.game_data.sfx_vol
	$footsteprun1.play()
	
func playwish():
	$Wish.stream=wish
	$Wish.play()
	
func stopwish():
	$Wish.stop()
