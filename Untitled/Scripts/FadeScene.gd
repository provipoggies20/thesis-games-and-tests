extends CanvasLayer

onready var Animate=$Control/AnimationPlayer
var scene:String

func change_scene(new_scene, anim):
	scene=new_scene
	Animate.play(anim)
	
func _new_scene():
	get_tree().change_scene(scene)
