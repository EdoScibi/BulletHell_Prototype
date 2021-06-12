extends KinematicBody2D

const ACCELERATION = 25
const MAX_SPEED = 300
const PLAYER_FRICTION = 20
const GRAVITY = 1000
const JUMP_SPEED = -300

var velocity = Vector2.ZERO
var gravity_Vector = Vector2(0,GRAVITY)
var horizontal_input
var is_jumping = false
var jump_input

func _physics_process(delta):
	
	#GET INPUTS
	jump_input = Input.is_action_just_pressed("ui_accept")
	horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	#JUMPING
	if jump_input and is_on_floor() :
		is_jumping = true
		velocity.y = JUMP_SPEED
	elif is_jumping and is_on_floor() :
		is_jumping = false
	#AIR CONTROL
	if is_jumping :
		horizontal_input /= 2
	
	#MOVEMENT
	if horizontal_input != 0 :
		velocity.x += horizontal_input * ACCELERATION
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	
	elif !is_jumping :
		velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_FRICTION)

	#MOVEMENT RESULT
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
