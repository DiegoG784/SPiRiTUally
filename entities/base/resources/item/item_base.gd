extends Resource
class_name Item

export(StreamTexture) var icon
export(String) var name
export(String, MULTILINE) var description
export(StreamTexture) var item_display

#export(PackedScene) var item_scene #Para utilitários e consumíveis?
#export(GDScript) var item_script

func get_class(): return "Item"
