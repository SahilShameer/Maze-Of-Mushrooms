extends Position2D

const BULLET_VELOCITY = 500
const BULLET = preload("res://src/Objects/Bullet.tscn")

onready var shoot_fx = $FX
onready var timer = $Timer

func shoot(direction =1):
	if not timer.is_stopped():
		return false
	var bullet = BULLET.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * BULLET_VELOCITY , 0)
	
	bullet.set_as_toplevel(true)
	add_child(bullet)
	shoot_fx.play()
	return true
