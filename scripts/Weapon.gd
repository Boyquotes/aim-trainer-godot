extends Spatial

onready var bulletEmitterBase : Spatial = $BulletEmitter
onready var bulletEmitter = $BulletEmitter.get_children()

var fire_point : Spatial

func init(_fire_point : Spatial):
	fire_point = _fire_point
	

func attack(attack_input_just_pressed : bool):
	var start_transform = bulletEmitterBase.global_transform
	bulletEmitterBase.global_transform = fire_point.global_transform
	for bullet_Emitter in bulletEmitter:
		bullet_Emitter.fire()
	bulletEmitterBase.global_transform =  start_transform
