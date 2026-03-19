@tool
class_name Modificador
extends Reactive

@export var nome: String = "eu to sem nome":
	set(value):
		nome = value
		emit_changed()
@export var tipo: String = "eu to sem tipo":
	set(value):
		tipo = value
		emit_changed()
@export var habilitado: bool = true:
	set(value):
		habilitado = value
		emit_changed()
@export var variaveis: Dictionary[String, Variant]:
	set(value):
		variaveis = value
		emit_changed()
