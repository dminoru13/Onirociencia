@tool
class_name PainelCriar
extends MarginContainer
signal arquivoCriado()

var caminho: String
@export var nomeador: TextEdit

func _ready() -> void:
	pass


func _on_btn_especie_pressed() -> void:
	var nova_especie = Especie.new()
	nova_especie.nome = nomeador.text
	ResourceSaver.save(nova_especie,caminho + "/" + nova_especie.nome +  ".tres")
	arquivoCriado.emit()
