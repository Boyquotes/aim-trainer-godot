extends KinematicBody

export var mouse_sens = 0.5 #export -> significa que podemos alterar o valor da variavel pelo editor
onready var camera = $Camera #onready -> significa que o script espera ate que a camera esteja carregada para fazer esta linha
onready var weaponManager = $Camera/WeaponManager #onready -> significa que o script espera ate que a camera esteja carregada para fazer esta linha
onready var crosshair = $Camera/WeaponManager/Weapons/Gun/Crosshair

var crosshairs = {
	"crosshair1" : preload("res://crosshairs/crosshair001.png"),
	"crosshair2" : preload("res://crosshairs/crosshair026.png"),
	"crosshair3" : preload("res://crosshairs/crosshair065.png"),
	"crosshair4" : preload("res://crosshairs/crosshair066.png")
}
func _ready():
	crosshair.set_texture(crosshairs.crosshair3)
	# MOUSE_MODE_CAPTURED-> The mouse will be hidden and its position locked at the center of the screen.
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	weaponManager.init($Camera/FirePoint)

func _process(delta):
	weaponManager.wpAttack(Input.is_action_just_pressed("attack"))

func _input(event):
	# quando existe movimento de mouse
	if event is InputEventMouseMotion:
		rotation_degrees.y -= mouse_sens * event.relative.x
		camera.rotation_degrees.x -= mouse_sens * event.relative.y
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90,90)

func set_crosshair(crosshair_img : Texture):
	crosshair.set_texture(crosshair_img)
