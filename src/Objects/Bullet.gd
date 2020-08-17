extends RigidBody2D

onready var anim = $AnimationPlayer

func destroy():
	anim.play("FadeOut")

func _on_Timer_timeout():
	
		destroy()
