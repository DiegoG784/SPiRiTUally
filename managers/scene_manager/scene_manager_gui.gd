extends Control

onready var health_bar = get_node("health_bar")

var inventory_opened = false

#func _unhandled_input(event):
#	print("unhandled_input: " + event.as_text())

func _unhandled_key_input(event):
#	print("unhandled_key_input: " + str(event.as_text()))

	if InputMap.event_is_action(event, "inventory") and !inventory_opened:
		inventory_opened = true
		get_tree().paused = true
		var inventory_scene = preload("res://gui/inventory/inventory.tscn").instance()
#		print("Player pressionou o botão de inventário. Abrindo o inventário")
		inventory_scene.connect("child_exiting_tree", self, "inventory_exit")
		add_child(inventory_scene)

func inventory_exit(node):
#	print("player fechou o inventário")
	inventory_opened = false
	get_tree().paused = false
