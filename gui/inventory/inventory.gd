extends Control

onready var item_lister = get_node("background/middle_separator/item_lister_frame/item_lister")
onready var inventory_tabs = get_node("background/upper_separator")
onready var item_display_node = get_node("background/middle_separator/item_display_node")
onready var item_description_node = get_node("background/middle_separator/details/description")

var selected_item
var current_menu_list
var can_exit = false
var clicked_exit = false

signal about_to_exit(menu_node)

func _ready():
	# Inventory.give_item(load("res://database/items/weapons/axe.tres"))
	# Inventory.give_item(load("res://database/items/consumables/health_kit.tres"))
	# Inventory.give_item(load("res://database/items/evidences/samuel_report.tres"))
	for node in inventory_tabs.get_children():
		node.inventory_menu = self
	
	refresh_inventory("equipment")
	yield(get_tree().create_timer(0.3),"timeout")
	can_exit = true


func _process(delta):
	if Input.is_action_just_pressed("inventory") and can_exit:
		emit_signal("about_to_exit", self)

func refresh_inventory(type):
	for node in item_lister.get_children():
		print(node)
		node.queue_free()

	for item in Inventory.inventory:
		var item_list = preload("res://gui/inventory/list_item/list_item.tscn").instance()
		match type:
			"equipment":
				if !item is Array:
#					print("oioi")
					if item.get_class() == "WeaponItem":
						item_lister.add_child(item_list)
						item_list.setup(item.icon, item.name, item, self)
			"item":
				if item is Array:
#					print("oioi")
					if item[0].get_class() == "Item" or item[0].get_class() == "ConsumableItem":
						item_lister.add_child(item_list)
						item_list.setup(item[0].icon, item[0].name, item, self)
						
			"evidence":
				if !item is Array:
#					print("oioi")
					if item.get_class() == "ItemEvidence":
						item_lister.add_child(item_list)
						item_list.setup(item.icon, item.name, item, self)


func update_item_status(item_file):
	var item_to_display = item_file
	if item_to_display is Array:
		item_display_node.texture = item_to_display[0].item_display
		item_description_node.text = item_to_display[0].description
	else:
		item_display_node.texture = item_to_display.item_display
		item_description_node.text = item_to_display.description


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



#for item in Inventory.inventory:
#
#	if item is Array:
#		item_list.add_item("%sx %s" % [item[1], item[0].name])
#	else:
#		item_list.add_item(item.name)