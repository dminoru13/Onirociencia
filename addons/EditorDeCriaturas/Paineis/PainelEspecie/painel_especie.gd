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
	enviar_modelo()



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
	
	
	
	#CRIAR OS ENCAIXES AQUI
	conteiner_encaixes.lista_encaixes = especie_base.encaixes_parte
	
	
	enviar_modelo()
		
	conteiner_modificadores.lista_modificadores = modelo.lista_modificador


func carregar(arquivo: String):
	especie_base = load(arquivo)
	especie_base.modelo.reactive_changed.connect(atualizar)
	if modelo:
		escolhedor_modelo.alvo = modelo.caminho_modelo.split("/")[-1]
	
	#printar_especie_base()


func atribuir_modelo(arquivo: String):
	if modelo.caminho_modelo != arquivo:
		modelo.caminho_modelo = arquivo
		especie_base.gerar_encaixes()


func salvar():
	ResourceSaver.save(especie_base, especie_base.resource_path)
	printar_especie_base()


func printar_especie_base():
	print("")
	print("(PAINEL ESPECIE) salvando: ", especie_base.nome)
	print("(PAINEL ESPECIE) Modelo: ", especie_base.modelo.caminho_modelo)
	print("(PAINEL ESPECIE) modificadores:")
	for filho: Modificador in especie_base.modelo.lista_modificador.dados:
		print(filho.nome)
	
	print("(PAINEL ESPECIE) RECURSO ENCAIXE: ", especie_base.encaixes_parte)
	print("(PAINEL ESPECIE) ENCAIXES:")
	for encaixe: EncaixeRecurso in especie_base.encaixes_parte.dados:
		print("")
		print(encaixe.nome, " ", encaixe.posicao)
		print(" especies possiveis:")
		for especie in encaixe.lista_especie:
			print("  -", especie.nome)
		print(" modificadores:")
		for modificador: Modificador in encaixe.lista_modificador.dados:
			print("  -", modificador.nome, " ", modificador.habilitado)



func enviar_modelo():
	palco.peca.parte_base = especie_para_parte(especie_base)


func especie_para_parte(especie_alvo: Especie):
	if especie_alvo:
		var nova_parte: Parte = Parte.new()
		nova_parte.nome = especie_alvo.nome
		nova_parte.modelo = especie_alvo.modelo
		
		
		if especie_alvo.encaixes_parte.dados:
			for encaixe: EncaixeRecurso in especie_alvo.encaixes_parte.dados:
				var escolhido = randi_range(0, encaixe.lista_especie.size()-1)
				if encaixe.lista_especie:
					var nova_parte_filha: Parte = especie_para_parte(encaixe.lista_especie[escolhido])
					nova_parte_filha.modelo.lista_modificador = encaixe.lista_modificador
					nova_parte.lista_parte.append(nova_parte_filha)
		
		return(nova_parte)












#
