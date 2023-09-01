extends Node

#É como o nome diz, ele vai gerenciar o áudio do jogo


onready var music = get_node("music_player")
onready var sfx = get_node("sfx")

func play_music(music_name):
	pass

func play_audio(audio_name):
	pass
#	Como será que vai ser feito o sistema de efeitos sonoros? Criar um nó auto delatável?
