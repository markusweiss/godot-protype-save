extends CharacterBody2D

const MAX_SPEED = 70

func _process(delta):
	var direction = get_direction_to_defender()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_direction_to_defender():
	var defender_node = get_tree().get_first_node_in_group("defender") as Node2D


	if defender_node != null:
		#print(global_position.x)
		if global_position.x >= 260:
			return (defender_node.global_position - global_position).normalized()
		else:
			# Handle the case when there's an defender but it's out of range
			return Vector2.ZERO
	else:
		# Handle the case when there's no defender
		return Vector2.ZERO	


