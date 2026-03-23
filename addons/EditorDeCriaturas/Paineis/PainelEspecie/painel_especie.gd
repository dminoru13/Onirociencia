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
@export var conteiner_encaixes: ConteinerEncaixe



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
	especie_para_parte()



#funções princiapais
func _ready() -> void:
	for c in lista_controls:
		c.disabled = true
	

func atualizar():
	print("")
	print("(PAINEL ESPECIE) atualizando")
	
	#UI
	lbl_nome.text = especie_base.nome
	for c in lista_controls:
		c.disabled = false
	
	#back end
	modelo = especie_base.modelo
	
	especie_base.gerar_encaixes()
	
	
	#CRIAR OS ENCAIXES AQUI
	conteiner_encaixes.lista_encaixes = especie_base.encaixes_parte
	
	
	especie_para_parte()
		
	conteiner_modificadores.lista_modificadores = modelo.lista_modificador
	
func carregar(arquivo: String):
	especie_base = load(arquivo)
	especie_base.modelo.reactive_changed.connect(atualizar)
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

func especie_para_parte():
	if especie_base:
		var nova_parte: Parte = Parte.new()
		nova_parte.nome = especie_base.nome
		nova_parte.modelo = especie_base.modelo
		
		if especie_base.encaixes_parte.dados:
			for encaixe: EncaixeRecurso in especie_base.encaixes_parte.dados:
				var escolhido = randi_range(0, encaixe.lista_especie.size())
				if encaixe.lista_especie:
					nova_parte.lista_parte.append(encaixe.lista_especie[escolhido])
		
		palco.peca.parte_base = nova_parte











#
