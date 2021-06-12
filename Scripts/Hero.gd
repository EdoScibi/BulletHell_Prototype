extends KinematicBody2D;

export var GRAVITY: float = 100
export var horizontal_speed: float = 100
export var jump_speed: float = 100
export var motion: Vector2 = Vector2.ZERO;
var isJumping: bool = false

func _ready():
	pass


func _physics_process(delta):
	var x_movement = motion.x
	if isJumping:
		if Input.is_action_pressed("ui_right"):
			x_movement += max(0,  horizontal_speed * delta)
		if Input.is_action_pressed("ui_left"):
			x_movement -= max(0,  horizontal_speed * delta)
		x_movement = min(x_movement, horizontal_speed)
	else:
		if Input.is_action_pressed("ui_right"):
			x_movement  = horizontal_speed
		elif Input.is_action_pressed("ui_left"):
			x_movement  = -horizontal_speed
		else:
			x_movement  = 0
		if Input.is_action_just_pressed("ui_accept"):
			motion.y -= jump_speed
		
	motion.y += GRAVITY * delta;
	motion.x = x_movement
	motion = move_and_slide(motion, Vector2.UP)
	isJumping = !is_on_floor()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
