extends RigidBody

signal targetDestroyed

func die():
	Globals.emit_signal("targetDestroyed")
	queue_free()
