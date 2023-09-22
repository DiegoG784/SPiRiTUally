extends Entity
class_name Player

func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	pass

func move():
	motion = move_and_slide(motion, JUMP)

func fall():
	motion.y += gravity

func jump():
	if is_on_floor():
		motion.y = jump_force

func cut_jump():
	if motion.y < -100:
		motion.y = -100
#		print(motion.y)

func calc_physics(entity_motion, delta):
	motion = entity_motion * walking_speed * delta


	if entity_motion != Vector3.ZERO:
		look_at(translation + entity_motion, Vector3.UP)
		
#		var target_position = translation + entity_motion
#		var new_transform = transform.looking_at(target_position, Vector3.UP)
#		rotation = transform.interpolate_with(new_transform, walking_speed * delta)

#	if motion.x < 0:
#		motion.x -= walking_speed
##		flip('left')
#	elif motion.x > 0:
#		motion.x += walking_speed
##		flip('right')
#
#	if motion.z < 0:
#		motion.z -= walking_speed
#		flip('left')
#	elif motion.z > 0:
#		motion.z += walking_speed
#		flip('right')



func animation(animation_name):
	pass

#func knockback():
#	if direction == "left":
#		motion.x = min(KNOCKBACK_SPEED, MAX_KNOCKBACK_SPEED)
#		flip('left')
#	else:
#		motion.x = max(-KNOCKBACK_SPEED, -MAX_KNOCKBACK_SPEED)
#		flip('right')

#	if input_vector != Vector3.ZERO:
#		# Smooth Rotation
#		#Pivot.look_at(translation + input_vector, Vector3.UP)
#		var target_position = translation + input_vector
#		var new_transform = transform.looking_at(target_position, Vector3.UP)
#		Pivot.transform  = Pivot.transform.interpolate_with(new_transform, max_speed * delta)
