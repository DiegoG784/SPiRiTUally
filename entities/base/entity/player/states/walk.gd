extends State


func logic():
	.logic()
#	print(entity_angle_motion)
	if entity.motion == Vector3.ZERO:
		next_state = states["idle"]
