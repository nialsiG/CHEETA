class_name UiManager extends Node

const enums = preload("res://Scenes/enums.gd")

@onready var teeth_manager = $"../teeth_manager"
@onready var food_manager = $"../food_manager"

func _on_start_button_pressed():
	teeth_manager.StartMoving()

func _on_stop_button_pressed():
	teeth_manager.StopMoving()

func _on_reset_button_pressed():
	teeth_manager.ReinitializePosition()

func _on_spawn_food_button_pressed():
	food_manager.GenerateFood(enums.size.S4)
