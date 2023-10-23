extends Node

var current_cutscene_node:AnimationPlayer
var current_cutscene_strip:int = 0
var cutscene_strip_length:int = 0

enum states {
	IDLE,
	IN_DIALOGUE,
	ANIMATION_PLAYING
}

var current_state = states.IDLE

# func _process(delta):
# 	match current_state:
# 		states.IDLE:
# 			pass
# 		states.IN_DIALOGUE:
# 			pass
# 		states.ANIMATION_PLAYING:
# 			pass


func start_cutscene(animation_node):
	current_cutscene_node = animation_node
	adjust_animation_player_settings()
	cutscene_strip_length = current_cutscene_node.get_animation_list().size() - 1
	Game.lock_player_input()
	Game.scene_manager.gui.lock_menu()
	current_cutscene_node.play(str(0))


func end_cutscene():
	print("cutscene terminada!")
	Game.unlock_player_input()
	Game.scene_manager.gui.unlock_menu()
	current_cutscene_node = null
	current_cutscene_strip = 0
	cutscene_strip_length = 0

func cutscene_strip_ended():
	pass
	
#func cutscene_dialogue_ended():
#	next_cutscene_branch()
		
func next_cutscene_branch():
	print("length: ", cutscene_strip_length)
	current_cutscene_strip += 1
	print("currentt: ", current_cutscene_strip)
	if is_finished():
		end_cutscene()
	else:
		print("indo para a próxima animação da cutscene")
		adjust_animation_player_settings()
		yield(get_tree().create_timer(0.5), "timeout")
		current_cutscene_node.play(str(current_cutscene_strip))

func is_finished():
	if current_cutscene_strip > (cutscene_strip_length - 1):
		return true
	else:
		return false

func adjust_animation_player_settings():
	if current_cutscene_node.get_animation( current_cutscene_node.get_animation_list()[current_cutscene_strip] ).track_get_type(0) == Animation.TYPE_METHOD:
		print("Animação contém  diálogos, trocar de track quando o diálogo terminar")
		
		if current_cutscene_node.is_connected("animation_finished", self, "animation_finished"):
		 current_cutscene_node.disconnect("animation_finished", self, "animation_finished")

	else:
		print("A animação não contém diálogos, seguir quando a animação terminar")
		current_cutscene_node.connect("animation_finished", self, "animation_finished")
		pass

func animation_finished(anim_name):
	next_cutscene_branch()

func dialogue_finished():
	next_cutscene_branch()
