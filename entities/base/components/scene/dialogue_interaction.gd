extends InteracteableArea
class_name DialogueInteraction


export(String, FILE) var dialogue_file

#func _process(delta):
#	print("can_interact: ", can_interact)
#	print("in_execution: ", in_execution)
#	._process(delta)

func interact_action():
	Game.lock_player_input()
	var window = Dialogue.start_dialogue(dialogue_file)
	window.connect("dialogue_finished", self, "terminate_interaction")

func terminate_interaction():
	.terminate_interaction()
	Game.unlock_player_input()
	Game.scene_manager.gui.unlock_menu()
