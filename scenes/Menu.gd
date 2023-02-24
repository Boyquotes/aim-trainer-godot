extends Control

onready var player = get_node("/root/GameManager/Player")
onready var menu = $"."

signal closedMenu

var crosshairs = {
	"crosshair1" : preload("res://crosshairs/crosshair001.png"),
	"crosshair2" : preload("res://crosshairs/crosshair026.png"),
	"crosshair3" : preload("res://crosshairs/crosshair065.png"),
	"crosshair4" : preload("res://crosshairs/crosshair066.png")
}

func _ready():
	menu.visible = false

func _on_Button_pressed():
	player.set_crosshair(crosshairs.crosshair1)

func _on_Button2_pressed():
	player.set_crosshair(crosshairs.crosshair2)

func _on_Button3_presson_Button3_pressed():
	player.set_crosshair(crosshairs.crosshair3)

func _on_Button4_pressed():
	player.set_crosshair(crosshairs.crosshair4)	

func _on_Button5_pressed():
	emit_signal("closedMenu", "playing")

func _on_Button6_pressed():
	get_tree().quit()
