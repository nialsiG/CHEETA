class_name FoodParticle extends CharacterBody3D

# S5 > S4 > S3 > S2 > S1
enum size { S1, S2, S3, S4, S5 }

@export var initial_size: size = size.S5
@export var size_factor: float = 0.1

@onready var sphere_mesh: CSGSphere3D = $CSGSphere3D
@onready var collision_shape: CollisionShape3D = $CollisionShape3D

func _ready():
	UpdateSize(initial_size)

func _physics_process(delta):
	# Add the gravity.
	velocity += get_gravity() * delta
	move_and_slide()

func UpdateSize(_size: size):
	var radius: float
	match _size:
		size.S1: radius = 1
		size.S2: radius = 2
		size.S3: radius = 3
		size.S4: radius = 4
		size.S5: radius = 5
		_: radius = 1
	sphere_mesh.radius = radius * size_factor
	collision_shape.shape.radius = radius * size_factor
