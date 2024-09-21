extends Node3D


@onready var speed = 5.0
@onready var path = $Path3D/PathFollow3D

func _physics_process(delta):
	path.progress += speed * delta
