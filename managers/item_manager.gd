extends Node

var inventory = [
#	ItemUnico,
#	[ItemStackavel, 4],
]

var current_item

func _ready():
	pass
#	var item = Item.new()
#	item.name = "Teste"
#	var item2 = Item.new()
#	item2.name = "Teste2"
#	var item3 = load("res://database/items/consumables/health_kit.tres")
#	add_item(item)
#	add_item(item2, 20)
#	add_item(item3, 3)

func add_item(item_file, quantity = 1):
#	print(inventory)
	
	var item_position = search_item(item_file.name, true)
	
	if item_file.is_consumable or quantity > 1:
		
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
	
	print()
	print("Item adicionado: " + item_file.name)
	print("Quantidade do item: " + str(quantity))
	print()
	print("Inventário atual: " + str(inventory))
	print()

func remove_item(item_name, quantity = 0):
	var item_position = search_item(item_name, true)
	
	if quantity > 0:
		inventory[item_position][1] -= quantity
		inventory[item_position][1] = max(0, inventory[item_position][1])
		
		if inventory[item_position][1] == 0:
			inventory.remove(item_position)
		
	else:
		inventory.remove(item_position)
	
	print(inventory)


func use_item(item_name): #Somente para consumíveis como poções ou algo parecido
	var item_usage = [search_item(item_name)[0], search_item(item_name, true)]
	print(item_usage)
	if item_usage[1] != null:
		
		print('iniciando execução da lógica do item')
		var item_script = item_usage[0].item_script.new()
#		item_usage[0].item_script.logic()
		item_script.logic()
#		yield(item_script, "item_logic_terminated")
		print('execução terminada')
		
		remove_item(item_usage[0].name, 1)
#		Travar input do usuário e esperar a função de lógica do item terminar
#		Atualizar HUD do inventário
	else:
		printerr("Item com o nome " + item_name + " não encontrado!")
	
	print(inventory)

func equip_item(item_name): #Somente para itens equipáveis
	pass

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
