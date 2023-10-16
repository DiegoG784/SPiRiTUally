extends Spatial
class_name GameScene

export(String) var scene_name
export(AudioStreamSample) var music
export(bool) var mute_music_when_entering = false
export(NodePath) var initial_camera

func _ready():
	Game.set_current_scene(self)

func search_camera(camera_name):
	pass
