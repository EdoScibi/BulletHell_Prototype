extends Label

var isJumping

func _ready():
	
	align = 1

func _process(_delta):
	
	isJumping = str(get_node("../Player").is_jumping)

	text = "Jumping" + "\n" + isJumping
