extends KinematicBody2D

const ACCELERATION = 50 #was 35
const MAX_SPEED = 300
const PLAYER_FRICTION = 50 #was 25
const PLAYER_AIR_FRICTION = 10
const GRAVITY = 1000
const JUMP_SPEED = -300
const AIR_CONTROL_MULTI = 0.2


var velocity = Vector2.ZERO
var gravity_Vector = Vector2(0,GRAVITY)
var horizontal_input
var is_jumping = false
var jump_input

onready var GC_area = get_node("Ground_check_area")
onready var player_sprite = get_node("Sprite")

func _physics_process(delta):
	
	#GET INPUTS
	jump_input = Input.is_action_just_pressed("ui_accept")
	horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	#UPDATE GROUNDCHECK
	var is_on_ground = im_on_ground()
	
	#JUMPING
	if jump_input and is_on_ground :
		is_jumping = true
		velocity.y = JUMP_SPEED
	elif is_jumping and is_on_ground :
		is_jumping = false
	#AIR CONTROL
	if is_jumping :
		horizontal_input *= AIR_CONTROL_MULTI
	
	#MOVEMENT
	if horizontal_input != 0 :
		velocity.x += horizontal_input * ACCELERATION
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)

	#APPLY FRICTION
	elif !is_jumping :
		velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_FRICTION)
	else :
		if horizontal_input != 0 :
			velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_AIR_FRICTION / 2)
		else : velocity = velocity.move_toward(Vector2(0, velocity.y), PLAYER_AIR_FRICTION)
	
	#MOVEMENT RESULT
	if !is_on_ground :
		velocity.y += GRAVITY * delta
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
func _process(_delta):
	
	#FLIP SPRITE
	if horizontal_input>0 :
		player_sprite.flip_h = false
	elif horizontal_input<0 :
		player_sprite.flip_h = true
	
	#LOCK X IN VIEWPORT
	transform.origin.x = clamp(transform.origin.x, Global.left_playground_wall_pos + 8, Global.right_playground_wall_pos - 8)

#Get GROUNDCHECK
func im_on_ground() -> bool :
	var on_ground = GC_area.player_on_ground
	return on_ground
	
#func coyoteTime():
#	yield(get_tree().create_timer(COYOTE_TIME), "timeout")
#	can_coyote_jump = false
#	print (can_coyote_jump)
#	pass
