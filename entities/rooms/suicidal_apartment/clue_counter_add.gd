extends DialogueInteraction

func terminate_interaction():
	.terminate_interaction()
	Game.current_scene.clue_counter += 1
	Game.current_scene.finish_investigation()