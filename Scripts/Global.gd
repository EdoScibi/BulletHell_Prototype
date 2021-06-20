extends Node

onready var mainScene = get_node("/root")
onready var viewport_size = mainScene.get_viewport().get_visible_rect().size

var Player_node: KinematicBody2D
var Camera_Node: Camera2D
var playground_size = Vector2(160, 180)

#################IL SINGLETON NON RIESCE AD ACCEDERE AL VIEWPORT##############################
#################SAREBBE UTILE STORARE QUI LE INFO SULLA GRANDEZZA DEL "PLAYGROUND" PER POTERVI ACCEDERE DA ALTRI SCRIPT#######################
var left_playground_wall_pos = (viewport_size.x - playground_size.x)/2
var right_playground_wall_pos = (viewport_size.x - playground_size.x)/2 + playground_size.x

func _ready():
	Player_node = get_node("/root/MainScene/Player")
	Camera_Node= Player_node.get_node("Camera2D")
