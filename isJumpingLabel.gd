extends Label

var isJumping

func _ready():
	
	align = 1

func _process(delta):
	
	isJumping = str(get_node("../Player").jumping)

	text = "Jumping" + "\n" + isJumping
