extends KinematicBody2D

const ACCELERATION = 35
const MAX_SPEED = 300
const PLAYER_FRICTION = 25
const GRAVITY = 1000
const JUMP_SPEED = -300
const AIR_CONTROL_MULTI = 0.5

var velocity = Vector2.ZERO
var gravity_Vector = Vector2(0,GRAVITY)
var horizontal_input
var is_jumping = false
var jump_input
var im_on_ground = false
onready var GC_area = get_node("Ground_check_area")

#Get GROUNDCHECK
func im_on_ground() -> bool :
	var on_ground = GC_area.player_on_ground
#	print(on_ground)
	return on_ground

func _physics_process(delta):
	
	#GET INPUTS
	jump_input = Input.is_action_just_pressed("ui_accept")
	horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	#UPDATE GROUNDCHECK
	im_on_ground()
	
	#JUMPING
	if jump_input and im_on_ground() :
		is_jumping = true
		velocity.y = JUMP_SPEED
	elif is_jumping and im_on_ground() :
		is_jumping = false
	#AIR CONTROL
	if is_jumping :
		horizontal_input *= AIR_CONTROL_MULTI
	
	#MOVEMENT
	if horizontal_input != 0 :
		velocity.x += horizontal_input * ACCELERATION
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	#APPLY FRICTION IF NOT JUMPING
	elif !is_jumping :
		velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_FRICTION)

	#MOVEMENT RESULT
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
