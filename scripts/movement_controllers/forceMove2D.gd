extends Area2D

export (float) var topSpeed
export (float) var drag
var velocity = Vector2()
var acceleration


func _ready():
	screensize = get_viewport_rect().size
	if fastMode:
		speedSquared = topSpeed * topSpeed
	else:
		acceleration = 

	pass

func _process(delta):
	var dvelocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		dvelocity.x += 1
	if Input.is_action_pressed('ui_left'):
		dvelocity.x -= 1
	if Input.is_action_pressed('ui_up'):
		dvelocity.y -= 1
	if Input.is_action_pressed('ui_down'):
		dvelocity.y += 1
	
	velocity += dvelocity.normalized() * speed * delta
	position += velocity * delta	
	
	velocity *= 1 - (drag * delta)
	if velocity.length_squared() < 5:
		velocity = Vector2()
	
	pass
