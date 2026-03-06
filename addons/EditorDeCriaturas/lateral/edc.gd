@tool
extends Control

@export var moduloGeral := preload("res://addons/EditorDeCriaturas/modulos/ModuloGeral.tscn")
@onready var conteiner_modulos: VBoxContainer = $MarginContainer/VBoxContainer/MarginContainer2/VBoxContainer/ScrollContainer/ConteinerModulos



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_pressed() -> void:
	var instancia := moduloGeral.instantiate()
	conteiner_modulos.add_child(instancia)
	print("atualizando")


func _on_limpar_pressed() -> void:
	print("iniciando limpeza")
	for filho in conteiner_modulos.get_children():
		print(filho.name, " foi morto")
		filho.queue_free()
	
	print("limpo")
