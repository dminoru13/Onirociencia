@tool
extends Control





@export_tool_button("Atualizar")
var botao_apertado = atualizar


@onready var camera_3d: Camera3D = $ColorRect/MarginContainer/HBoxContainer/SubViewportContainer/SubViewport/Node3D/centro_camera/Camera3D
@onready var velocidade_slider: HSlider = $ColorRect/MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/MarginContainer2/VBoxContainer/HBoxContainer2/VelocidadeSlider
@onready var zoom_slider: HSlider = $ColorRect/MarginContainer/HBoxContainer/VBoxContainer/MarginContainer/MarginContainer2/VBoxContainer/HBoxContainer/ZoomSlider
@onready var centro_camera: Node3D = $ColorRect/MarginContainer/HBoxContainer/SubViewportContainer/SubViewport/Node3D/centro_camera

var zoom := 0.0:
	set(value):
		zoom = value
		atualizar()


var textura_viewport


func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if camera_3d:
		if camera_3d.size != zoom_slider.value:
			camera_3d.size = zoom_slider.value
		pass
	if centro_camera and velocidade_slider:
		centro_camera.rotate_y(velocidade_slider.value/100)
	


func atualizar():
	pass
	
