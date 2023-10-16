extends Spatial

onready var gui = get_node("gui")
onready var current_scene_node = get_node("current_scene")

var current_camera

func _ready():
	Game.set_scene_manager(self)
	set_current_camera(get_viewport().get_camera())

func change_scene(scene_file):
	current_camera = null
	var next_scene = scene_file.instance()
	var transition = preload("res://gui/scene/scene_transition_black.tscn").instance()

	gui.add_child(transition)
	transition.fade_in()

	yield(transition.animation, "animation_finished")
	
	Game.current_scene.queue_free()
	print("oidoasidoasidoasido")
	current_scene_node.add_child(next_scene)

	yield(get_tree(), "idle_frame")
	yield(get_tree().create_timer(0.3), "timeout")
	transition.fade_out()
	current_camera = get_node(next_scene.initial_camera)
	print(current_camera)
	yield(transition.animation, "animation_finished")

func set_current_camera(camera):
	current_camera = camera

func get_current_camera():
	return current_camera
