extends KinematicBody2D

export(int) var acceleration
export(int) var max_speed
export(float) var friction_percent

var motion : Vector2 = Vector2.ZERO

func _physics_process(delta):
	# input
	if Input.is_action_pressed("paddle_right"):
		motion.x = min(motion.x + acceleration, max_speed)
	elif Input.is_action_pressed("paddle_left"):
		motion.x = max(motion.x - acceleration, -max_speed)
	else:
		motion.x = lerp(motion.x, 0, friction_percent)
	
	# apply the motion
	move_and_slide(motion)
	
	pass
