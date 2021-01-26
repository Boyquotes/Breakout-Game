extends KinematicBody2D


signal hit_block
signal lost

const BLOCK_LAYER = 2147483650
const PADDLE_LAYER = 2147483649
const LOST_Y = 768

export(Vector2) var initial_direction = Vector2(1, -1)
export(int) var initial_speed = 200
export(int) var bounce_increase = 10

var direction : Vector2 = Vector2(0, 0) # should always be normalized
var speed : int = 0


func _physics_process(delta):
	# separating speed and direction will allow better control
	var collision_info = move_and_collide(direction * speed * delta)
	
	# handles bouncing
	if collision_info:
		
		if collision_info.collider.get("collision_layer") == BLOCK_LAYER:
			# bounce and free the block
			direction = direction.bounce(collision_info.normal)
			speed += bounce_increase
			collision_info.collider.free()
			emit_signal("hit_block")
		
		elif collision_info.collider.get("collision_layer") == PADDLE_LAYER:
			direction = Vector2((position - get_tree().get_nodes_in_group("paddle")[0].position).x * 0.25, -1).normalized()
		
		else:
			direction = direction.bounce(collision_info.normal)
	
	# frees ball if out of play area
	# has to be at end because all code after freeing will cause error
	if position.y > LOST_Y:
		emit_signal("lost")
		free()
	

func _on_Timer_timeout():
	# sets initial speed and direction after timer is done
	direction = initial_direction.normalized()
	speed = initial_speed
	
