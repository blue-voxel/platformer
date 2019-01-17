extends Node2D

export (float) var radius = 10
export (float, 0, 360, 1) var angle = 60
export (float, 0, 360, 1) var normal = 0
export (int) var resolution = 16

func get_points():
	var out = []
	for i in range(resolution):
		var a = deg2rad(normal + angle * float(i) / float(resolution))
		var point = Vector2(sin(a), cos(a)) * radius
		out.append(point)
		point.x *= -1
		out.append(point)
	return out

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):

	pass
