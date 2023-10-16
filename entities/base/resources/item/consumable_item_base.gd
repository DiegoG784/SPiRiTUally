extends Item
class_name ConsumableItem

export(bool) var can_be_sold = false
export(int) var value
export(bool) var is_stackable
export(int) var max_stack
export(int, "Cure", "Regeneration") var cure_type = 0
export(int) var base_value = 1
export(int) var regen_delay = 1 # Para base: somente funciona quando a opção "Regeneration" está selecionada no type
export(GDScript) var custom_item_script
export(PackedScene) var item_prop

var basic_item_script = load("res://entities/base/resources/item/basic_item_script.gd")

func get_class(): return "ConsumableItem"
