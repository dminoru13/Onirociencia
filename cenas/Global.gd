@tool
extends Node

@export var tamanho_tiles := 64
@export var achatamento := 0.9

func get_raio_hexagono() -> float:
	return tamanho_tiles / 2.0

func get_largura_hexagono() -> float:
	return tamanho_tiles

func get_altura_hexagono() -> float:
	return get_raio_hexagono() * sqrt(3) * achatamento




func _ready() -> void:
	DisplayServer.window_set_vsync_mode(
	DisplayServer.VSYNC_DISABLED
)


func _process(delta):
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			pass
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			pass
