extends Area2D

onready var player_node = Global.Player_node

func _ready():
	connect("body_entered", self, "_on_FinishLine_body_entered")


func _on_FinishLine_body_entered(body):
	if body == player_node :
		player_node.transform.origin = player_node.STARTING_POSITION
