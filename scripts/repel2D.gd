extends Area2D

export (float) var repulsion = 20

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	print (bodies)
	pass
