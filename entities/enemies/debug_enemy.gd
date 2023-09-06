extends Enemy

onready var timer = get_node("timer")

enum states {IDLE, WALK}


func _ready():
	current_state = states.IDLE
	timer.start()

func _process(delta):
	match current_state:
		states.IDLE:
			pass
			
		states.WALK:
			pass
			


func timeout():
	current_state = states.WALK
