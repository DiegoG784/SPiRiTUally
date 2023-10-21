extends Node

var current_player:Player #Atalho fácil para pegar o nó do jogador
var current_scene #O mesmo para a cena atual do jogo
var scene_manager #Atalho fácil para pegar o SceneManager

enum states {
	IDLE,
	IN_CUTSCENE,
	PAUSED
}

#Aqui é o controlador do jogo, onde vai gerenciar algumas coisas importantes do jogo como gerenciar cenas, atalho fácil para pegar o nó do jogador e entre outros.

func _ready():
	pass

func set_current_player(player):
	current_player = player

func set_current_scene(scene):
	current_scene = scene

func set_scene_manager(target):
	scene_manager = target

func lock_player_input():
	current_player.can_move = false

func unlock_player_input():
	current_player.can_move = true

