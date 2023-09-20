extends Node
class_name State

onready var entity
onready var states = {}

var jump
var entity_side_motion
var entity_angle_motion
var climbing_motion
var is_shooting
var next_state
var previous_state
var shoot_animation_delay:float
var has_shoot
var is_sliding
var on_stairs

func enter():
	next_state = null
	entity.animation(name)
	print(name)

func logic(delta):
	get_input(delta)
	entity.move()

func get_input(delta):
	#jump = Input.is_action_just_pressed("jump")
	var entity_motion = Vector3()
	
	entity_motion.x = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	entity_motion.z = Input.get_action_strength("walk_backward") - Input.get_action_strength("walk_forward")

	entity.calc_physics(entity_motion, delta)
	
func get_transition():
	return next_state

func on_entity_damaged():
	next_state = states["hit"]
