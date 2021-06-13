extends Area2D

var speed = 50
var direction = Vector2(1,1)
#var collider

func _ready():
	self.connect("body_entered", self, "self_destroy")


func self_destroy(body) :
	print("bye")
	self.queue_free()


func _process(delta):
	var final_vector = direction * speed * delta
	translate(final_vector)
	
	
#	collider = move_and_collide(final_vector * delta)
#	if collider != null :
#		self.queue_free()


#func _on_Enemy_body_entered(body):
#	print("bye")
#	self.queue_free()
