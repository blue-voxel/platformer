extends Camera2D

export (NodePath) var trgt

func _ready():
	print (trgt)
	trgt = get_node(trgt) #convert NodePath to Node
	print (trgt)
	global_position = trgt.global_position
	pass

func _process(delta):
	global_position = trgt.global_position
	pass
