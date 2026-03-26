@tool
class_name ModuloTipoArquivo
extends HBoxContainer

@export var seletor_tipos: SeletorTipos


var tipo: String
var modelo: Modelo = Modelo.new()

func _ready() -> void:
	seletor_tipos.select(Global.lita_tipos_partes.find(tipo))



func _on_escolhedor_arquivo_arquivo_pego(arquivo: String) -> void:
	modelo.caminho_modelo = arquivo

func _on_seletor_tipos_item_selected(index: int) -> void:
	tipo = Global.lita_tipos_partes[index]
