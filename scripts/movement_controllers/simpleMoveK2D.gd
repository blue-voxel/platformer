extends Area2D

export (float) var topSpeed = 50 #maximum speed (decimeters?)
export (float) var damping = 1 #time (seconds) to reach top speed

var cutoff = 0.1 #acceptable threshold to target speed
var velocity = Vector2()

func _ready():
	pass

func _process(delta):
	var target = inMap.move * topSpeed
	if 0 < damping:
		var dvelocity = target - velocity #difference between target velocity and current velocity
		if cutoff < dvelocity.length_squared(): 
			velocity += dvelocity.normalized() * topSpeed * delta / damping #normalized() ensures that acceleration is constant (not proportional to distance to target)
		else:
			velocity = target
	else:
		velocity = target
	
	position += velocity * delta
	pass
