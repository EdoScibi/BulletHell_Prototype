extends Label

onready var player_node = Global.Player_node

func _process(_delta):
	text = str(round(player_node.velocity.x))
