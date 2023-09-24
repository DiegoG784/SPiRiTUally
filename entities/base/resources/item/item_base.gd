extends Resource
class_name Item

#export(StreamTexture) var icon
export(String) var name
export(String, MULTILINE) var description
export(bool) var is_consumable
export(bool) var is_stackable
export(int) var max_stack
export(int) var value
export(PackedScene) var item_scene #Para utilitários e consumíveis?
