extends Node

export (Texture) var map
export (PackedScene) var block

const unit_size = 10

var img

func _ready():
	img = map.get_data()
	img.lock()
	
	for y in range(img.get_height()):
		for x in range(img.get_width()):
			var col = img.get_pixel(x,y)
			if col != Color("ffffff"):
				var new_block = block.instance()
				new_block.set_position(Vector2(x,y) * unit_size)
				add_child(new_block)
				
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
