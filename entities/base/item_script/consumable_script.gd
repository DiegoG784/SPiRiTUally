extends ItemScript


export(int, "Cure", "Regeneration") var type
export(int) var base_value = 1

func inventory_logic():
	match type:
		0: #Cure
			pass
		1: #Regeneration
			pass

func in_scene_logic():
	pass
