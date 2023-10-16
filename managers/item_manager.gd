extends Node

var inventory = [
#	ItemUnico,
#	[ItemStackavel, 4],
]

var current_hotbar = [ #Somente os nomes dos itens estarão aqui como referência
#	"NomeItemReferencia"
]

var current_item

signal item_logic_terminated
signal used_item(item_name)

func _ready():
	print(find_item_in_directory("health_kit.tres"))
#	var item = Item.new()
#	item.name = "Teste"
#	var item2 = Item.new()
#	item2.name = "Teste2"
#	var item3 = load("res://database/items/consumables/health_kit.tres")
#	add_item(item)
#	add_item(item2, 20)
#	add_item(item3, 3)

func give_item(item_file, quantity = 1):
#	print(inventory)
	var item_resource
	
	item_resource = find_item_in_directory(item_file) if item_file is String else item_file
	
	if item_resource == null:
		printerr("Recurso não encontrado! Verifique se o seguinte nome consta dentro do banco de itens: ", item_file)
		return ERR_CANT_ACQUIRE_RESOURCE
	
	var item_position = search_item(item_resource.name, true)
	
	if item_resource is ConsumableItem or quantity > 1:
		
		if item_position != null:
#			Se o item for stackável, adicionar quantidade no inventário
			inventory[item_position][1] += quantity
		else:
			inventory.append([item_resource, quantity])
		
	else:
		
		if item_position == null:
			inventory.append(item_resource)
		else:
			printerr("O item é único já possui no inventário!")
	
	print()
	print("Item adicionado: " + item_resource.name)
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
	
#	print(inventory)


func use_item(item_name): #Para consumíveis e itens que serão usados no jogo como chaves ou algo do tipo
	var item_usage = [search_item(item_name)[0], search_item(item_name, true)]
#	print(item_usage)
	if item_usage[1] != null:
		var current_item = item_usage[0]
		var item_script
		print(item_usage[0])
		
		match current_item.get_class():
			"ConsumableItem":
				if current_item.custom_item_script:
					item_script = current_item.custom_item_script.new(current_item)
				else:
					item_script = current_item.basic_item_script.new(current_item)
				
				print(item_script)
#				print('iniciando execução da lógica do item')
				item_script.logic()
		#		print('execução terminada')
				
				remove_item(item_usage[0].name, 1)
		#		Travar input do usuário e esperar a função de lógica do item terminar
		#		Atualizar HUD do inventário
				pass
			"Item":
				pass
#				fazer um match de ID entre o item e o local de interação em alguns itens?
			
		
	else:
		printerr("Item com o nome " + item_name + " não encontrado!")
	
	print(inventory)

func equip_item(item_name): #Somente para itens equipáveis
	pass

func put_item_in_hotbar(item_name):
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

func find_item_in_directory(item_file_name):
	var item_directory = "res://database/items/"
	var directories = ["consumables", "key_items", "weapons"]
	var dir = Directory.new()
	
	for folder in directories:
		var current_folder = item_directory + folder + "/"
		if dir.open(current_folder) == OK:
			
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while file_name != "":
				if !dir.current_is_dir():
					if file_name == item_file_name:
#						print("oi!")
						return load(current_folder + file_name)
					print(file_name.get_basename())
					
				file_name = dir.get_next()
			

