extends Node2D

var testing_points := [Vector3(1, 1, 1)]
var inicialpointname := "A"
var pointindice := 0
var is_P3_visible := false
var grid_scaling_factor: int = 48
var text_offset_from
var percent_grid_line_opacity := 30


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var linhas_eixo_x_num := range(-100,101)
	for num in linhas_eixo_x_num:
		add_eixo_x_linha(num)
		add_grid_line_x(num)
		add_grid_line_y(num)
		
	
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
	
func add_eixo_x_linha (num: int):
	var linha = preload("res://scenes/grid_lines/eixo_x_linha.tscn").instantiate()
	linha.position.x = num*grid_scaling_factor
	linha.get_node("Label").text = str(-num) # Inverted because negative numbers are to the right
	$EixoXLinhas.add_child(linha)
	
func add_grid_line_x(num: int):
	var grid_line_x = preload("res://scenes/grid_lines/grid_line_x.tscn").instantiate()
	grid_line_x.position.x = num*grid_scaling_factor
	$EixoXGridLines.add_child(grid_line_x)

func add_grid_line_y(num:int):
	var grid_line_y = preload("res://scenes/grid_lines/grid_line_y.tscn").instantiate()
	grid_line_y.position.y = num*grid_scaling_factor
	$EixoYGridLines.add_child(grid_line_y)

func add_point(coord: Vector3, name: String) -> void:
	var ponto = preload("res://scenes/point.tscn").instantiate()
	ponto.coords = coord
	ponto.name = name
	pointindice += 1
	$Pontos.add_child(ponto)
		


func _on_add_point_pressed() -> void:
	pass # Replace with function body.
