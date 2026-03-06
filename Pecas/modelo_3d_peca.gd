@tool
extends Node3D

@export_tool_button("testar")
var apertou_testar = testar

@export var ArrayMembros: Array[GrupoDePartes]
@export var TorsoBase: String:
	set(value):
		TorsoBase = value
		criar_torso()




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func criar_torso():
	for crianca in get_children():
		crianca.queue_free()
	
	if ResourceLoader.exists(TorsoBase):
		print("torso_valido")
		
		var modelo_torso := load(TorsoBase)
		
		var instancia_torso = modelo_torso.instantiate()
		
		add_child(instancia_torso)
	
	else:
		print("torso_invalido")
	
	pass

func adicionar_parte(parte:Parte):
	print("adicionando parte: ", parte)
	parte.atualizar_caracteristicas()
	print("o grupo dessa parte é: ", parte.caracteristicas.tipo)
	
	for Grupo in ArrayMembros:
		print("o grupo:", Grupo.nome, "tem o mesmo nome do tipo: ", parte.caracteristicas.tipo)
		if Grupo.nome == parte.caracteristicas.tipo:
			Grupo.listaPartes.append(parte)
		
		else:
			print("o grupo:", Grupo.none, "ainda não existe")
			criar_grupo(parte)
	
	if ArrayMembros == []:
		print("a array base está vazia")
		criar_grupo(parte)
	
	notify_property_list_changed()

func criar_grupo(parte: Parte):
	print("criando grupo: ", parte.caracteristicas.tipo)
	var novo_grupo = GrupoDePartes.new()
	novo_grupo.nome = parte.caracteristicas.tipo
	novo_grupo.listaPartes.append(parte)
	ArrayMembros.append(novo_grupo)

func criar_parte():
	var parte_teste = Parte.new()
	parte_teste.caracteristicas.caminho_modelo = "res://Pecas/Humanoide/Partes/Braco/braco.tscn"
	parte_teste.caracteristicas.posicao = "2,3,5"
	adicionar_parte(parte_teste)

func testar():
	criar_torso()
	
