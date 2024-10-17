extends Node3D

@onready var speed = 5
@onready var path = $Path3D/PathFollow3D
@onready var canMove: bool = false

func _physics_process(delta):
	if(canMove):
		Move(delta)

func Move(delta):
	path.progress += speed * delta

func StartMoving():
	canMove = true

func StopMoving():
	canMove = false
