extends Spatial

var target = preload("res://scenes/Target.tscn")
export var distance_to_spawn = 20

func _ready():
	SignalBus.connect("targetDestroyed", self, "_generateTarget")

func _generateTarget():
	randomize()
	var spawn = rand_range(-1, 1)
	var newCoordinate = Vector3(spawn, spawn, distance_to_spawn)
	var cube = target.instance()
	cube.transform.origin = newCoordinate
	add_child(cube)

