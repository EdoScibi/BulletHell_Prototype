extends Node

var Player_node: KinematicBody2D
var Camera_Node: Camera2D

func _ready():
	Player_node = get_node("/root/MainScene/Player")
	Camera_Node= Player_node.get_node("Camera2D")
