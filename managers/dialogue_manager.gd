extends Node

var current_dialogue
var dialogue_directory = "res://entities/dialogues/"

#func _ready():
#	var test = get_dialogue_branch("test").result
#	print(test)

func start_dialogue(dialogue_filepath):
	Game.scene_manager.gui.lock_menu()
	var file = File.new()
	file.open(dialogue_filepath, File.READ)
	
	var dialogue_branch = JSON.parse(file.get_as_text()).result
	
	var dialogue_window = preload("res://gui/dialogue/base/base_dialogue_branch.tscn").instance()
	dialogue_window.setup(dialogue_branch)
	Game.scene_manager.gui.add_child(dialogue_window)
	return dialogue_window

func finish_dialogue():
	pass

func get_dialogue_branch(dialogue_name): #Função interna caso seja necessário.
	var dir = Directory.new()
	if dir.open(dialogue_directory) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
#			print(file_name)
			if !dir.current_is_dir() and file_name.get_basename() == dialogue_name:
#				print("Arquivo encontrado: " + file_name)
				var file = File.new()
				file.open(dialogue_directory + file_name, file.READ)
				var parsed_json = JSON.parse(file.get_as_text())
				return parsed_json
			file_name = dir.get_next()
#	else:
#		print("An error occurred when trying to access the path.")
