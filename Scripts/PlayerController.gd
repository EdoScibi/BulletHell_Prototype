extends RigidBody2D

var speed = Vector2(100,0)
var horizontalSpeed: float
var jumpForce = Vector2(0,-150)
var isGrounded = false
var platformRef: Node2D


func _ready():

	platformRef = get_node("../Platforms")
	$GroundCheck.connect("body_entered", self, "_on_GroundCheck_body_entered")
	$GroundCheck.connect("body_exited", self, "_on_GroundCheck_body_exited")


func _process(delta):

	if Input.is_action_pressed("ui_right") and isGrounded == true:
		set_axis_velocity(speed)
	
	if Input.is_action_pressed("ui_left") and isGrounded == true:
		set_axis_velocity(-speed)
	
	if Input.is_action_just_pressed("ui_accept") and isGrounded == true:
		apply_impulse(Vector2(0,0), jumpForce)
	
	if linear_velocity.x < 0 and Input.is_action_pressed("ui_right") and isGrounded == false:
		set_axis_velocity(Vector2(linear_velocity.x/2, 0))
	
	if linear_velocity.x > 0 and Input.is_action_pressed("ui_left") and isGrounded == false:
		set_axis_velocity(Vector2(linear_velocity.x/2, 0))
		
	print(linear_velocity.x)


#Ground Check
func _on_GroundCheck_body_entered(body):
	if body.get_parent() == platformRef:
		isGrounded = true
		print(isGrounded)
	
func _on_GroundCheck_body_exited(body):
	if body.get_parent() == platformRef:
		isGrounded = false
		print(isGrounded)
