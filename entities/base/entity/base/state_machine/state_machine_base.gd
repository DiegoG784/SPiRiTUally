extends Node
class_name StateMachine

var states = {}
var current_state

#A State Machine é uma forma de controlar as ações de maneira prática e otimizada, evitando 50 mil ifs pra cada coisa.

# === Como ela funciona? ===
#As ações (ou estados como prefiro chamar) serão guardadas dentro da máquina e ela irá pegar todos e colocar dentro de uma array e irá executar o código do primeiro estado que foi colocado na função _ready()
#A máquina só vai mudar de estado quando o a variável current_states for alterada para outro estado
#Apesar de ser um pouco trabalhoso ou difícil de entender no início, a máquina de estados vai ajudar muito na hora de programar pois vai evitar bugs e ineficiência no código, além de perder tempo de colocar a mesma coisa pra verificar várias vezes em cada bloco de código. :skull:

func _ready():
	yield(get_parent(), "ready") #Vai segurar a execução quando o nó pai estiver pronto

	for state in get_children():
		states[state.name] = state #Cada estado dentro da máquina será guardado na variável com o seu nome como chave
		#Health.connect("player_damaged", states[state.name], "on_player_damaged")

	for state in get_children():
		state.states = self.states
		state.entity = self.get_parent()

	current_state = states["idle"] #Aqui é onde o primeiro estado será selecionado para ser executado primeiro
	enter_state()
#	print(current_state.name)

func enter_state():
	current_state.enter() #antes de executar o código principal, alguns parâmetros podem ser inseridos nesse método caso necessário

func _physics_process(delta):
	current_state.logic(delta) #Sua função principal do estado será executado em loop
	if current_state.get_transition() != null:
		change_state(current_state.get_transition())
	#print(current_state.name)

func change_state(next_state): #quando chamado, o estado anterior será guardado em uma variável e trocado para nova logo seguida
	next_state.previous_state = current_state
	current_state = next_state
	enter_state()
