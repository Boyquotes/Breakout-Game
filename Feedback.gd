extends Node2D


export(String) var win_text = "You win!"
export(String) var lose_text = "You're Terrible"

func _ready():
	$Text.hide()
	$Restart.hide()

func _on_Score_win():
	$Text.text = win_text
	$Text.show()
	$Restart.show()

func _on_Ball_lost():
	$Text.text = lose_text
	$Text.show()
	$Restart.show()

func _on_Restart_button_up():
	get_tree().reload_current_scene()
