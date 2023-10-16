extends State

func logic(delta):
	.logic(delta)
	
	if entity.motion != Vector3.ZERO and entity.can_move:
		next_state = states["walk"]
