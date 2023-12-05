extends Item
class_name ItemEvidence

export(StreamTexture) var item_display
export(bool) var is_interacteable
export(GDScript) var interaction_script

func get_class(): return "ItemEvidence"