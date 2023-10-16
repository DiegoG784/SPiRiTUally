extends Area
class_name InteracteableArea

export(bool) var automatic_execution = false #A interação é executada automaticamente quando o player entra na área
export(bool) var one_time_execution = false #A interação será executada somente uma vez se esse parâmetro for ativado
export(float) var interaction_cooldown = 0.3
var can_interact = false
var in_execution = false
var already_executed = false
var player_in_area = false
#enum states {IDLE, RUNNING}
#var current_state = states.IDLE


func _ready():
	if !is_connected("body_entered", self, "player_entered"):
		self.connect("body_entered", self, "player_entered")

	if !is_connected("body_exited", self, "player_exited"):
		self.connect("body_exited", self, "player_exited")

#	print(name + ": " + str(is_connected("body_entered", self, "player_entered")))
#	print(name + ": " + str(is_connected("body_exited", self, "player_exited")))

func _process(delta):
	if can_interact and Input.is_action_just_pressed("interact") and !in_execution and !already_executed and player_in_area:
#		print("OI")
#		current_state = states.RUNNING
		in_execution = true
		can_interact = false
		interact_action()

func interact_action(): #Aqui é onde vai executar a interação entre o player e alguma coisa
#	print("A interação está sendo executada no momento")
#	print('oi')
	pass
#	print("Interação terminada")

func terminate_interaction(): #Vou deixar esse método com o código de cima caso fique somente ele.
	yield(get_tree().create_timer(interaction_cooldown), "timeout")
	if one_time_execution:
		already_executed = true
	
	in_execution = false
	can_interact = true

func player_entered(body):
	if body is Player:
#		print("o player pode interagir com este objeto.")
		can_interact = true
		player_in_area = true
#		Aparecer um ícone ou algo na HUD para interagir


func player_exited(body):
	if body is Player:
#		print("o player saiu da área de interação.")
		can_interact = false
		player_in_area = false
#		Mostar que o player nn consegue interagir mais
