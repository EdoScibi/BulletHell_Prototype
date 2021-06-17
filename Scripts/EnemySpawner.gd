extends Node

export(PackedScene) var enemy_prefab = null

export var timeToNextSpawn = 2

onready var timer = get_node("SpawnerTimer")

func _ready():
	timer.start(timeToNextSpawn)

func _process(delta):
	if timer.time_left == 0 :
		var enemy = enemy_prefab.instance()
		add_child(enemy)
