extends Control

onready var item_lister = get_node("background/middle_separator/item_lister_frame/item_lister")

var selected_item
var current_menu_list


func _ready():
	Inventory.give_item(load("res://database/items/weapons/axe.tres"))
	refresh_inventory("equipment")
#	for item in Inventory.inventory:
#		
#		if item is Array:
#			item_list.add_item("%sx %s" % [item[1], item[0].name])
#		else:
#			item_list.add_item(item.name)

func refresh_inventory(type):
	for item in Inventory.inventory:
		var item_list = preload("res://gui/inventory/list_item/list_item.tscn").instance()
		match type:
			"equipment":
				if !item is Array:
#					print("oioi")
					if item.get_class() == "WeaponItem":
						item_lister.add_child(item_list)
						item_list.setup(item.icon, item.name)
			"item":
				if item is Array:
#					print("oioi")
					if item.get_class() == "Item" or item.get_class() == "ConsumableItem":
						item_lister.add_child(item_list)
						item_list.setup(item.icon, item.name)
						
			"evidence":
				if !item is Array:
#					print("oioi")
					if item.get_class() == "EvidenceItem":
						item_lister.add_child(item_list)
						item_list.setup(item.icon, item.name)

func item_selected(index): #Usado quando o item é clicado na lista
	selected_item = Inventory.inventory[index]
	
	if selected_item is Array:
		selected_item = Inventory.inventory[index][0]
		print("Consumível: " + selected_item.name)
	else:
		selected_item = Inventory.inventory[index]
		print("Ferramenta/Arma: " + selected_item.name)
#		alterar texto do botão para "equipar"
#	print(selected_item)


func _on_Button_pressed(): #usado quando o item é clicado no botão de usar/equipar
	if selected_item:
		if selected_item is ConsumableItem:
			Inventory.use_item(selected_item.name)
		else:
			Inventory.equip_item(selected_item.name)
#	Inventory.use_item(Inventory.inventory[selected_item][0].name)
	queue_free()
