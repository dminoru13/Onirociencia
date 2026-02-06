extends Camera2D

@export var zoom_padrao := Vector2(2, 2)
@export var zoom_max := Vector2(3, 3)
@export var zoom_min := Vector2(0.5, 0.5)
@export var velocidade_zoom := 0.1

func _ready():
	zoom = zoom_padrao

	
func _process(delta: float) -> void:
	var direcao := Vector2.ZERO
	
	


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(velocidade_zoom, velocidade_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(velocidade_zoom, velocidade_zoom)

		zoom.x = clamp(zoom.x, zoom_min.x, zoom_max.x)
		zoom.y = clamp(zoom.y, zoom_min.y, zoom_max.y)
