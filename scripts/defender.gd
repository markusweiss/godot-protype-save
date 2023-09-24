extends CharacterBody2D


const MAX_SPEED = 100


func _process(delta):
	var direction = get_direction_to_attacker()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_direction_to_attacker():
	var attacker_node = get_tree().get_first_node_in_group("attacker") as Node2D
	#print(global_position)
	
	if attacker_node != null:
		if(global_position.x <= 300):
			return (attacker_node.global_position - global_position).normalized()
		return Vector2.ZERO


