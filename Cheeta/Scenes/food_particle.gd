class_name FoodParticle extends CharacterBody3D

const enums = preload("res://Scenes/enums.gd")

@export var initial_size: enums.size = enums.size.S5
@export var size_factor: float = 0.1

@onready var sphere_mesh: CSGSphere3D = $CSGSphere3D
@onready var collision_shape: CollisionShape3D = $CollisionShape3D
@onready var health: float
@onready var current_size = initial_size

func _ready():
	UpdateSize(initial_size)

func _physics_process(delta):
	# Add the gravity.
	velocity += get_gravity() * delta
	move_and_slide()

func UpdateSize(_size: enums.size):
	var radius: float
	match _size:
		enums.size.S1: 
			radius = 1
			health = 100
		enums.size.S2: 
			radius = 2
			health = 100
		enums.size.S3: 
			radius = 3
			health = 100
		enums.size.S4: 
			radius = 4
			health = 100
		enums.size.S5: 
			radius = 5
			health = 100
		_: 
			radius = 1
			health = 100
	sphere_mesh.radius = radius * size_factor
	collision_shape.shape.radius = radius * size_factor

func TakeDamage(amount: float):
	health -= amount
	if health < 0:
		current_size = current_size - 1 % enums.size.size()
		print(current_size)
		UpdateSize(current_size)
