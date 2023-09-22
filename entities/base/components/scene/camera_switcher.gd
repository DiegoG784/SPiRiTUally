extends Area
class_name CameraSwitcher

export(NodePath) var camera_to_switch


# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_node(camera_to_switch).global_rotation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func player_entered(body):
	if body is Player:
		pass
		if camera_to_switch:
			print(get_node(camera_to_switch).transform.basis.z.normalized().abs().max_axis())
			get_node(camera_to_switch).current = true
		else:
			printerr("O nó " + self.name + " não possui uma câmera em sua variável!")
#		executar tratamento de repameamento de movimento
		
