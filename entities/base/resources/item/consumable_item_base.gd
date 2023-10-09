extends Item
class_name ConsumableItem

export(bool) var is_stackable
export(int) var max_stack
export(int, "Cure", "Regeneration") var type
export(int) var base_value = 1
export(int) var regen_timer = 1
export(GDScript) var custom_item_logic_script

