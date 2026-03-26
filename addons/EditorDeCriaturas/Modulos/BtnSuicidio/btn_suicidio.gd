@tool
class_name  BtnSuicidio
extends Button

@export var alvo: Control


func _on_pressed() -> void:
	alvo.queue_free()
