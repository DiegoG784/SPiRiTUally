extends Area
class_name InteracteableArea

export(bool) var automatic_execution = false #A interação é executada automaticamente quando o player entra na área
export(bool) var one_time_execution = false #A interação será executada somente uma vez se esse parâmetro for ativado
var can_interact = false
var in_execution = false
var already_executed = false

func _process(delta):
	if can_interact and Input.is_action_just_pressed("interact") and !in_execution and !already_executed:
		
		in_execution = true
		
		interact_action()

func interact_action(): #Aqui é onde vai executar a interação entre o player e alguma coisa
	pass

	if one_time_execution:
		already_executed = true
	
	in_execution = false

func player_entered(body):
	if body is Player:
		can_interact = true
#		Aparecer um ícone ou algo na HUD para interagir
