extends CharacterBody3D

const SPEED = 10.0

@onready var _neck: Node3D = $camera_neck
@onready var _camera: Camera3D = $camera_neck/Camera3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() && event.button_index == MOUSE_BUTTON_RIGHT && Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		elif event.is_released() && event.button_index == MOUSE_BUTTON_RIGHT && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseMotion && Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		_neck.rotate_y(-event.relative.x * 0.01)
		_camera.rotate_x(-event.relative.y * 0.01)
		_camera.rotation.x = clamp(_camera.rotation.x, -PI/6, PI/6)

func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = - direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
