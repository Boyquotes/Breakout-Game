extends Label


signal win

export(int) var total_blocks = 56

var score = 0


func _on_Ball_hit_block():
	score += 1
	self.text = String(score)
	if score == total_blocks:
		emit_signal("win")
