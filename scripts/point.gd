extends Node2D

var coords := Vector3(0, 0, 0)
@onready var main = find_parent("Main")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$P1.position.x = -coords.x * 48
	$P1.position.y = coords.y * 48
	
	$P2.position.x = -coords.x * 48
	$P2.position.y = -coords.z * 48

	$Line2D.points[0] = $P1.position
	$Line2D.points[2] = $P2.position
	$Line2D.points[1] = Vector2($P1.position.x, 0)
	
	$LabelPoint1.text = name+"1"
	$LabelPoint1.position = $P1.position + Vector2(10, -24)
	$LabelPoint2.text = name+"2"
	$LabelPoint2.position = $P2.position + Vector2(10, -24)
	$P3.visible = main.is_P3_visible
	$LabelPoint3.visible = main.is_P3_visible
	$LineP2P3.visible = main.is_P3_visible
	$LineP1P3.visible = main.is_P3_visible
	
	if main.is_P3_visible:
		$P3.position.x = coords.y*48
		$P3.position.y = -coords.z*48
		
		$LabelPoint3.text = name+"3"
		$LabelPoint3.position = $P3.position + Vector2(10, -24)
		
		$LineP2P3.points[0] = $P2.position
		$LineP2P3.points[1] = Vector2(0, $P2.position.y)
		$LineP2P3.points[2] = $P3.position
		
		var lista = []
		lista.append($P1.position)
		lista.append(Vector2(0, $P1.position.y))
		var raio := coords.y*48
		for angle in range (-90, 0, 1):
			var point := Vector2(0, 0)
			point.x = raio*cos(deg_to_rad(angle))
			point.y = -raio*sin(deg_to_rad(angle))
			lista.append(point)
		lista.append(Vector2($P3.position.x,0))
		lista.append($P3.position)
		$LineP1P3.points = lista
