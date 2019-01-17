tool
extends 'res://scripts/repel2D.gd'

const col = Color('ff0000')

func _draw():
	if not Engine.editor_hint:
		for v in get_points():
			draw_line(position, position+v, col)

	pass