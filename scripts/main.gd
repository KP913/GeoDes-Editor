extends Node2D

var testing_points := [Vector3(1, 1, 1)]
var inicialpointname := "A"
var pointindice := 0
var is_P3_visible := false
var grid_scaling_factor: int = 48
var text_offset_from


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var linhas_eixo_x_num := range(-100,101)
	
	for num in linhas_eixo_x_num:
		var linha = preload("res://scenes/eixo_x_linha.tscn").instantiate()
		linha.position.x = num*grid_scaling_factor
		linha.get_node("Label").text = str(-num) # Inverted because negative numbers are to the right
		
		$EixoXLinhas.add_child(linha)
	
	#Generates a bunch of points with default names for testing
	for coord in testing_points:
		add_point(coord, char(ord(inicialpointname)+pointindice))
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	pass

func _on_a_projecao_toggled(toggled_on: bool) -> void:
	is_P3_visible = toggled_on
	$EixoY.visible = toggled_on
	
func add_point(coord: Vector3, name: String) -> void:
	var ponto = preload("res://scenes/point.tscn").instantiate()
	ponto.coords = coord
	ponto.name = name
	pointindice += 1
	$Pontos.add_child(ponto)
		
