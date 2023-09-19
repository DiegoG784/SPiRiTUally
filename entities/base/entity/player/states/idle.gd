extends State

func logic(delta):
	.logic(delta)
	
	if entity.motion != Vector3.ZERO:
		next_state = states["walk"]
