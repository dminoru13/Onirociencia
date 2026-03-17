@tool
class_name PainelEspecie
extends MarginContainer

@export var escolhedor_de_arquivo: EscolhedorArquivo
@export var lbl_nome: Label
@export var lista_controls: Array[Button]
@export var palco: Palco

var especie_base: Especie:
	set(value):
		especie_base = value
		atualizar()
var modelo: Modelo


#Sinais conectados
func _on_escolhedor_arquivo_arquivo_pego(arquivo: String) -> void:
	carregar(arquivo)
func _on_escolhedor_modelo_arquivo_pego(arquivo: String) -> void:
	atribuir_modelo(arquivo)
func _on_btn_salvar_pressed() -> void:
	salvar()
func _on_btn_roletar_pressed() -> void:
	especie_para_peca()



#funções princiapais
func _ready() -> void:
	for c in lista_controls:
		c.disabled = true

func atualizar():
	lbl_nome.text = especie_base.nome
	
	for c in lista_controls:
		c.disabled = false
	
	modelo = especie_base.modelo
	
	if modelo.caminho_modelo != "":
		especie_para_peca()

func carregar(arquivo: String):
	especie_base = load(arquivo)

func atribuir_modelo(arquivo: String):
	modelo.caminho_modelo = arquivo

func salvar():
	ResourceSaver.save(especie_base, especie_base.resource_path)

func especie_para_peca():
	if especie_base:
		var nova_parte: Parte = Parte.new()
		nova_parte.nome = especie_base.nome
		nova_parte.modelo = especie_base.modelo
		
		palco.peca.parte_base = nova_parte













#
