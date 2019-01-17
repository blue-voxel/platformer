tool
extends 'res://scripts/repel2D.gd'

const col = Color(1,0,0,0.3)

func redraw():
	if Engine.editor_hint:
		update()

func _set_radius(f): 
	._set_radius(f)
	redraw()
func _set_angle(f):
	._set_angle(f)
	redraw()
func _set_normal(f): 
	._set_normal(f)
	redraw()
func _set_resolution(i):
	._set_resolution(i)
	redraw()

func _draw():
	if Engine.editor_hint:
		for v in get_points():
			draw_line(Vector2(0,0), v, col)
	pass

func _ready():
	pass

func _physics_process(delta):
	pass