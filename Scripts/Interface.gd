extends Control

onready var viewport_position = get_viewport().get_visible_rect().position

func _process(delta):
	rect_position = viewport_position
