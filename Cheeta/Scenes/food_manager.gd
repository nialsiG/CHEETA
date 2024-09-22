class_name FoodManager extends Node

const enums = preload("res://Scenes/enums.gd")

@onready var food_prefab = load("res://Scenes/food_particle.tscn")

func GenerateFood(_size: enums.size):
	var food_instance = food_prefab.instantiate()
	food_instance.position = Vector3.ZERO
	food_instance.initial_size = _size
	add_child(food_instance)
