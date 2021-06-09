extends KinematicBody2D

const ROTATION = 0
const ACCELERATION = 25
const MAX_SPEED = 300
const PLAYER_FRICTION = 20
const GRAVITY = 10
const JUMP_SPEED = -1000

var velocity = Vector2.ZERO
var gravity_Vector = Vector2(velocity.x,GRAVITY)
var inputRun
var jumping = false

func _physics_process(delta):
	
	#FREEZE ROTATION
	rotation = ROTATION
	
	#APPLY GRAVITY
	move_and_collide(gravity_Vector)
	
	#GET INPUTS
	inputRun = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var jump = Input.is_action_just_pressed("ui_accept")
	
	#MOVEMENT
	if inputRun != 0 :
		velocity.x += inputRun * ACCELERATION
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
		
		#IL SEGUENTE METODO AGGIORNA IL VETTORE DEL MOVIMENTO OGNI FRAME DI INPUT, QUINDI LA VELOCITA' SULL'ASSE Y
		#NON CAMBIA PIU' (e.g. caduta o fase di ascesa del salto)
		#velocity = velocity.move_toward(Vector2(inputRun * MAX_SPEED, velocity.y), ACCELERATION)
		
		#IL SEGUENTE METODO ALTERNATIVO HA IL PROBLEMA CHE VECTOR2D.CLAMPED METTE UN CAP ALLA LUNGHEZZA FINALE DEL VETTORE
		#PER CUI ALLA SOMMA VETTORIALE AGGIUNGE ANCHE IL FATTORE Y, E IL RISULTATO CREA STRANI COMPORTAMENTI (e.g. in caduta)
		#velocity.x += inputRun * ACCELERATION
		#velocity = velocity.clamped(MAX_SPEED)
	
	else :
		velocity = velocity.move_toward(Vector2.ZERO, PLAYER_FRICTION)
		
	#JUMPING
	if jump and is_on_floor() :
		jumping = true
		velocity.y = JUMP_SPEED
	if jumping and is_on_floor() :
		jumping = false
	
	#AIR CONTROL
	if jumping:
		inputRun = inputRun.clamp(inputRun, -0.5, 0.5)
	
	#MOVEMENT RESULT
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	
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
