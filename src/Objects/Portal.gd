tool
extends Area2D



onready var anim = $AnimationPlayer


export var Next_Scene : PackedScene

func _ready():
	GameData.connect("key",self, "key_ready")
	
func key_ready():
	$AnimationPlayer.play("Unloack")

func _on_area_entered(area):
	if GameData.key == 1:
		GameData.dam+= 1
		teleport()
		GameData.health = 0
		GameData.key = 0

func _get_configuration_warning() -> String:
	return " The Next Scene Should Not Be empty" if not Next_Scene else ""

func teleport():
	anim.play("tp")
	yield(anim,"animation_finished")
	get_tree().change_scene_to(Next_Scene)


