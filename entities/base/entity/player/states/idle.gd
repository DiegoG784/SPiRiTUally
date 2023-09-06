extends State

func logic():
	.logic()
	
	if entity.motion != Vector3.ZERO:
		next_state = states["walk"]
