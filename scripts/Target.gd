extends RigidBody

signal targetDestroyed

func die():
	SignalBus.emit_signal("targetDestroyed")
	queue_free()
