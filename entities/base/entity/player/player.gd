extends Entity
class_name Player

onready var animation_states = get_node("animation_tree")

func _ready():
	Game.set_current_player(self)
#	print("floor: " + str(is_on_floor()))

func move():
	if can_move:
		motion = move_and_slide(motion, JUMP)

func fall():
	motion.y += gravity

#func jump():
#	if is_on_floor():
#		motion.y = jump_force
#
#func cut_jump():
#	if motion.y < -100:
#		motion.y = -100
#		print(motion.y)

func calc_physics(entity_motion, delta):
#			print(name + ": " + str(camera_node.transform.basis.z.normalized().abs().max_axis()))
#			print(forward)
		

	motion = entity_motion * walking_speed * delta
#		print(motion)

	if entity_motion != Vector3.ZERO:
		look_at(translation + entity_motion, Vector3.UP)
		
#		var target_position = translation + entity_motion
#		var new_transform = transform.looking_at(target_position, Vector3.UP)
#		rotation = transform.interpolate_with(new_transform, walking_speed * delta)


func animation(_animation_name):
	var animation_tree = animation_states.get("parameters/playback")
	animation_tree.travel(_animation_name)

#	if input_vector != Vector3.ZERO:
#		# Smooth Rotation
#		#Pivot.look_at(translation + input_vector, Vector3.UP)
#		var target_position = translation + input_vector
#		var new_transform = transform.looking_at(target_position, Vector3.UP)
#		Pivot.transform  = Pivot.transform.interpolate_with(new_transform, max_speed * delta)
