extends KinematicBody2D

export var speed = Vector2(30, 100)
export var gravity = 4000

var velocity = Vector2.ZERO

onready var die =$die
onready var death = $AnimationPlayer

const FLOOR = Vector2.UP


func _ready() ->void:
	
	velocity.x = -speed.x

func _on_Bullet_Detector_body_entered(body):
	
	
	$"Bullet Detector/CollisionShape2D".disabled = true
	die()


func _physics_process(delta: float) -> void:
	velocity.y = gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity , FLOOR).y

func die():
	death.play("die")
	
	

