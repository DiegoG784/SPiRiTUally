tool
extends EditorScenePostImport

var shader = load("res://entities/shaders/psx_shaders/psx_lit.shader")
var base_material = load("res://entities/base/base_shader_material.tres")

func post_import(scene):

	iterate(scene)
	return scene

func iterate(node):
	if node != null:
		#print(node.name)
		if node is MeshInstance:
			var material = node.material_override

			material = base_material
			#material.shader = shader
			# material = player_material

#			node.node.get("surface_1/material").albedo_texture
			#print(node.mesh.get("surface_1/material"))

		# 	print(material.get_shader_param("albedoTex"))

		
			if node.mesh.get("surface_1/material") != null:
				material.set_shader_param("albedoTex", node.mesh.get("surface_1/material").albedo_texture)
			
			print(material)
		# # node.name = "modified_" + node.name
		for child in node.get_children():
			iterate(child)