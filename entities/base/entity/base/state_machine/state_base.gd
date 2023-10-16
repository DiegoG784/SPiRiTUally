extends Node
class_name State

onready var entity
onready var states = {}

var jump
var entity_side_motion
var entity_angle_motion
var climbing_motion
var next_state
var previous_state
var shoot_animation_delay:float
var has_shoot

func enter():
	next_state = null
	entity.animation(name)
#	print(name)

func logic(delta):
	get_input(delta)
	entity.move()

func get_input(delta):
	if entity.can_move:
		var camera_node = Game.scene_manager.get_current_camera()
#		print(camera_node)
#		print(Game.scene_manager.current_camera)
		var forward = Vector3.FORWARD
		if camera_node:
#			print("oi!")
			forward = Vector3.ZERO
			var cam_forward = -camera_node.transform.basis.z.normalized()
			var cam_axis = cam_forward.abs().max_axis()
			forward[cam_axis] = sign(cam_forward[cam_axis])

			var entity_motion = Vector3.ZERO
#			print(forward)
			if forward == Vector3(1, 0, 0) or forward == Vector3(-1, 0, 0):
				entity_motion.z = (Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")) * forward.cross(Vector3.UP).z
				entity_motion.x = (Input.get_action_strength("walk_backward") - Input.get_action_strength("walk_forward")) * -forward.x
			else:
				entity_motion.x = (Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")) * forward.cross(Vector3.UP).x
				entity_motion.z = (Input.get_action_strength("walk_backward") - Input.get_action_strength("walk_forward")) * -forward.z
			
#			print(entity_motion)

			entity.calc_physics(entity_motion, delta)


func get_transition():
	return next_state

func on_entity_damaged():
	next_state = states["hit"]
