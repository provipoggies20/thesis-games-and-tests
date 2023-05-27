extends KinematicBody2D

const GRAVITY=20
const JUMP=-750
const DASH_COUNTER=2
var speed=180
var dashCounter=0
var dashReady=false
var velocity=Vector2(0,0)

func _ready():
	if SaveFile.game_data.display_fps==true:
		$Camera2D/fps.visible=true
		
func _physics_process(delta:float):
	actionInput()
	showPauseMenu()
	
func actionInput():
	velocity.y+=GRAVITY
	dash()
	if Input.is_action_pressed("ui_right"):
		velocity.x=speed
		$Sprite.flip_h=false	
	elif Input.is_action_pressed("ui_left"):
		velocity.x=-speed
		$Sprite.flip_h=true
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y=JUMP
	if is_on_floor():
		if velocity.x<-1:
			$Sprite.play("walk")
		elif velocity.x>1:
			$Sprite.play("walk")
		else: 
			$Sprite.play("idle")
	else:
		if velocity.y>=0:
			$Sprite.play("fall")
		else:
			$Sprite.play("jump")
	velocity=move_and_slide(velocity,Vector2.UP)
	velocity.x=lerp(velocity.x, 0, 0.2)
	
func dash():
	if Input.is_action_just_pressed("ui_right") and dashReady==false:
		dashCounter+=1
		yield(get_tree().create_timer(.2),"timeout")
		dashCounter=0
	if Input.is_action_pressed("ui_right") and dashReady==false and dashCounter==DASH_COUNTER:
		dashReady=true
		speed=542
		$DashParticles.emitting=true
		MusicController.dash()
		yield(get_tree().create_timer(.5),"timeout")
		speed=180
		$DashParticles.emitting=false
		dashReady=false
	if Input.is_action_just_pressed("ui_left") and dashReady==false:
		dashCounter+=1
		yield(get_tree().create_timer(.2),"timeout")
		dashCounter=0
	if Input.is_action_pressed("ui_left") and dashReady==false and dashCounter==DASH_COUNTER:
		dashReady=true
		speed=542
		$DashParticles.emitting=true
		MusicController.dash()
		yield(get_tree().create_timer(.5),"timeout")
		speed=180
		$DashParticles.emitting=false
		dashReady=false
		
func showPauseMenu():
	if Input.is_action_pressed("ui_end"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$PauseMenu.visible=true
