extends KinematicBody2D

#Surface move is intended to be 2d platformer controller that is direction/gravity agnostic
#movement direction is detirmind by the colion normal of the KInematic body (ie the direction of the floor)
#and moevemnt speed is determined by the friction on that surface and the force acting on the body towards that surface
#implemnted properly it should provide an elegant mathematical solution for walking, sliding wallrunning, walljumping, etc.

const FORCES = Vector2(0,695) #this should be inherited or read from utility in future iterations

export (NodePath) var indicator
export (float) var topSpeed = 120 #maximum speed (decimeters?)
export (float) var damping = 1 #time (seconds) to reach top speed

const CUTOFF = 0.1 #acceptable threshold to target speed
var velocity = Vector2()
var walk = 0.0
var time = 0
var slides = 0

func _ready():
	indicator = get_node(indicator)

func _physics_process(delta):
	velocity += FORCES * delta

	var normal = Vector2()
	slides += get_slide_count()
	time += 1
	if 31 < time:
		print (slides)
		slides = 0
		time = 0
	
	for i in range(get_slide_count()):
		normal += velocity * get_slide_collision(i).normal
	normal = normal.normalized()
	indicator.look_at(to_global(normal))

	#the following has been adapted from simpleMove2D.gd
	var walkTarg = inMap.move.x * topSpeed
	if 0 < damping:
		var dWalk = walkTarg - velocity.x
		if CUTOFF < abs(dWalk): 
			velocity.x += sign(dWalk) * topSpeed * delta / damping
		else:
			velocity.x = walkTarg
	else:
		velocity.x = walkTarg
	#not that movement is implemented directly rather than with forces. This allows for more direct control and responsiveness but may need to be changed if compaitibility issues mount
	velocity =  move_and_slide(velocity)
	pass

#TODO figure out why fall and move feel so sluggish
#TODO add jump
#TODO add multidirectionality to walk and jump
#TODO built curved map to test multidirectionality