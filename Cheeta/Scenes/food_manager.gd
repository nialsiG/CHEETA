class_name FoodManager extends Node

signal SetFoodParticleCount

const enums = preload("res://Scenes/enums.gd")

@onready var food_prefab = load("res://Scenes/food_particle.tscn")
@onready var food_items: Array

func GenerateFood(_size: enums.size, _position: Vector3 = Vector3.ZERO):
	var food_instance = food_prefab.instantiate()
	food_instance.position = _position
	food_instance.initial_size = _size
	food_instance.CopyFood.connect(GenerateFood)
	add_child(food_instance)
	food_items.append(food_instance)
	SetFoodParticleCount.emit(food_items.size())

func ResetFood():
	food_items.clear()
	SetFoodParticleCount.emit(0)
