@tool
class_name Parte
extends Resource


@export var nome: String = ""
@export var ancora: Vector3 = Vector3(0,0,0)
@export var caminho_modelo: String = ""
@export var tipo: String = ""

@export var lista_partes: Array[Parte] = []

@export var modificadores_parte: Array[Modificador]



func _ready() -> void:
	atualizar_caracteristicas()


func removedor_de_numeros(texto: String):
	var regex = RegEx.new()
	regex.compile("[0-9]")
	var resultado = regex.sub(texto, "", true)
	var separar = resultado.split("_")
	var nome_final = separar[0]
	return nome_final

func atualizar_caracteristicas():
	if caminho_modelo != "":
		if nome == "":
			nome = caminho_modelo.split("/")[-1]
		
	if nome != "" and tipo == "":
		var nome_alvo = nome.trim_suffix(".tscn")
		tipo = removedor_de_numeros(nome_alvo)
	
	for parte in lista_partes:
		if parte.caminho_modelo != "":
			pass
	

func odificadore_alterados():
	print(nome)
	print(modificadores_parte)
