extends Control

onready var item_list = get_node("item_list")

var selected_item

func _ready():
	for item in Inventory.inventory:
		
		if item is Array:
			item_list.add_item("%sx %s" % [item[1], item[0].name])
		else:
			item_list.add_item(item.name)



func item_selected(index):
	selected_item = index
	print(selected_item)


func _on_Button_pressed():
	pass # Replace with function body.
#	Inventory.use_item(Inventory.inventory[selected_item][0].name)
	queue_free()
