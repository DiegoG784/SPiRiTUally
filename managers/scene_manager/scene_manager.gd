extends Spatial
class_name SceneManager

export(AudioStreamSample) var music
export(bool) var mute_music_when_entering

func _ready():
	Game.set_current_scene(self)

