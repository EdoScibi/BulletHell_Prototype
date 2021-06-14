extends Timer


export(PackedScene) var enemy_prefab

func _process(delta):
	spawn_Enemy()

func spawn_Enemy() :
	if is_stopped() :
		print("spawning")
		var enemy = enemy_prefab.instance()
		add_child(enemy)
		start()
