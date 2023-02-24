extends Spatial

var distance = 10000
var acertos = 0
var tentativas = 0

signal targetCount

func fire():
	var space_state = get_world().get_direct_space_state()
	var our_position = global_transform.origin
	var result = space_state.intersect_ray(our_position, our_position - global_transform.basis.z * distance,
	[], 2, true, true)
	
	print(result)
	
	if result and result.collider.has_method("die"):
		acertos += 1
		result.collider.die()
		
	tentativas += 1
	emit_signal("targetCount", acertos, tentativas)
	
