extends Node2D


export(String) var win_text = "You win!"
export(String) var lose_text = "You're Terrible"

func _ready():
	$Poop.hide()
	$Restart.hide()

func _on_Score_win():
	$Poop.text = win_text
	$Poop.show()
	$Restart.show()

func _on_Ball_lost():
	$Poop.text = lose_text
	$Poop.show()
	$Restart.show()

func _on_Restart_button_up():
	get_tree().reload_current_scene()
