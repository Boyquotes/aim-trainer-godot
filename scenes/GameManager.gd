extends Spatial

export var targets_to_destroy = 2
onready var bulletEmitter = $Player/Camera/WeaponManager/Weapons/Gun/BulletEmitter/HitscanBulletEmitter
onready var player = $Player
onready var gameOverScreen = $GameOver

onready var crosshair_selector_screen = $CrosshairSelector

enum GameStates{
	playing,
	paused,
	game_ended
}

var currentState = null

func _ready():
	currentState = GameStates.playing

	gameOverScreen.visible = false
	bulletEmitter.connect("targetCount", self, "checkGameState")

func _process(delta):
	if(Input.is_action_just_pressed("exit")):
		get_tree().quit()
	
	if(Input.is_action_just_pressed("open_crosshair_selector")):
		crosshair_selector_screen.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if(Globals.game_ended):
		player.set_process(false)
		player.set_process_input(false)
		gameOverScreen.visible = true

func checkGameState(acertos : float, tentativas: float):
	if(acertos == targets_to_destroy):
		var hitrate = (acertos/tentativas) * 100
		gameOverScreen.set_hitrate(hitrate)
		Globals.game_ended = true
