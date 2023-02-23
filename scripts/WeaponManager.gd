extends Spatial

onready var weapons = $Weapons.get_children()
onready var cur_weapon = $Weapons/Gun

var fire_point : Spatial

func init(_fire_point : Spatial):
	fire_point = _fire_point	
	for weapon in weapons:
		if weapon.has_method("init"):
			weapon.init(fire_point)

func wpAttack(attack_input_just_pressed : bool):
	if !attack_input_just_pressed:
		return

	if(cur_weapon.has_method("attack")):
		cur_weapon.attack(attack_input_just_pressed)
