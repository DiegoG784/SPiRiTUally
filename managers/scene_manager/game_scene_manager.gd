extends Spatial
class_name GameScene

export(String) var room_name
export(AudioStream) var music
export(bool) var mute_music_when_entering = false
export(bool) var show_room_name = true


func _ready():
	Game.set_current_scene(self)
	if music and !mute_music_when_entering:
		Audio.play_music(music)


func search_camera(camera_name):
	pass
