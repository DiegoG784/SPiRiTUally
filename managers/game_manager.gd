extends Node

var current_player:Player #Atalho fácil para pegar o nó do jogador
var current_scene #O mesmo para a cena atual do jogo
var scene_manager #Atalho fácil para pegar o SceneManager
var events = {
#	event_name: event_value,
}


enum states {
	IDLE,
	IN_CUTSCENE,
	PAUSED
}

#Aqui é o controlador do jogo, onde vai gerenciar algumas coisas importantes do jogo como gerenciar cenas, atalho fácil para pegar o nó do jogador e entre outros.

func _process(delta):
	if !scene_manager and !current_scene:
		var manager = preload("res://managers/scene_manager/scene_manager.tscn").instance()
		

func add_game_event(event_name, event_value):
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

