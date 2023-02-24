extends Spatial

var target = preload("res://scenes/Target.tscn")
export var distance_to_spawn = -10

func _ready():
	Globals.connect("targetDestroyed", self, "_generateTarget")

func _generateTarget():
	randomize()
	var spawnX = rand_range(-5, 5)
	var spawnY = rand_range(1, 4)
	var newCoordinate = Vector3(spawnX, spawnY, distance_to_spawn)
	var cube = target.instance()
	cube.transform.origin = newCoordinate
	add_child(cube)

