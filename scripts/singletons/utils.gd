extends Node

func normalise_deg(angle):
    if 0 < angle:
        return 360 - angle
    return -angle

func denormalise_deg(angle):
    if 180 < angle:
        return 360 - angle
    else:
        return -angle

func layer_of(name):
    return collision_layers[name]

func bodies_share_layer(from, to, layer = null):
    if layer:
        var i = layer_of(layer)
        return (from.get_collision_layer_bit(i) and to.get_collision_mask_bit(i))
    for i in range(layer_count):
        if  (from.get_collision_layer_bit(i) and to.get_collision_mask_bit(i)):
            print (true)
            return true
    return false

