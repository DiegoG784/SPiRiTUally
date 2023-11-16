extends AnimationPlayer
class_name CutsScenePlayer

export(String, MULTILINE) var dialogue_sections
export(bool) var unlock_player_input_afer_cutscene
export(bool) var unlock_menu_afer_cutscene

var parsed_dialogue

signal dialogue_called
signal cutscene_node_ended

#func _process(delta):
#	print(current_animation)

func _ready():
#	print(print(typeof(dialogue_sections)))

#	print(parse_json(dialogue_sections))

	parsed_dialogue = parse_json(dialogue_sections)
	print(parsed_dialogue)


func start_dialogue():
	Dialogue.start_dialogue(parsed_dialogue[current_animation], true)
	emit_signal("dialogue_called")

func change_camera(camera_name:String):
	Game.scene_manager.change_camera_view(camera_name)
