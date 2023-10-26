extends Node

#É como o nome diz, ele vai gerenciar o áudio do jogo


onready var music = get_node("music_player")
onready var sfx = get_node("sfx")

func _ready():
	pass
	var dir = Directory.new()
	dir.open("res://assets/audio/")
	dir.list_dir_begin(true)
	var file_name = dir.get_next()

	while file_name != "":
		
		if dir.current_is_dir():
			print(file_name)
			list_files_in_dir(file_name)
		else:
			pass
			print(file_name)
		
		file_name = dir.get_next()


func play_music(music_file):
	if music.is_playing():
		pass
	else:
		music.stream = music_file
		music.play()

func play_audio(audio_file):
	var audio = AudioStreamPlayer.new()
	audio.stream = audio_file
	audio.connect("finished", self, "audio_finished", [audio])
	audio.pause_mode = PAUSE_MODE_PROCESS
	sfx.add_child(audio)
	audio.play()

func load_file(audio_path):
	pass

func audio_finished(audio):
	audio.queue_free()

func list_files_in_dir(path):
	pass
