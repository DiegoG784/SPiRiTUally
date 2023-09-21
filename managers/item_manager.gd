extends Node

var inventory = [
#	Item.new().name("Item único"),
#	[Item.new().name("item stackável"), 4],
]#Ver como vai ser guardado os itens do jogo (através de recursos ou algo mais complexo envolvendo arrays?)

func _ready():
	var item = Item.new()
	item.name = "Teste"
	var item2 = Item.new()
	item2.name = "Teste2"
	add_item(item)
	add_item(item2, 20)

func add_item(item_file, quantity = 0):
	print(inventory)
	
	var item_position = search_item(item_file.name, true)
	
	if quantity > 0:
		
		if item_position != null:
			inventory[item_position][1] += quantity
		else:
			inventory.append([item_file, quantity])
		
	else:
		
		if item_position == null:
			inventory.append(item_file)
		else:
			printerr("O item é único já possui no inventário!")
	
	print(inventory)

func remove_item(item_name):
	pass

func use_item(item_name, quantity):
	pass

func search_item(item_name, return_array_position = false):
	pass
	for item in inventory:
		if item is Array:
			
			if item[0].name == item_name:
				if return_array_position:
					return item
				else:
					return item_name
			
		elif item.name == item_name:
			if return_array_position:
				return item
			else:
				return item_name
	return null
