@tool
class_name Especie
extends Reactive

@export var nome: String
@export var encaixes_parte: ArrayMelhor = ArrayMelhor.new("encaixes_parte", self)
@export var encaixes_roupa: ArrayMelhor = ArrayMelhor.new("encaixe_roupas", self)
@export var modelo: Modelo = Modelo.new("modelo", self)


func gerar_encaixes():
	#print("(ESPECIE) gerando encaixes")
	encaixes_parte.clear()
	encaixes_roupa.clear()
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
				
				if novo_encaixe.tipo == "PARTE":
					encaixes_parte.append(novo_encaixe)
					#print("(ESPECIE) parte: ", novo_encaixe.nome)
				
				if novo_encaixe.tipo == "ROUPA":
					encaixes_roupa.append(novo_encaixe)
					#print("(ESPECIE) roupa: ", novo_encaixe.nome)













#
