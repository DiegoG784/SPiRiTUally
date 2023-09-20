extends Node

var inventory = [
	Item.new().name("Item único"),
	[Item.new().name("item stackável"), 4],
]#Ver como vai ser guardado os itens do jogo (através de recursos ou algo mais complexo envolvendo arrays?)


func add_item(item_name):
	pass

func remove_item(item_name):
	pass

func use_item(item_name, quantity):
	pass
