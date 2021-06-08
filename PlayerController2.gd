extends KinematicBody2D

var linear_velocity = Vector2.ZERO
var speed = 500

func _process(delta):
	
	var inputRun = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputRun > 0 :
		linear_velocity.x += speed * delta
		move_and_slide(linear_velocity, Vector2(0,-1))
	
	elif inputRun < 0 :
		linear_velocity.x -= speed * delta
		move_and_slide(linear_velocity, Vector2(0,-1))
	
	else :
		linear_velocity = Vector2.ZERO
	
	print(inputRun)

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
