extends Spatial

var shader = load("res://entities/shaders/psx_shaders/psx_lit.shader")

func _ready():
#	print(shader)
	
	for mesh in get_children():
		if mesh is MeshInstance:
#			print(mesh)
			pass
			mesh.material_override = ShaderMaterial.new()
			mesh.material_override.shader = shader
#			yield(get_tree(),"idle_frame")
			mesh.mesh.get("surface_1/material").albedo_texture
			mesh.material_override.set_shader_param("albedoTex", mesh.mesh.get("surface_1/material").albedo_texture)
#			print(mesh.material_override.get_shader_param("shader_param/albedoTex"))
#			print(mesh.mesh.get("surface_1/material").albedo_texture)
