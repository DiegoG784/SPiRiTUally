extends InteracteableArea

onready var parent = get_parent()

func _ready():
	print(parent.name)

func interact_action():
	Inventory.add_item(parent.item_file)
	
#	chamar método que vai mostrar que ganhou o item
	
	parent.queue_free()
