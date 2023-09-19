extends State


func logic(delta):
	.logic(delta)
#	print(entity_angle_motion)
	if entity.motion == Vector3.ZERO:
		next_state = states["idle"]
