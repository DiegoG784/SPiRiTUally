extends Entity
class_name Player

func _ready():
	pass # Replace with function body.

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

func calc_physics(dir, dir2):
#	print(motion)
	motion.x = dir
	motion.z = dir2

	if motion.x < 0:
		motion.x -= walking_speed
#		flip('left')
	elif motion.x > 0:
		motion.x += walking_speed
#		flip('right')
	
	if motion.z < 0:
		motion.z -= walking_speed
#		flip('left')
	elif motion.z > 0:
		motion.z += walking_speed
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
