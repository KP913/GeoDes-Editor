extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var linhas := range(-100,101)
	
	for pos in linhas:
		var linha = preload("res://eixo_x_linha.tscn").instantiate()
		linha.position.x = pos*-48
		linha.get_node("Label").text = str(pos)
		
		$EixoXLinhas.add_child(linha)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	pass
