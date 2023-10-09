extends ItemScript
class_name ConsumableItemScript

#Este script possui métodos pré-definidos para pronto uso como itens de cura e efeitos, mas também pode ser reescrito com novas funções

export(int, "Cure", "Regeneration") var type
export(int) var base_value = 1
export(int) var regen_timer = 1

signal item_logic_terminated


func logic():
	match type:
		0: #Cure
			Game.current_player.health.heal(base_value)
			emit_signal("item_logic_terminated")
		1: #Regeneration
			pass

func in_scene_logic(): #Não deletar. Isso talvez será usado quando o player usar o item sem usar o inventário
	pass
