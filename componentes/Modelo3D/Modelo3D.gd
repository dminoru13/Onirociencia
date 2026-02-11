class_name Modelo3D extends Node2D

@onready var conteiner_modelo : Node3D = $"SubViewportContainer/SubViewport/Node3D/Modelo"
@export var Modelo : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if eu_ja_tenho_modelo == false:
		if Modelo != null and conteiner_modelo != null:
			var instancia := Modelo.instantiate() as Node3D
			conteiner_modelo.add_child(instancia)
			eu_ja_tenho_modelo = true



var eu_ja_tenho_modelo := false

func _process(delta: float) -> void:
	pass
