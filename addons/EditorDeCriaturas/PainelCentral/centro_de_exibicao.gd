@tool
extends Control


@export var painel_lateral: PainelLateral
@export var sub_viewport: SubViewport
@export var modelo_peca: ModeloPeca
@export var label_torso: Label

var novo_recurso: RecursoPeca = RecursoPeca.new()
var ModificadorExemplo: AplicadorModificadores = AplicadorModificadores.new()


#FUNÇÕES

#funções meramente auxiliares
func removedor_de_numeros(texto: String):
	var regex = RegEx.new()
	regex.compile("[0-9]")
	var resultado = regex.sub(texto, "", true)
	var separar = resultado.split("_")
	var nome_final = separar[0]
	return nome_final
func _on_painel_lateral_arquivo_recebido(arquivo: String, endereco: String) -> void:
	arquivo_recebido(arquivo, endereco)
func _on_painel_lateral_modificadores_alterados(endereco: String, modificador: Modificador) -> void:
	atualizar_modificadores_partes(endereco, modificador)


#Funções principais

#atribui o novo recurso ao modelo
func atualizar():
	modelo_peca.recurso = novo_recurso
	painel_lateral.atualizar_painel(novo_recurso)


#arquivo vindo do torso
func _on_exibidor_de_arquivos_peguei_um_arquivo(arquivo: String, endereco: String) -> void:
	arquivo_recebido(arquivo, endereco)


#Ativa ao receber um arquivo de qualquer lugar
func arquivo_recebido(arquivo: String, endereco: String):
	
	
	if endereco == "torso":
		novo_recurso.torso_base.caminho_modelo = arquivo
		prencher_lista_partes(novo_recurso.torso_base)
	
	else:
		for parte in novo_recurso.torso_base.lista_partes:
			if parte.nome == endereco:
				parte.caminho_modelo = arquivo
				parte.modificadores_parte.clear()
				var cena_modelo: PackedScene = load(parte.caminho_modelo)
				var instancia_modelo: Node3D = cena_modelo.instantiate()
				
				if instancia_modelo.has_node("AplicadorModificadores"):
					var aplicador: Array[Modificador] = instancia_modelo.get_node("AplicadorModificadores").modificadores
					for modificador in aplicador:
						var mod_copia: Modificador = modificador.duplicate()
						mod_copia.habilitado = true
						parte.modificadores_parte.append(mod_copia)
				
					
					
	
	atualizar()

#prenche a lista de partes do recurso
func prencher_lista_partes(parte_alvo: Parte):
	parte_alvo.lista_partes.clear()
	var modelo_cena: PackedScene = load(parte_alvo.caminho_modelo)
	var modelo_alvo: Node3D = modelo_cena.instantiate()
	for filho in modelo_alvo.get_children():
		if filho is encaixePeca:
			var nova_parte: Parte = Parte.new()
			nova_parte.ancora = filho.position
			nova_parte.nome = filho.name
			parte_alvo.lista_partes.append(nova_parte)
			nova_parte.tipo = removedor_de_numeros(filho.name)

#MINORU FOCA NESSA PARTE AQUI!!!!!!!!!!!!
func atualizar_modificadores_partes(endereco: String, modificadorRecebido: Modificador):
	print("")
	for parte in novo_recurso.torso_base.lista_partes:

		if parte.nome == endereco:
			for modificador in parte.modificadores_parte:
				if modificador.nome == modificadorRecebido.nome:
					modificador = modificadorRecebido
				
				if modificador.habilitado:
					parte.modificadores_desabilitados.erase(modificador.nome)
				
				else:
					parte.modificadores_desabilitados.append(modificador.nome)
	
	atualizar()

















#
