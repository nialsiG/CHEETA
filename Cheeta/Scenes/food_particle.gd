class_name FoodParticle extends CharacterBody3D

const enums = preload("res://Scenes/enums.gd")
signal CopyFood

@export var initial_size: enums.size = enums.size.S5
@export var size_factor: float = 0.1

@onready var sphere_mesh: CSGSphere3D = $CSGSphere3D
@onready var collision_shape: CollisionShape3D = $CollisionShape3D
@onready var current_size = initial_size

@onready var health: int
@onready var label: Label = $sticker/SubViewport/Label

func _ready():
	UpdateSize(initial_size)

func _physics_process(delta):
	# Add the gravity.
	velocity += get_gravity() * delta
	move_and_slide()
	# Detect collisions
	var collisions = get_slide_collision_count()
	if (collisions > 2):
		TakeDamage(collisions)

func UpdateSize(_size: enums.size):
	print("current size = ", current_size)
	var radius: float
	match _size:
		enums.size.S1: 
			radius = 1
			health = 1000
		enums.size.S2: 
			radius = 2
			health = 1000
		enums.size.S3: 
			radius = 3
			health = 1000
		enums.size.S4: 
			radius = 4
			health = 1000
		enums.size.S5: 
			radius = 5
			health = 1000
		_: 
			radius = 1
			health = 1000
	sphere_mesh.radius = radius * size_factor
	collision_shape.shape.radius = radius * size_factor
	UpdateLabel()

func TakeDamage(amount: int):
	health -= amount
	UpdateLabel()
	if health < 0:
		current_size -= 1
		if current_size < 0:
			queue_free()
		else:
			UpdateSize(current_size)
			CopyFood.emit(current_size, position)

func UpdateLabel():
	label.text = str(health)
