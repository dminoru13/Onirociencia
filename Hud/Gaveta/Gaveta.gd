@tool
extends Control


@onready var ParteQueSeMeche = $ParteQueSeMeche
@onready var Conteudo = $ParteQueSeMeche/Conteudo

var aberto_interno := false
@export var aberto := false:
	set(value):
		if aberto_interno == value:
			return
		aberto_interno = value
		Abrir_fechar()
	get:
		return aberto_interno

enum  Lados {
	CIMA,
	ESQUERDA,
	DIREITA,
	BAIXO
}

@export var lado : Lados = Lados.BAIXO
@export var ProporcaoAberto = 0.1
@export var ProporcaoFechado = 0.9

var Proporcao := 0.0
var tween: Tween


func _ready() -> void:
	tween = create_tween()
	tween.kill()

func _on_colisor_da_parte_que_meche_mouse_entered() -> void:
	aberto = true
func _on_colisor_da_parte_que_meche_mouse_exited() -> void:
	aberto = false

func Abrir_fechar():
	
	if Engine.is_editor_hint():
		if aberto:
			Proporcao = ProporcaoAberto
		else:
			Proporcao = ProporcaoFechado
	
	else:
		if tween:
			tween.kill()
		tween = create_tween()
		
		if aberto:
			tween.tween_property(self, "Proporcao", ProporcaoAberto, 0.1)
		else:
			tween.tween_property(self, "Proporcao", ProporcaoFechado, 0.1)




func _process(delta: float) -> void:
	if ParteQueSeMeche == null:
		return
	
	match lado:
		Lados.CIMA:
			ParteQueSeMeche.position.y = -size.y * Proporcao
		
		Lados.ESQUERDA:
			ParteQueSeMeche.position.x = -size.x * Proporcao
		
		Lados.DIREITA:
			ParteQueSeMeche.position.x = size.x * Proporcao
		
		Lados.BAIXO:
			ParteQueSeMeche.position.y = size.y * Proporcao
		
		
