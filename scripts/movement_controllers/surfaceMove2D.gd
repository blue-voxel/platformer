extends KinematicBody2D

#Surface move is intended to be 2d platformer controller that is direction/gravity agnostic
#movement direction is detirmined by the collision normal of the KInematic body (ie the direction of the floor)
#and movement speed is determined by the friction on that surface and the force acting on the body towards that surface
#implemented properly it should provide an elegant mathematical solution for walking, sliding wallrunning, walljumping, etc.

const FORCES = Vector2(0,100) #this should be inherited or read from utility in future iterations

export (float) var topSpeed = 120 #maximum speed (decimeters?)
export (float) var damping = 1 #time (seconds) to reach top speed
export (float) var repulsion = 400

const CUTOFF = 0.1 #acceptable threshold to target speed
var velocity = Vector2()
var walk = 0.0	
	
func _physics_process(delta):
	velocity += FORCES * delta
	var foot_psh
	var foot_dir

	var footing = $foot.get_footing()
	if footing:
		var foot_pos = $foot.global_position - footing['position']
		var foot_dst = foot_pos.length() / $foot.radius
	
		foot_psh = (1 - foot_dst) * repulsion * inMap.move_y
		velocity.y -= foot_psh * delta

		var walkTarg = inMap.move_x * topSpeed
		if 0 < damping:
			var dWalk = walkTarg - velocity.x
			if CUTOFF < abs(dWalk): 
				velocity.x += sign(dWalk) * topSpeed * delta / damping
			else:
				velocity.x = walkTarg
		else:
			velocity.x = walkTarg
	#note that movement is implemented directly rather than with forces. This allows for more direct control and responsiveness but may need to be changed if compaitibility issues mount
	velocity = move_and_slide(velocity)
	pass
