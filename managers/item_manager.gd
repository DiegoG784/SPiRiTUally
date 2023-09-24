extends Node

var inventory = [
#	ItemUnico,
#	[ItemStackavel, 4],
]

var current_item

func _ready():
	var item = Item.new()
	item.name = "Teste"
	var item2 = Item.new()
	item2.name = "Teste2"
	add_item(item)
	add_item(item2, 20)

func add_item(item_file, quantity = 0):
#	print(inventory)
	
	var item_position = search_item(item_file.name, true)
	
	if quantity > 0:
		
		if item_position != null:
#			Se o item for stackável, adicionar quantidade no inventário
			inventory[item_position][1] += quantity
		else:
			inventory.append([item_file, quantity])
		
	else:
		
		if item_position == null:
			inventory.append(item_file)
		else:
			printerr("O item é único já possui no inventário!")
	
#	print(inventory)

func remove_item(item_name, quantity = 0):
	var item_position = search_item(item_name, true)
	
	if quantity > 0:
		inventory[item_position][1] -= quantity
		inventory[item_position][1] -= max(0, inventory[item_position][1])
		
		if quantity == 0:
			inventory.remove(item_position)
		
	else:
		inventory.remove(item_position)


func use_item(item_name): #Somente para consumíveis como poções ou algo parecido
	var item_usage = [search_item(item_name), search_item(item_name, true)]
	
	if item_usage[1] != null:
		item_usage[0].item_scene.logic()
		inventory[item_usage[1][1]] -= 1
#		Atualizar HUD do inventário
	else:
		printerr("Item com o nome " + item_name + " não encontrado!")

func search_item(item_name, return_array_position = false):
	for item in inventory:
		
		if item is Array:
			
			if item[0].name == item_name:
				if return_array_position:
					return inventory.find(item)
				else:
					return item
			
		elif item.name == item_name:
			
			if return_array_position:
				return inventory.find(item)
			else:
				return item
		
	
	return null
