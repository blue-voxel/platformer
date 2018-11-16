extends Area2D

export (float) var topSpeed
export (float) var drag

var velocity = Vector2()
var screensize

func _ready():
	screensize = get_viewport_rect().size

	pass

func _process(delta):	
	velocity += inMap.move.normalized() * topSpeed * delta
	position += velocity * delta	
	
	velocity *= 1 - (drag * delta)
	if velocity.length_squared() < 5:
		velocity = Vector2()
	
	pass
# test change to see if git works (stephen035) #