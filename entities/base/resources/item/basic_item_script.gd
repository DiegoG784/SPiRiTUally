
#var item_file
var cure_type
var base_value = 1
var regen_delay = 1 # Para base: somente funciona quando a opção "Regeneration" está selecionada no type

func _init(item_file):
	cure_type = item_file.cure_type
	base_value = item_file.base_value
	regen_delay = item_file.regen_delay


func logic():
	match cure_type:
		0: #Cure
			Game.current_player.health.heal(base_value)
		1: #Regeneration
			pass
#		Atualizar a hud do inventário ou do jogo
