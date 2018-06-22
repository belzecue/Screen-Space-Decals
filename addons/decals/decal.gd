tool
extends MeshInstance

export(Texture) var decal setget set_decal
export(Vector2) var uv_offset = Vector2() setget set_uv_offset
export(Vector2) var uv_scale = Vector2(1, 1) setget set_uv_scale
export(bool) var emulate_lighting = true setget set_emulate_lighting

func _init():
	mesh = CubeMesh.new()
	mesh.material = preload("decal.material")

func set_decal(new_decal):
	decal = new_decal
	mesh.material.set_shader_param("decal", decal)

func set_uv_offset(new_offset):
	uv_offset = new_offset
	mesh.material.set_shader_param("offset", uv_offset)

func set_uv_scale(new_scale):
	uv_scale = new_scale
	mesh.material.set_shader_param("scale", uv_scale)

func set_emulate_lighting(new_value):
	emulate_lighting = new_value
	if emulate_lighting: mesh.material.set_shader_param("emulate_lighting", 1)
	else: mesh.material.set_shader_param("emulate_lighting", 0)