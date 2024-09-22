class_name TeethManager extends Node

@onready var upper_tooth = %tooth_upper
@onready var lower_tooth = %tooth_lower
@onready var lower = $"../teeth/lower"
@onready var path_3d = $"../teeth/lower/Path3D/PathFollow3D"

var upper_initial_position: Vector3
var lower_initial_position: Vector3
var progress_initial_value: float 

func _ready():
	upper_initial_position = upper_tooth.position
	lower_initial_position = lower_tooth.position
	progress_initial_value = path_3d.progress_ratio

func ReinitializePosition():
	upper_tooth.position = upper_initial_position
	lower_tooth.position = lower_initial_position
	path_3d.progress_ratio = progress_initial_value

func StartMoving():
	lower.StartMoving()

func StopMoving():
	lower.StopMoving()
