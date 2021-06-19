extends Area2D

var player_on_ground = false

func _ready():
	connect("body_entered", self, "on_touch_down")
	connect("body_exited", self, "on_lift")

func on_touch_down(ground) :
	player_on_ground = true
	print("player_on_ground=" , player_on_ground)

func on_lift(ground) :
	player_on_ground = false
	print("player_on_ground=" , player_on_ground)
