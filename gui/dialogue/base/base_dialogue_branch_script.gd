extends Control

onready var dialogue_text = get_node("dialogue_background/dialogue_text")
onready var character_name = get_node("character_name_background/character_name")
onready var character_name_background = get_node("character_name_background")

var dialogue_branch:Array
var current_dialogue:Dictionary
var current_dialogue_text = 0
var current_dialogue_id = 0
var dialogue_speed:float
var with_options = false
var can_choose = false
var option_focused

enum states {IDLE, RUNNING, CHOOSING}
var current_state = states.IDLE

signal dialogue_finished

func _ready():
	hide()
	set_dialogue_by_id(0)
#	var test = Dialogue.get_dialogue_branch("test")
#	setup(test.result)
#	travar controle do jogador, começar diálogo
	show()
	current_state = states.RUNNING

func _process(delta):
	match current_state:
		states.IDLE:
			pass
		states.RUNNING:
#			print(with_options)
#			dialogue_text.visible_characters += dialogue_speed
#			print("antes: " + str(dialogue_text.percent_visible))
#			print(dialogue_text.percent_visible)
#			print("depois: " + str(dialogue_text.percent_visible))
			
			if dialogue_text.percent_visible != 1:
				
				if Input.is_action_pressed("interact"):
					dialogue_text.percent_visible += dialogue_speed * 2.5
					
				else:
					dialogue_text.percent_visible += dialogue_speed
					
				
			else:
				
				if with_options and is_finishing_dialogue() and !can_choose and current_dialogue.has("dialogue_options"):
#					print("para as escolhas")
					current_state = states.CHOOSING
					
				else:
					
					if Input.is_action_just_pressed("interact"):
						if !is_finishing_dialogue():
							current_dialogue_text += 1
							set_next_dialogue_text()
						else:
							execute_dialogue_events()
					
				
		states.CHOOSING:
			if !can_choose:
#				print("escolhendo")
				# character_name_background.hide()
				for option in current_dialogue["dialogue_options"].size():
					var current_option = current_dialogue["dialogue_options"][option]
#					print(current_dialogue["dialogue_options"].size())
#					print("adicionando botões")
					print(current_option.size())
					
					if current_option.size() > 2:
						var current_sub_option = current_option[2]
						match current_sub_option[0]:
							"item":
								if Inventory.search_item(current_sub_option[1]) != null:
									create_option_button(current_option[0])

					else:
						create_option_button(current_option[0])
					
				get_node("selectable_options").get_child(0).grab_focus()
				can_choose = true


func create_option_button(option_text):
	var button = Button.new()
#	button.button_mask
	button.text = option_text
	button.connect("pressed", self, "option_selected")
	button.connect("focus_entered", self, "button_focused")

	get_node("selectable_options").add_child(button)

#	configurar as opções selecionáveis

func option_selected():
	var current_dialogue_option = dialogue_branch[current_dialogue_id]["dialogue_options"][option_focused.get_index()]
	print(current_dialogue_option)
	var dialogue_to_travel = current_dialogue_option[1]
	for i in get_node("selectable_options").get_children():
		i.disconnect("pressed", self, "option_selected")
		i.disconnect("focus_entered", self, "button_focused")
		i.queue_free()
	
	if str(current_dialogue_option[1]) == "end":
		queue_free()
	else:
		set_dialogue_by_id(dialogue_to_travel)
		current_state = states.RUNNING
	can_choose = false

func button_focused():
	option_focused = get_focus_owner()

func set_dialogue_by_id(dialogue_id):
#	print(dialogue_id)
	current_dialogue = {}
	current_dialogue_id = dialogue_id
	current_dialogue_text = 0
	
	for dialogue in dialogue_branch:
		if dialogue["dialogue_id"] == dialogue_id:
			current_dialogue = dialogue
			
			set_next_dialogue_text()
			
#			print(dialogue_speed)
	
	if current_dialogue.has("dialogue_options"):
		with_options = true
	
	print(current_dialogue)

func setup(dialogue_branch):
	self.dialogue_branch = dialogue_branch

func set_next_dialogue_text():
	
	dialogue_text.hide() if is_inside_tree() else null
#			print(dialogue)
	if current_dialogue["dialogue_texts"][current_dialogue_text][0] != "none":
		character_name_background.show()
		character_name.text = current_dialogue["dialogue_texts"][current_dialogue_text][0]
	else:
		character_name_background.hide()
	dialogue_text.text = current_dialogue["dialogue_texts"][current_dialogue_text][2]
#	print(dialogue_text.text)
	dialogue_text.percent_visible = 0
	dialogue_text.show() if is_inside_tree() else null
	
	yield(get_tree(),"idle_frame") #Precisa ser colocado pra funcionar a atribuição abaixo por algum motivo
	dialogue_text.visible_characters = 1
	
	
	dialogue_speed = dialogue_text.percent_visible * 0.5

func execute_dialogue_events():
	if current_dialogue.has("dialogue_events"):
		var events_to_execute = []
#		var execution_order = ["inventory", "scene", "dialogue"] NAO DELETAR
#		["inventory", "give_item", "item_file.tres"]
#		["script_name", "script_method", "optional_script_arguments"]
		
		for i in current_dialogue["dialogue_events"]:
			events_to_execute.append(i)
		
#		events_to_execute.sort_custom(ExecutionOrderSorter, "execution_order")
#		print(events_to_execute)
		hide()
		
		for event in events_to_execute:
			match event[0]:
				"inventory":
					if event[1] == "give_item":
						var quantity = event[3] if event.size() == 4 else 1
						
						Inventory.give_item(event[2], quantity)
						continue
				"scene":
					print("trocou de cena")
					
				"dialogue":
					if event[1] == "end":
						emit_signal("dialogue_finished")
						queue_free()
	else:
		emit_signal("dialogue_finished")
		queue_free()

func is_finishing_dialogue():
	return current_dialogue_text == (current_dialogue["dialogue_texts"].size() - 1)

#class ExecutionOrderSorter:
#	static func execution_order(a, b):
#		print(a, b)
#		if a[0] < b[0]:
#			return true
#		return false


#	print(current_dialogue)
#	dialogue_text.hide()
#	dialogue_text.text = current_dialogue["dialogue_texts"][current_dialogue_text][2]
#	dialogue_text.percent_visible = 0
#	dialogue_text.show()
