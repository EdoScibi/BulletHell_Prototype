extends Node

var Player_node: KinematicBody2D
var Camera_Node: Camera2D
var playground_size = Vector2(160, 180)

onready var viewport_size = get_viewport().get_visible_rect().size
onready var left_playground_wall_pos = (viewport_size.x - playground_size.x)/2
onready var right_playground_wall_pos = (viewport_size.x - playground_size.x)/2 + playground_size.x

func _ready():
	Player_node = get_node("/root/MainScene/Player")
	Camera_Node = Player_node.get_node("Camera2D")
