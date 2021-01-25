extends Label


var score = 0


func _on_Ball_hit_block():
	score += 1
	self.text = String(score)
