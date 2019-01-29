extends Node

const collision_layers = {
    'static' : 0,
    'firendly' : 1,
    'enemy' : 2,
    'attack' : 3
}

const layer_count = 20

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

func cutoff(f, bounds_0 = 0, bounds_1 = 1):
    if f < bounds_0:
        f = bounds_0
    if bounds_1 < f:
        f = bounds_1
    return f

func absolutise(f):
    f = (f + 1) / 2
    f = cutoff(f)
    return f

func absolutise_vec(vector):
    vector.x = absolutise(vector.x)
    vector.y = absolutise(vector.y)
    #if vector.type == vector3: etc.

func bodies_share_layer(from, to, layer = null):
    if layer:
        var i = layer_of(layer)
        return (from.get_collision_layer_bit(i) and to.get_collision_mask_bit(i))
    for i in range(layer_count):
        if  (from.get_collision_layer_bit(i) and to.get_collision_mask_bit(i)):
            print (true)
            return true
    return false

