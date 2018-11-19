extends Camera2D
#Jordan: this script is supposed to lock on to the target and stay centred 
#at all times, there is a bit of what machinists would call 'backlash'
#in its current implementation, the source of this is a mystery
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
