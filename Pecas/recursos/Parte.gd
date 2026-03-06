@tool
class_name Parte
extends Resource

@export var caracteristicas: Dictionary[String, String] = {
		"nome": "",
		"tipo": "",
		"caminho_modelo": "",
		"posicao": ""
	}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	atualizar_caracteristicas()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func atualizar_caracteristicas():
	print("atualizando caracteristicas")
	print("o caminho é: ", caracteristicas.caminho_modelo)
	if caracteristicas.caminho_modelo != "":
		print("caminho modelo existe")
		if caracteristicas.nome == "":
			print("nome está em branco")
			var caminho = caracteristicas.caminho_modelo
			var nome = caminho.split("/")[-1]
			print("atribuindo nome: ", nome)
			caracteristicas.nome = nome
	
	if caracteristicas.nome != "":
		var nome_alvo = caracteristicas.nome.trim_suffix(".tscn")
		var regex = RegEx.new()
		regex.compile("[0-9]")
		var resultado = regex.sub(nome_alvo, "", true)
		var separar = resultado.split("_")
		var nome_final = separar[0]
		caracteristicas.tipo = nome_final
