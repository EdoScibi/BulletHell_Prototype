extends Label

onready var player_node = Global.Player_node

func _process(delta):
	text = str(player_node.max_speed)
