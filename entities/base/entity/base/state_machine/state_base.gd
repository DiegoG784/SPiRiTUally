extends Node
class_name State

onready var entity
onready var states = {}

export(String) var animation_state_name
var jump
var entity_side_motion
var entity_angle_motion
var climbing_motion
var next_state
var previous_state
var shoot_animation_delay:float
var has_shoot
var previous_camera_node
var current_action_button
#var movement_mapping = {
#	"W":"walk_forward",
#	"A":"walk_left",
#	"S":"walk_backward",
#	"D":"walk_right"
#}
var movement_mapping = [
	"walk_forward",
	"walk_left",
	"walk_backward",
	"walk_right"
]

var forward = Vector3.FORWARD
var holding_movement = false
var another_movement_key_pressed = false
var old_movement_key

func _process(delta):
	current_action_button = null
	
#	holding_movement = false
#	another_movement_key_pressed = false

#func _unhandled_input(event):
#	current_action_button = event.as_text()
#	# print(event.as_text())
#
#	if !holding_movement:
#		old_movement_key = current_action_button
#
#	if current_action_button in movement_mapping.keys():
#		holding_movement = true
#
#		if holding_movement and current_action_button != old_movement_key:
#			another_movement_key_pressed = true
#			holding_movement = false
#		else:
#			another_movement_key_pressed = false
#	else:
#		holding_movement = false
	
#	if holding_movement:
#		if current_action_button in movement_mapping.keys():
#			another_movement_key_pressed = true
#		else:
#			another_movement_key_pressed = false

func enter():
	next_state = null
	entity.animation(name)
#	print(name)

func logic(delta):
	get_input(delta)
	entity.move()


func get_input(delta):
#	print("holding_movement: ", holding_movement)
#	print("another_movement_key_pressed: ", another_movement_key_pressed)
	for i in movement_mapping:
		if Input.is_action_pressed(i):
			holding_movement = true
			break
		else:
			holding_movement = false
	#print(holding_movement)
	if entity.can_move and Game.scene_manager:
		var camera_node = Game.scene_manager.get_current_camera()
		var entity_motion = Vector3.ZERO
#		print(camera_node)
#		print(Game.scene_manager.current_camera)

		if !holding_movement:
			if camera_node:
				previous_camera_node = camera_node
#				print("oi!")
				forward = Vector3.ZERO
				var cam_forward = -camera_node.transform.basis.z.normalized()
				var cam_axis = cam_forward.abs().max_axis()
				forward[cam_axis] = sign(cam_forward[cam_axis])
				
	
	
#			print(forward)
		if forward == Vector3(1, 0, 0) or forward == Vector3(-1, 0, 0):
			entity_motion.z = (Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")) * forward.cross(Vector3.UP).z
			entity_motion.x = (Input.get_action_strength("walk_backward") - Input.get_action_strength("walk_forward")) * -forward.x
		else:
#				print("movendo em relação a posição X")
			entity_motion.x = (Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")) * forward.cross(Vector3.UP).x
			entity_motion.z = (Input.get_action_strength("walk_backward") - Input.get_action_strength("walk_forward")) * -forward.z
			
		
		entity.calc_physics(entity_motion, delta)
		
		
#		if entity_motion != Vector3.ZERO:
#			holding_movement = true
#		else:
#			holding_movement = false
		
#		print(entity_motion)
#		print(holding_movement)


func get_transition():
	return next_state

func on_entity_damaged():
	next_state = states["hit"]
