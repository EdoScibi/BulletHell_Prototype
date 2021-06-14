extends Area2D

const speed = 100
var direction = Vector2(rand_range(-0.25,0.25),rand_range(0.35,1))
onready var mainScene = get_node("..")


func _ready():
	self.connect("body_entered", self, "self_destroy")
	var viewportX = mainScene.get_viewport().get_visible_rect().size.x
	
	transform.origin = Vector2(rand_range(0, viewportX), 0)
	print("spawning at " , transform.origin.round())


func self_destroy(body) :
	self.queue_free()
	#print("bye")


func _process(delta):
	var final_vector = direction * speed * delta
	translate(final_vector.normalized())
