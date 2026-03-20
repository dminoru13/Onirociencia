@tool
class_name PainelEspecie
extends MarginContainer

@export var escolhedor_de_arquivo: EscolhedorArquivo
@export var lbl_nome: Label
@export var lista_controls: Array[Control]
@export var palco: Palco
@export var conteiner_modificadores: ConteinerModificador
@export var escolhedor_modelo: EscolhedorArquivo
@export var conteiner_roupas: ConteinerEncaixe
@export var conteiner_partes: ConteinerEncaixe



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
	print("atualizando")
	
	#UI
	lbl_nome.text = especie_base.nome
	for c in lista_controls:
		c.disabled = false
	
	#back end
	modelo = especie_base.modelo
	
	especie_base.gerar_encaixes()
	
	for encaixe: EncaixeRecurso in especie_base.encaixes_parte.dados:
		print("(PAINEL ESPECIS) encaixe encontrad0: ", encaixe.nome)
	
	especie_para_peca()
		
	conteiner_modificadores.lista_modificadores = modelo.lista_modificador
	
func carregar(arquivo: String):
	especie_base = load(arquivo)
	especie_base.modelo.reactive_changed.connect(testar)
	if modelo:
		escolhedor_modelo.alvo = modelo.caminho_modelo.split("/")[-1]

	

func atribuir_modelo(arquivo: String):
	modelo.caminho_modelo = arquivo

func salvar():
	ResourceSaver.save(especie_base, especie_base.resource_path)
	
	print("")
	print("salvando: ", especie_base.nome)
	print("Modelo: ", especie_base.modelo.caminho_modelo)
	print("modificadores:")
	for filho: Modificador in especie_base.modelo.lista_modificador.dados:
		print(filho.nome)

func especie_para_peca():
	if especie_base:
		var nova_parte: Parte = Parte.new()
		nova_parte.nome = especie_base.nome
		nova_parte.modelo = especie_base.modelo
		
		palco.peca.parte_base = nova_parte



func testar(valor = null):
	print("teste teste")









#
