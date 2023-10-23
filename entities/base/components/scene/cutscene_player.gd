extends AnimationPlayer
class_name CutsScenePlayer

export(String, MULTILINE) var dialogue_sections

var parsed_dialogue

#func _process(delta):
#	print(current_animation)

func _ready():
#	print(print(typeof(dialogue_sections)))

#	print(parse_json(dialogue_sections))

	parsed_dialogue = parse_json(dialogue_sections)
	print(parsed_dialogue)


func start_dialogue():
	Dialogue.start_dialogue(parsed_dialogue[current_animation], true)
