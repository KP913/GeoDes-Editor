extends Camera2D

var is_panning = false

func _input(event: InputEvent) -> void:
	var limite_posicao := 40.1
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			is_panning = true
		if !event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			is_panning = false
	
	if is_panning && event is InputEventMouseMotion:
		var vector = event.relative
		position -= vector
		position = position.clamp(Vector2(-limite_posicao*48, -limite_posicao*48), Vector2((limite_posicao+1)*48, (limite_posicao+1)*48))
