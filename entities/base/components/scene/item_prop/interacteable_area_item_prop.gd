extends InteracteableArea

onready var parent = get_parent()

#func _ready():
#	print(parent.name)

func interact_action():
	Inventory.give_item(parent.item_file)
	
#	mostrar uma janela que mostre o item que você pegou/ganhou
	
	parent.queue_free()
