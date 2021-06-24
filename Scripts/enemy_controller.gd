extends Area2D

const ENEMY_SPEED = 200

var start_y: float = 0
var direction = Vector2(rand_range(-0.25,0.25),rand_range(0.35,1))

onready var mainScene = get_node("..")

func set_start_position(start_y: float):
	self.start_y = start_y

func _ready():
	connect("body_entered", self, "self_destroy")
	
	var viewport_width = mainScene.get_viewport().get_visible_rect().size.x
	
	transform.origin = Vector2(rand_range(Global.left_playground_wall_pos, Global.right_playground_wall_pos), start_y) 

func self_destroy(body) :
	queue_free()

func _physics_process(delta):
	var final_vector = direction.normalized() * ENEMY_SPEED * delta
	translate(final_vector)
	
