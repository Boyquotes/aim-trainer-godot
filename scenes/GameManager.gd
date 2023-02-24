extends Spatial

export var targets_to_destroy = 2

onready var bulletEmitter = $Player/Camera/WeaponManager/Weapons/Gun/BulletEmitter/HitscanBulletEmitter
onready var player = $Player
onready var playerCrosshair = $Player/Camera/WeaponManager/Weapons/Gun/Crosshair
onready var gameOverScreen = $GameOver
onready var menu = $Menu

enum GameStates{
	playing,
	paused,
	game_ended
}

var currentState = null

func _ready():
	menu.connect("closedMenu", self, "switchState")
	switchState("playing")
	gameOverScreen.visible = false
	bulletEmitter.connect("targetCount", self, "checkGameState")

func _process(delta):
	if(Input.is_action_just_pressed("open_menu")):
		switchState("paused")

	match currentState:
		GameStates.playing:
			menu.visible = false
			playerCrosshair.visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		GameStates.paused:
			menu.visible = true
			playerCrosshair.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		GameStates.game_ended:
			player.set_process(false)
			player.set_process_input(false)
			gameOverScreen.visible = true
			playerCrosshair.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func checkGameState(acertos : float, tentativas: float):
	if(acertos == targets_to_destroy):
		var hitrate = (acertos/tentativas) * 100
		gameOverScreen.set_hitrate(hitrate)
		switchState("game_ended")

func switchState(state : String):
	currentState = GameStates[state]
