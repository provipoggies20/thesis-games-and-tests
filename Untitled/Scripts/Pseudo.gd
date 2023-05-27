extends Node
var dice=1
var dice2=1
var overall=0
var odd=""

func _process(delta: float):
	$Output/Epoch.set_text(str(OS.get_unix_time()))
	
func _ready():
	MusicController.play_music_stop()
	var test=load("res://pseudo.gdns").new()
	$Buttons/Reveal.disabled=true
	dice=test.getoutput()
	$Dices/Dice.frame=dice
	dice2=test.getoutput()
	$Dices/Dice2.frame=dice2
	
func _on_Roll_pressed():
	$AnimationPlayer.play("rolls")
	$Output/Odd.visible=true
	$Output/Overall.visible=true
	$Buttons/Roll.disabled=true
	$Output/Overall.visible=false
	
func Odd():
	if overall%2==0:
		odd="Even"
	else:
		odd="Odd"
	$Output/Odd.text=str(odd)
	
func _on_Reveal_pressed():
	$Dices/Dice.visible=true
	$Dices/Dice2.visible=true
	$Output/Odd.visible=false
	$Output/Overall.visible=false
	$Buttons/Roll.disabled=true

func _on_Back_mouse_entered():
	Hover.play()

func _on_Back_pressed():
	FadeScene.change_scene("res://Scenes/StartScreen.tscn", "shortfade")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	var test=load("res://pseudo.gdns").new()
	dice=test.getoutput()
	$Dices/Dice.frame=dice-1
	dice2=test.getoutput()
	$Dices/Dice2.frame=dice2-1
	overall=dice+dice2
	$Output/Overall.text=str(overall)
	$Buttons/Roll.disabled=false
	Odd()
	$Output/Overall.visible=true
