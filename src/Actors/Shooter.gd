extends StaticBody2D

onready var gun = $"Enemy2(Shooter)/Gun"
onready var shoot = $shoot


func _on_Timer_timeout():
	var is_shooting = true
	shoot.play()
	is_shooting = gun.shoot()
