@tool
extends SubViewportContainer

@export var centro_camera: Node3D
@export var camera: Camera3D
@export var peca: Node3D

var rotacionando := false
var sensibilidade := 0.01
var mouse_dentro := false



func _on_mouse_entered() -> void:
	mouse_dentro = true

func _on_mouse_exited() -> void:
	mouse_dentro = false
	rotacionando = false


func _input(event: InputEvent) -> void:
	if mouse_dentro:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_MIDDLE:
				rotacionando = event.pressed
		
		if event is InputEventMouseMotion and rotacionando:
			peca.rotate_y(deg_to_rad(event.relative.x))
			centro_camera.rotate_x(deg_to_rad(-event.relative.y))
		
		if event is InputEventMouseButton and event.is_pressed():
			match event.button_index:
				MOUSE_BUTTON_WHEEL_UP:
					camera.size = camera.size * 0.9
				
				MOUSE_BUTTON_WHEEL_DOWN:
					camera.size = camera.size * 1.1
	
