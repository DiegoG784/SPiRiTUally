extends Spatial

onready var gui = get_node("gui")

func _ready():
	Game.set_scene_manager(self)

func change_scene(scene_file):
	pass
