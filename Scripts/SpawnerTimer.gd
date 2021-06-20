extends Timer

export(PackedScene) var enemy_prefab
onready var camera_offset = Global.Camera_Node.get_viewport().get_visible_rect().size.y

func _process(_delta):
	spawn_Enemy()

func spawn_Enemy() :
	if is_stopped() :
		var enemy = enemy_prefab.instance()
		enemy.init(get_spawn_y())
		add_child(enemy)
		start()
		
func get_spawn_y() :
	return Global.Player_node.transform.origin.y - camera_offset #TODO: verificare soluzione più precisa
