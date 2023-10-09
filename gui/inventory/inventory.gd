extends Control

onready var item_list = get_node("item_list")

var selected_item

func _ready():
	for item in Inventory.inventory:
		
		if item is Array:
			item_list.add_item("%sx %s" % [item[1], item[0].name])
		else:
			item_list.add_item(item.name)



func item_selected(index): #Usado quando o item é clicado na lista
	selected_item = Inventory.inventory[index]
	
	if selected_item is Array:
		selected_item = Inventory.inventory[index][0]
		print(selected_item.name)
	else:
		selected_item = Inventory.inventory[index]
		print(selected_item.name)
#		alterar texto do botão para "equipar"
#	print(selected_item)


func _on_Button_pressed(): #usado quando o item é clicado no botão de usar/equipar
	if selected_item:
		if selected_item.is_consumable == true:
			Inventory.use_item(selected_item.name)
		else:
			Inventory.equip_item(selected_item.name)
#	Inventory.use_item(Inventory.inventory[selected_item][0].name)
	queue_free()
