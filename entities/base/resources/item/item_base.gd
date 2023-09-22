extends Resource
class_name Item

#export(StreamTexture) var icon
export(String) var name
export(String, MULTILINE) var description
export(int) var value
export(PackedScene) var item_scene #Somente para Armas/Ferramentas?
export(GDScript) var item_script #Somente para consumíveis?
