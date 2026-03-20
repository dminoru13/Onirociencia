@tool
class_name Especie
extends Reactive

@export var nome: String
@export var modelo: Modelo = Modelo.new():
	set(v):
		modelo = v
		gerar_encaixes()
@export var lista_encaixes: ArrayMelhor = ArrayMelhor.new()


func gerar_encaixes():
	lista_encaixes.clear()
	
	var caminho_modelo: String = modelo.caminho_modelo 
	
	if caminho_modelo != "":
		var cena: PackedScene = load(caminho_modelo)
		var instancia: Node3D = cena.instantiate()
		
		for encaixe in instancia.get_children():
			if encaixe is EncaixeNode:
				var novo_encaixe: EncaixeRecurso = EncaixeRecurso.new()
				novo_encaixe.nome = encaixe.name
				novo_encaixe.tipo = encaixe.tipo_string
				novo_encaixe.posicao = encaixe.position
				
				












#
