@tool
class_name OpcaoParte
extends HBoxContainer

@export var escolhedor: EscolhedorArquivo
var encaixe: EncaixeRecurso
var especie_anterior: Especie

func _on_escolhedor_arquivo_arquivo_pego(arquivo: String) -> void:
	if especie_anterior != null:
		print("(OPCAO PARTE) apagando especie anterior")
		encaixe.lista_especie.erase(especie_anterior)
	
	var original: Especie = load(arquivo)
	var especie: Especie = original.duplicate_deep()
	especie.modelo.posicao = encaixe.posicao
	encaixe.lista_especie.append(especie)
	print("(OPCAO PARTE) especie adicionada as opcoes")
	especie_anterior = especie


func _on_btn_suicidio_pressed() -> void:
	print("(OPCAO PECA) eliminando: ", especie_anterior.nome)
	encaixe.lista_especie.erase(especie_anterior)
