extends KinematicBody2D

const ACCELERATION = 50 #was 35
const DEFAULT_MAX_SPEED = 280
const PLAYER_FRICTION = 50 #was 25
const PLAYER_AIR_FRICTION = 10
const FRICTION_FOR_MAX_SPEED = .5
const GRAVITY = 1000
const JUMP_SPEED = -280
const AIR_CONTROL_MULTI = 0.3
const COYOTE_TIME = 0.1

var max_speed = 280
var can_coyote_jump = true
var velocity = Vector2.ZERO
var gravity_Vector = Vector2(0,GRAVITY)
var horizontal_input
var is_jumping = false
var jump_input

onready var GroundCheck_area = get_node("Ground_check_area")
onready var player_sprite = get_node("Sprite")

func _physics_process(delta):
	
	#GET INPUTS
	jump_input = Input.is_action_just_pressed("ui_accept")
	horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	#UPDATE GROUNDCHECK
	var is_on_ground = im_on_ground()
	
	#JUMPING
	if jump_input :
		if can_coyote_jump or is_on_ground:
			is_jumping = true
			velocity.y = JUMP_SPEED
			max_speed = update_jumping_max_speed()
			can_coyote_jump = false
	elif is_jumping and is_on_ground :
		is_jumping = false

#AIR CONTROL
	if is_jumping :
		horizontal_input *= AIR_CONTROL_MULTI
		max_speed -= FRICTION_FOR_MAX_SPEED
	
	#MOVEMENT
	if horizontal_input != 0 :
		velocity.x += horizontal_input * ACCELERATION
		velocity.x = clamp(velocity.x, -abs(max_speed), max_speed)
	#APPLY FRICTION
	elif !is_jumping :
		velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_FRICTION)
	else :
		velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_AIR_FRICTION)

	#MOVEMENT RESULT
	if !is_on_ground :
		velocity.y += GRAVITY * delta
		if can_coyote_jump == true :
			stopcoyoteTime()

	if is_on_ground :
		can_coyote_jump = true
		max_speed = DEFAULT_MAX_SPEED
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _process(_delta):
	
	#FLIP SPRITE
	if horizontal_input>0 :
		player_sprite.flip_h = false
	elif horizontal_input<0 :
		player_sprite.flip_h = true
	
	#LOCK X IN VIEWPORT
	transform.origin.x = clamp(transform.origin.x, Global.left_playground_wall_pos + 8, Global.right_playground_wall_pos - 8)

func update_jumping_max_speed() -> float :
	return velocity.x

#Get GROUNDCHECK
func im_on_ground() -> bool :
	var on_ground = GroundCheck_area.player_on_ground
	return on_ground
	
func stopcoyoteTime():
	yield(get_tree().create_timer(COYOTE_TIME), "timeout")
	can_coyote_jump = false
	pass

#func calcAirFriction():
#	if horizontal_input == 0 :
#		return PLAYER_AIR_FRICTION
#	elif horizontal_input * velocity.x <= 0 :
#		return PLAYER_AIR_FRICTION
#	else :
#		return PLAYER_AIR_FRICTION * 0.5
