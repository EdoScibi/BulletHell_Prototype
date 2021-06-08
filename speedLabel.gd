extends Label

var playerSpeed

func _ready():
	
	align = 1

func _process(delta):
	
	playerSpeed = str(get_node("../Player").velocity.x)

	text = "Speed" + "\n" + playerSpeed
