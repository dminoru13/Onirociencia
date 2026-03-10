@tool
extends Control





@export_tool_button("Atualizar")
var botao_apertado = atualizar

@export var painel_lateral: Control
@export var sub_viewport: SubViewport
@export var modelo_peca: ModeloPeca
@export var label_torso: Label

var novo_recurso: RecursoPeca = RecursoPeca.new()

var zoom := 0.0:
	set(value):
		zoom = value
		atualizar()



func limpar():
	print("passanu pano")


func _on_criar_nova_peca_pressed() -> void:
	criar_nova_peca()
func _on_atualizar_pressed() -> void:
	atualizar()

func apagar_peca():
	print("resetando peca")
	modelo_peca.recurso = RecursoPeca.new()


func criar_nova_peca():
	apagar_peca()
	print("criando novo filho")
	
	print(modelo_peca.recurso)

func atualizar():
	print("Caminho-torso: " , novo_recurso.torso_base.caminho_modelo)
	modelo_peca.recurso = novo_recurso


func _on_exibidor_de_arquivos_peguei_um_arquivo(arquivo: String, endereco: String) -> void:
	arquivo_recebido(arquivo, endereco)
	
	
	
func arquivo_recebido(arquivo: String, endereco: String):
	print("arquivo: ", arquivo, "   endereco: ", endereco)
	
	if endereco == "torso":
		novo_recurso.torso_base.caminho_modelo = arquivo
		
	
	atualizar()
















#
