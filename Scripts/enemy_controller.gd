extends Area2D

const ENEMY_SPEED = 200

var instance_start_y
var direction = Vector2(rand_range(-0.25,0.25),rand_range(0.35,1))

onready var mainScene = get_node("..")

func set_start_position(start_y):
	self.instance_start_y = start_y

func _ready():
	
	connect("body_entered", self, "self_destroy")
	
	var _viewport_width = mainScene.get_viewport().get_visible_rect().size.x
	
	transform.origin = Vector2(rand_range(Global.left_playground_wall_pos, Global.right_playground_wall_pos), instance_start_y) 

func self_destroy(_body) :
	queue_free()

func _physics_process(delta):
	var final_vector = direction.normalized() * ENEMY_SPEED * delta
	translate(final_vector)
