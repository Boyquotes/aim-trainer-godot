extends Control

onready var hitrateLabel = $Hitrate

func set_hitrate(hitrate: float):
	hitrateLabel.text = "Hitrate: " + str(hitrate) + '%'
