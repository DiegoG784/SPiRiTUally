extends Spatial
class_name GameScene

export(AudioStreamSample) var music
export(bool) var mute_music_when_entering

func _ready():
	Game.set_current_scene(self)

func change_scene(scene_file):
	pass
