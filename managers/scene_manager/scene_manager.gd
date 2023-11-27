extends Spatial

onready var gui = get_node("gui")
onready var current_scene_node = get_node("current_scene")

var current_camera
var transition_overlay_node = preload("res://gui/scene/scene_transition_black.tscn")
var current_game_scene

func _ready():
	Game.set_scene_manager(self)
	set_current_camera(get_viewport().get_camera())

func add_scene_to_main(scene_file):
	current_scene_node.add_child(scene_file)

func change_scene(scene_file, without_transition = false):
	current_camera = null
	var next_scene = scene_file.instance()
	var transition_overlay = transition_overlay_node.instance()

	if !without_transition:
		gui.add_child(transition_overlay)
		transition_overlay.fade_in()

		yield(transition_overlay.animation, "animation_finished")
	
	Game.current_scene.queue_free()
	current_scene_node.add_child(next_scene)

	yield(get_tree(), "idle_frame")
	yield(get_tree().create_timer(0.3), "timeout")
	set_current_camera(get_viewport().get_camera())
	#	print(current_camera)
	
	if !without_transition:
		transition_overlay.fade_out()
		yield(transition_overlay.animation, "animation_finished")
		transition_overlay.queue_free()

func set_current_camera(camera:Camera):
	print(camera)
	current_camera = camera
	camera.current = true

func get_current_camera():
	return current_camera

func fade_in_screen():
	var transition = transition_overlay_node.instance()
	

func fade_out_screen():
	pass

func change_camera_view(camera_name_or_path):
	if current_game_scene:
		var camera_to_change: Camera = current_game_scene.search_camera(camera_name_or_path)
		if camera_to_change == null:
			return printerr("Método retornou null. Verificar se o nome inserido no parâmetro") 
		
		set_current_camera(camera_to_change)
