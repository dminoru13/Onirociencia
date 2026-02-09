extends Camera2D

var arrastando := false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and arrastando:
		global_position -= event.relative / zoom
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			arrastando = event.pressed
		
		#ZOOM
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1.1
		
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom *= 0.9
	
	
