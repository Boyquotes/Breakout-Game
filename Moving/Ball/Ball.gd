extends KinematicBody2D


signal hit_block

const BLOCK_LAYER = 2147483650

export(Vector2) var initial_speed = Vector2(100, -100)
export(float) var bounce_increase = 1.05

var motion : Vector2 = Vector2(0, 0)

func _physics_process(delta):
	var collision_info = move_and_collide(motion * delta)
	if collision_info:
		motion = motion.bounce(collision_info.normal)
		motion *= bounce_increase
		if collision_info.collider.get("collision_layer") == BLOCK_LAYER:
			collision_info.collider.free()
			emit_signal("hit_block")

func _on_Timer_timeout():
	motion = initial_speed
