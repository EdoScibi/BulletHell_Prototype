extends Label

var playerSpeed

func _ready():
	
	align = 1

func _process(_delta):
	
	playerSpeed = str(get_node("../Player").velocity.x)

	text = "Speed" + "\n" + playerSpeed
