tool
extends EditorScenePostImport

var shader = load("res://entities/shaders/psx_shaders/psx_lit.shader")


func post_import(scene):

	iterate(scene)
	return scene

func iterate(node):
	if node != null:
		# print(node.name)
		if node is MeshInstance:
			node.material_override = ShaderMaterial.new()
			node.material_override.shader = shader
#			yield(get_tree(),"idle_frame")
#			node.node.get("surface_1/material").albedo_texture
			node.material_override.set_shader_param("albedoTex", node.mesh.get("surface_1/material").albedo_texture)
		# node.name = "modified_" + node.name
		for child in node.get_children():
			iterate(child)