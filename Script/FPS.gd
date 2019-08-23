extends KinematicBody
 
const MOVE_SPEED = 4
const MOUSE_SENS = 0.5
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
 
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x
 
func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().quit()
	pass
 
func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forward"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backward"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_vec * MOVE_SPEED * delta)
 