extends Spatial
class_name GameScene

export(String) var scene_name
export(AudioStreamSample) var music
export(bool) var mute_music_when_entering = false

func _ready():
	Game.set_current_scene(self)

func search_camera(camera_name):
	pass
