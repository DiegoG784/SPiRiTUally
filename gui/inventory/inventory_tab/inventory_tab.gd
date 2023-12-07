extends Control

export(String) var tab_name

var clicked = false
var inventory_menu

func _on_inventory_tab_focus_entered():
	print("oi")

func _on_inventory_tab_gui_input(event:InputEvent):
#	print("oi")
#	print(event)
	if event is InputEventMouseButton and !clicked:
		print("clicou!")
		clicked = true
		get_tree().call_group("inventory_tab", "refresh_click", self)
		if inventory_menu:
			inventory_menu.refresh_inventory(tab_name)

func refresh_click(caller):
	if caller != self:
		clicked = false