extends InteracteableArea
class_name SceneSwitcher

export(PackedScene) var scene_file
export(String) var scene_file_positioner

func interact_action():
	if scene_file:
		Game.lock_player_input()
		Game.scene_manager.change_scene(scene_file)