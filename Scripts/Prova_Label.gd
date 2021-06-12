extends Label

var playerInput

func _ready():
	
	align = 1

func _process(_delta):
	
	playerInput = str(get_node("../Player").horizontal_input)

	text = "R/L Input" + "\n" + playerInput
