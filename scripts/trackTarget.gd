extends Camera2D
#Jordan: this script is supposed to lock on to the target and stay centred 
#at all times, there is a bit of what machinists would call 'backlash'
#in its current implementation, the source of this is a mystery

export (NodePath) var trgt

var is_target_physical = false #the target should be tracked using the same function that is used to move the target or jittering occurs, I had the same problem in my unity days
var time = 0.0
func _ready():
	trgt = get_node(trgt) #convert NodePath to Node
	is_target_physical = trgt is KinematicBody2D or trgt is RigidBody2D #assuming no one would want to track a StaticBody2D
	pass

func _process(delta):
	if not is_target_physical:
		global_position = trgt.global_position
	pass

func _physics_process(delta):
	if is_target_physical:
		global_position = trgt.global_position
	pass
