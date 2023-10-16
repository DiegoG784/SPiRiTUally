extends Item
class_name WeaponItem

export(bool) var can_be_sold = false
export(int) var value = 0
export(PackedScene) var weapon_scene

func get_class(): return "WeaponItem"
