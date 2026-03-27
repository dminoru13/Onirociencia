@tool
class_name AtribuidorRoupas
extends MarginContainer

var parte_base: Parte

@export var escolhedor_cabeca: EscolhedorArquivo
@export var escolhedor_torso: EscolhedorArquivo
@export var escolhedor_pernas: EscolhedorArquivo
@export var conteiner_opcoes: VBoxContainer

var lista_roupas: Dictionary[String,Roupa] = {
	"cabeca": null,
	"torso": null,
	"pernas": null
}

func _on_palco_parte_atribuida(parte: Parte) -> void:
	parte_base = parte


func _on_escolhedor_arquivo_arquivo_pego(arquivo: String) -> void:
	var roupa_alvo: Roupa = load(arquivo)
	var tipo_alvo = roupa_alvo.tipo
	lista_roupas[tipo_alvo] = roupa_alvo
	
	


func _on_enviar_pressed() -> void:
	parte_base.roupas = lista_roupas
	parte_base.novas_roupas.emit()


func _on_limpar_pressed() -> void:
	for filho: HBoxContainer in conteiner_opcoes.get_children():
		var escolhedor: EscolhedorArquivo = filho.get_node("EscolhedorArquivo")
		escolhedor.text = "selecione roupa"
	
	
	lista_roupas.clear()
	parte_base.roupas = lista_roupas









#
