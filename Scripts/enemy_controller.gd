extends Area2D

const ENEMY_SPEED = 200

var direction = Vector2(rand_range(-0.25,0.25),rand_range(0.35,1))

onready var mainScene = get_node("..")

func _ready():
	
	self.connect("body_entered", self, "self_destroy")
	
	var viewport_width = mainScene.get_viewport().get_visible_rect().size.x
	
	transform.origin = Vector2(rand_range(0, viewport_width), 0) 

func self_destroy(body) :
	
	self.queue_free()

func _physics_process(delta):

	var final_vector = direction.normalized() * ENEMY_SPEED * delta
	translate(final_vector)
