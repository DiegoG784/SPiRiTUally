extends CanvasLayer

onready var dialogue_window = get_node("base_dialogue_branch")

func setup_signals(target):
	dialogue_window.connect("dialogue_finished", target, "dialogue_finished")
