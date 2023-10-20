extends InteracteableArea
class_name SceneSwitcher

export(PackedScene) var scene_file

func interact_action():
	if scene_file:
		Game.lock_player_input()
		Game.scene_manager.change_scene(scene_file)
