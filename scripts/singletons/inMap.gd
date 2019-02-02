#script must be added as a singleton in Project-Settings to function properly
extends Node 

var joypad = false

var move = Vector2()
var move_x = 0.0
var move_y = 0.0
var look = 0.0

func _process(delta):
	joypad = 0 < len(Input.get_connected_joypads())
	get_move()
	pass

func get_move():
	move = Vector2()
	move.x += float(Input.is_action_pressed('ui_right'))
	move.x -= float(Input.is_action_pressed('ui_left'))
	move.y += float(Input.is_action_pressed('ui_down'))
	move.y -= float(Input.is_action_pressed('ui_up'))
	
	if joypad:
		move.x += Input.get_joy_axis(0,0)
		move.y += Input.get_joy_axis(0,1)
	
	move_x = utils.cutoff(move.x, -1)
	move_y = utils.absolutise(move.y * -1)
	if 1 < move.length_squared():
		move = move.normalized()
	return move

func get_look(from = null, deg = false, pos = false):
	if joypad:
		look = Vector2( Input.get_joy_axis(0,2),Input.get_joy_axis(0,3)).angle()
	else:
		var view = get_viewport()
		var mouse = view.get_mouse_position() - view.get_visible_rect().size / 2
		if from: #not currently working
			look = mouse.angle_to(from)
		else:
			look = mouse.angle()
	if deg:	
		look = rad2deg(look)
		if pos:
			look = utils.normalise_deg(look)
	return look