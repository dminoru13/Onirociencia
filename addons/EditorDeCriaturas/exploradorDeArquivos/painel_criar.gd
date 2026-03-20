@tool
class_name PainelCriar
extends MarginContainer
signal arquivoCriado()

var caminho: String
@export var nomeador: TextEdit
@export var conteiner_botoes: VBoxContainer
@export var opcoes: MarginContainer
@export var configuracoes: MarginContainer
@export var conteiner_modulos: VBoxContainer

var botao_atual: String
var valor_relevante

func _enter_tree() -> void:
	for filho in conteiner_botoes.get_children():
		if filho is Button:
			filho.pressed.connect(configurar.bind(filho))
	
	opcoes.visible = true
	configuracoes.visible = false
		

func configurar(botao: Button):
	opcoes.visible = false
	configuracoes.visible = true
	botao_atual = botao.text
	
	for filho in conteiner_modulos.get_children():
		filho.queue_free()
	
	if botao_atual == "MODIFICADOR":
		var modificador_referencia = Modificador.new("modificador_referencia")
		var btn_opcao = OptionButton.new()
		
		for tipo in modificador_referencia.dicionario_tipos.keys():
			btn_opcao.add_item(tipo)
		
		btn_opcao.item_selected.connect(atribuir_valor_relevante)
		conteiner_modulos.add_child(btn_opcao)


func atribuir_valor_relevante(valor):
	valor_relevante = valor


func _on_btn_voltar_pressed() -> void:
	opcoes.visible = true
	configuracoes.visible = false

func _on_btn_criar_pressed() -> void:
	if botao_atual == "ESPECIE":
		criar_especie()
	
	if botao_atual  == "MODIFICADOR":
		criar_modificador()


func criar_especie() -> void:
	var nova_especie = Especie.new(nomeador.text)
	nova_especie.nome = nomeador.text
	ResourceSaver.save(nova_especie,caminho + "/" + nova_especie.nome +  ".tres")
	arquivoCriado.emit()

func criar_modificador():
	var novo_modificador = Modificador.new(nomeador.text)
	novo_modificador.nome = nomeador.text
	novo_modificador.tipo = novo_modificador.dicionario_tipos.keys()[valor_relevante]
	ResourceSaver.save(novo_modificador,caminho + "/" + novo_modificador.nome +  ".tres")
	arquivoCriado.emit()






#
