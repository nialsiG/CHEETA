class_name UiManager extends Node

const enums = preload("res://Scenes/enums.gd")

@onready var teeth_manager = $"../teeth_manager"
@onready var food_manager = $"../food_manager"
@onready var particle_count = $"../CanvasLayer/ColorRect/MarginContainer/VBoxContainer/food_particle_count"

func _ready():
	food_manager.SetFoodParticleCount.connect(SetParticleCount)
	SetParticleCount(0)

func _on_start_button_pressed():
	teeth_manager.StartMoving()

func _on_stop_button_pressed():
	teeth_manager.StopMoving()

func _on_reset_button_pressed():
	teeth_manager.ReinitializePosition()

func _on_spawn_food_button_pressed():
	food_manager.GenerateFood(enums.size.S4)

func _on_reset_food_button_pressed():
	food_manager.ResetFood()

func SetParticleCount(count: int):
	particle_count.text = str(count)
