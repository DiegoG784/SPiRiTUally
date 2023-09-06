extends Node

export(NodePath) var parent #variável que vai referenciar o nó pai da entidade

export(int) var health = 0
export(int) var defense = 1

var max_health #A vida máxima da entidade é definido pela variável health

signal health_depleted #Este sinal é emitido quando a vida da entidade acaba

func _ready():
	max_health = health

func heal(value):
	health += value
	health = clamp(health, 0, max_health)

func damage(value):
	health -= value / defense
	health = clamp(health, 0, max_health)
	if health == 0:
		emit_signal("health_depleted")

