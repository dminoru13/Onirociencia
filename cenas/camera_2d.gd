extends Camera2D

@export var zoom_padrao := Vector2(2, 2)
@export var zoom_max := Vector2(3, 3)
@export var zoom_min := Vector2(0.5, 0.5)
@export var velocidade_zoom := 0.1

func _ready():
	zoom = zoom_padrao


var ultima_pos_mouse: Vector2
var movendo := false

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if not movendo:
			ultima_pos_mouse = get_global_mouse_position()
			movendo = true

		var mouse_atual = get_global_mouse_position()
		global_position -= mouse_atual - ultima_pos_mouse
		ultima_pos_mouse = mouse_atual
	else:
		movendo = false
		
		
	
	
	


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		
		#ZOOM
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(velocidade_zoom, velocidade_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(velocidade_zoom, velocidade_zoom)

		zoom.x = clamp(zoom.x, zoom_min.x, zoom_max.x)
		zoom.y = clamp(zoom.y, zoom_min.y, zoom_max.y)
		
		#MOVIMENTAÇÃO
		
		
