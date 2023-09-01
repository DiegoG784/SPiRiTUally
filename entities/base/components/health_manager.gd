extends Node

export(NodePath) var parent #variável que vai referenciar o nó pai da entidade

export(int) var health = 0
export(int) var defense = 1

var max_health #O limite de vida é definido pela variável health

signal health_depleted #Este sinal é emitido quando a vida da entidade acaba

func _ready():
	max_health = health

func heal(value):
	pass

func damage(value):
	pass
