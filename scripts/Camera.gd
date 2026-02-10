extends Camera2D

var arrastando := false

signal zoom_alterado(novo_zoom: Vector2)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and arrastando:
		global_position -= event.relative / zoom
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			arrastando = event.pressed
		
		#ZOOM
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1.1
			emit_signal("zoom_alterado", zoom)
		
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom *= 0.9
			emit_signal("zoom_alterado", zoom)
	
	
