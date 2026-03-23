@tool
class_name OpcaoParte
extends HBoxContainer

@export var escolhedor: EscolhedorArquivo
var encaixe: EncaixeRecurso

func _on_escolhedor_arquivo_arquivo_pego(arquivo: String) -> void:
	var especie = load(arquivo)
	encaixe.lista_especie.append(especie)
	print("(OPCAO PARTE) especie adicionada as opcoes")
