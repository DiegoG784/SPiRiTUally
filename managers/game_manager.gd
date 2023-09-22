extends Node

var current_player #Atalho fácil para pegar o nó do jogador
var current_scene #O mesmo para a cena atual do jogo

#Aqui é o controlador do jogo, onde vai gerenciar algumas coisas importantes do jogo como gerenciar cenas, atalho fácil para pegar o nó do jogador e entre outros.

func _ready():
	pass

func set_current_player(player):
	current_player = player

func set_current_scene(scene):
	current_scene = scene

func remap_player_moviment(direction):
	pass
