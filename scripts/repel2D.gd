extends Area2D
#current class structure of this script is a bit whack, it needs to broken down to force_field>repel>foot or something similar
export (float) var radius = 7 setget _set_radius
export (float, 0, 360, 1) var angle = 70 setget _set_angle
export (float, 0, 360, 1) var normal = 0 setget _set_normal # not yet implemented
export (int, 0, 128) var resolution = 11 setget _set_resolution

var force = Vector2()

func _set_radius(f):
	radius = f
	pass
func _set_angle(f):
	angle = f
	pass
func _set_normal(f):
	normal = f
	pass
func _set_resolution(i):
	resolution = i
	pass

func get_points():
	var out = []
	for i in range(resolution / 2):
		var prog = (2 * (i+1) - (resolution - 1) % 2) / float(resolution - 1)
		var a = deg2rad(normal + angle/2 * prog)
		var point = Vector2(sin(a), cos(a)) * radius
		out.append(point)
		point.x *= -1
		out.append(point)
	
	if resolution % 2 != 0:
		out.append(Vector2(0, radius))
	return out

func get_space_state():
	return get_world_2d().direct_space_state

func ray_from_centre(endpoint, space_state=get_space_state()):
	return space_state.intersect_ray(
		global_position,
		global_position + endpoint,
		[],
		collision_layer)

func get_footing():
	var space_state = get_world_2d().direct_space_state #documentation recommends calling this function continually but I'm not sure why
	for v in get_points():
		var ray = ray_from_centre(v, space_state)
		if 'position' in ray: return ray
