extends RigidBody2D

func destroy():
	queue_free()










func _on_Timer_timeout():
	destroy()
