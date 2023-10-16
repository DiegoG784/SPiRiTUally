extends Node
class_name HealthComponent

export(NodePath) var parent #variável que vai referenciar o nó pai da entidade

export(int) var health = 0
export(int) var defense = 1

var max_health #A vida máxima da entidade é definido pela variável health

signal health_depleted #Este sinal é emitido quando a vida da entidade acaba
signal health_updated(damage_taken) #emite um argumento que mostra se a entidade levou dano ou tomou cura 


func _ready():
	max_health = health
	yield(get_tree(),"idle_frame")
	if Game.scene_manager:
		self.connect("health_updated", Game.scene_manager.gui.health_bar, "update_health_bar")
#	print(is_connected("health_updated", Game.scene_manager.gui.health_bar, "update_health_bar"))
#	Conectar os sinais nas barras de vida

func heal(value):
	health += value
	health = clamp(health, 0, max_health)
	emit_signal("health_updated")

func damage(value):
#	print('antes do dano:' + str(health))
	health -= value / defense
	health = clamp(health, 0, max_health)
#	print('depois do dano:' + str(health))
	if health == 0:
		emit_signal("health_depleted")
	emit_signal("health_updated", true)

