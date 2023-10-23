extends InteracteableArea
class_name CutsceneTrigger

export(NodePath) var cutscene_player

func interact_action():
	Cutscene.start_cutscene(get_node(cutscene_player))