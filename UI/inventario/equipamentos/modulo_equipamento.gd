@tool
class_name ModuloEquipamento
extends Panel

@export var texture_rect: TextureRect
@export var cor1: Color:
	set(v):
		cor1 = v
		if texture_rect:
			texture_rect.modulate = cor1
			estilo.border_color = cor1
@export var cor2: Color:
	set(v):
		cor2 = v
		if texture_rect:
			estilo.bg_color = cor2
@export var sprite: Texture:
	set(v):
		sprite = v
		setar_sprite()

var estilo: StyleBox = get_theme_stylebox("panel")


func setar_sprite():
	if texture_rect:
		texture_rect.texture = sprite
