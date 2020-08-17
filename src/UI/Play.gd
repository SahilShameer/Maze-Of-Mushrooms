tool
extends TextureButton

export(String, FILE) var Next_Scene: = ""




func _on_button_up():
	get_tree().change_scene(Next_Scene)
	

func _get_configuration_warning() -> String:
	return "Next Scene Is Not Set" if Next_Scene == ""  else ""
