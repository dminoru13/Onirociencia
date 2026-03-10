@tool
class_name Parte
extends Resource


@export var nome: String = ""
@export var ancora: Vector3 = Vector3(0,0,0)
@export var caminho_modelo: String = ""
@export var tipo: String = ""

@export var lista_partes: Array[Parte] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	atualizar_caracteristicas()
	

func atualizar_caracteristicas():
	print("atualizando caracteristicas")
	print("o caminho é: ", caminho_modelo)
	if caminho_modelo != "":
		print("caminho modelo existe")
		if nome == "":
			print("nome está em branco")
			nome = caminho_modelo.split("/")[-1]
			print("atribuindo nome: ", nome)
	
	if nome != "":
		var nome_alvo = nome.trim_suffix(".tscn")
		var regex = RegEx.new()
		regex.compile("[0-9]")
		var resultado = regex.sub(nome_alvo, "", true)
		var separar = resultado.split("_")
		var nome_final = separar[0]
		tipo = nome_final
