extends Control

onready var animation = get_node("animations")
onready var criminal_report_node = get_node("criminal_report_file")

enum states {CLOSED, OPENED, QUIT}

var current_state = states.CLOSED
var already_opening = false

signal concluded_reading

func _process(_delta):
	match current_state:
		states.CLOSED:
			if Input.is_action_just_pressed("interact") and !already_opening:
				already_opening = true
				animation.play("opening")
				yield(animation,"animation_finished")
				yield(get_tree().create_timer(0.3), "timeout")
				current_state = states.OPENED
			
		states.OPENED:
			if Input.is_action_just_pressed("interact"):
				animation.play("quitting")
				current_state = states.QUIT
			
		states.QUIT:
			yield(animation,"animation_finished")
			emit_signal("concluded_reading")
			queue_free()

func setup_and_play(criminal_report_texture):
	criminal_report_node.texture = criminal_report_texture
	animation.play('show_up')
