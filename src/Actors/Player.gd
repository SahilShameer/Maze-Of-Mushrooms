extends KinematicBody2D

export var speed = Vector2(300, 100)
export var gravity = 4000

var velocity = Vector2.ZERO


func _physics_process(delta):
	var is_jump_activated = Input.is_action_just_pressed("ui_up") and velocity.y < 0.0
	var direction = get_direction()
	velocity = calculate_move_velocity(velocity,direction,speed,is_jump_activated)
	velocity = move_and_slide(velocity , Vector2.UP)
	
	
	
	
func get_direction():
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),-1.0 if Input.is_action_just_pressed("ui_up")
		 and is_on_floor() else 1.0
	)
	
	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interepted : bool
	) -> Vector2:
	var velocity = linear_velocity
	velocity.x = speed.x * direction.x
	velocity.y = gravity * get_physics_process_delta_time()
	if direction.y == -1:
		velocity.y = speed.y * direction.y
	if is_jump_interepted:
		velocity.y = 0
	return velocity
