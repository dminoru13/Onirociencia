@tool
extends Control





@export_tool_button("Atualizar")
var botao_apertado = atualizar

@export var painel_lateral: Control
@export var sub_viewport: SubViewport

var torso_atual: Node3D


var zoom := 0.0:
	set(value):
		zoom = value
		atualizar()


func _ready() -> void:
	painel_lateral.ArquivoTorsoBase.peguei_um_arquivo.connect(recebi_um_torso)
	painel_lateral.btn_atualizar.pressed.connect(atualizar)

func limpar():
	print("passanu pano")


func atualizar():
	pass
	



func recebi_um_torso(caminho, endereco):
	print("eu peguei o torso: ", caminho, " endereçado a ", endereco)
	var torso_cena:PackedScene = load(caminho)
	torso_atual = torso_cena.instantiate()


func _on_criar_nova_peca_pressed() -> void:
	pass # Replace with function body.
