extends Area
class_name CameraSwitcher

export(NodePath) var camera_to_switch


# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_node(camera_to_switch).global_rotation)
	if !is_connected("body_entered", self, "player_entered"):
		self.connect("body_entered", self, "player_entered")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func player_entered(body):
	if body is Player:
		
		if camera_to_switch:
			var camera_node = get_node(camera_to_switch)
			
			camera_node.current = true
			Game.scene_manager.set_current_camera(camera_node)
		else:
			printerr("O nó " + self.name + " não possui uma câmera em sua variável!")
#		executar tratamento de repameamento de movimento
		
