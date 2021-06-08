extends KinematicBody2D

var velocity = Vector2.ZERO
var inputRun

const ACCELERATION = 2000
const MAX_SPEED = 30000
const PLAYER_FRICTION = 1000

func _physics_process(delta):
	
	inputRun = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputRun != 0 :
		velocity.x += inputRun * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
		move_and_slide(velocity, Vector2(0,-1))
		
	else :
		velocity = velocity.move_toward(Vector2.ZERO, PLAYER_FRICTION * delta)
	
	## DEBUGGING FUNCS
	
	if velocity.x != 0:
		print(velocity.x)

# func _ready():

#	platformRef = get_node("../Platforms")
	
#	$GroundCheck.connect("body_entered", self, "_on_GroundCheck_body_entered")
#	$GroundCheck.connect("body_exited", self, "_on_GroundCheck_body_exited")

#func _physics_process(delta):

#Ground Check
#func _on_GroundCheck_body_entered(body):
#	if body.get_parent() == platformRef:
#		isGrounded = true
#		print(isGrounded)
#
#func _on_GroundCheck_body_exited(body):
#	if body.get_parent() == platformRef:
#		isGrounded = false
#		print(isGrounded)
