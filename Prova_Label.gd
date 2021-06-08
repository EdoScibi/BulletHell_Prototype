extends Label

var playerInput

func _ready():
	
	align = 1

func _process(delta):
	
	playerInput = str(get_node("../Player").inputRun)

	text = "R/L Input" + "\n" + playerInput
