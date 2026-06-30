extends Node2D

var points := [Vector3(1,2,3)]
var inicialpointname := "A"
var pointindice := 0
var is_P3_visible := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var linhas := range(-100,101)
	
	for pos in linhas:
		var linha = preload("res://eixo_x_linha.tscn").instantiate()
		linha.position.x = pos*-48
		linha.get_node("Label").text = str(pos)
		
		$EixoXLinhas.add_child(linha)
	
	if is_P3_visible:
		$EixoY.show()
		#TODO Meter texto na linha vertical
		
	for coord in points:
		add_point(coord)
	
		# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	pass


func _on_a_projecao_toggled(toggled_on: bool) -> void:
	is_P3_visible = toggled_on
	$EixoY.visible = toggled_on
	
func add_point(coord: Vector3):
	var ponto = preload("res://point.tscn").instantiate()
	ponto.coords = coord
	ponto.name = char(ord(inicialpointname)+pointindice)
	pointindice += 1
	$Pontos.add_child(ponto)
		
