extends Control

onready var health_bar = get_node("health_bar")
onready var stamina_bar

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(),"idle_frame")
	update_health_bar()

func update_health_bar(damage_taken = false):
	if Game.current_player:
		health_bar.value = Game.current_player.health.health
		pass
#	print("oi1")
