extends KinematicBody2D

#Surface move is intended to be 2d platformer controller that is direction/gravity agnostic
#movement direction is detirmind by the colion normal of the KInematic body (ie the direction of the floor)
#and moevemnt speed is determined by the friction on that surface and the force acting on the body towards that surface
#implemnted properly it should provide an elegant mathematical solution for walking, sliding wallrunning, walljumping, etc.
const FORCES = Vector2(0,-98.1)


func _physics_process(delta):
	
	pass