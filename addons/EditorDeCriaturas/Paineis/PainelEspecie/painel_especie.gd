@tool
class_name PainelEspecie
extends MarginContainer

@export var escolhedor_de_arquivo: EscolhedorArquivo
@export var lbl_nome: Label

var especie_base: Especie


#carrega o recurso selecionado
func _on_escolhedor_arquivo_arquivo_pego(arquivo: String) -> void:
	especie_base = load(arquivo)
	atualizar()

#carregar modelo 
func _on_escolhedor_modelo_arquivo_pego(arquivo: String) -> void:
	especie_base.modelo = arquivo
	print(especie_base.modelo)

#salvar recurso
func _on_btn_salvar_pressed() -> void:
	ResourceSaver.save(especie_base, especie_base.resource_path)


func atualizar():
	print(especie_base.nome)
	lbl_nome.text = especie_base.nome















#
