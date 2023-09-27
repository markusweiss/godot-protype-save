extends CharacterBody2D

const MAX_SPEED = 70

func _ready():
	self.global_position = Vector2(600, 180)

func _process(delta):
	var direction = get_direction_to_defender()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_direction_to_defender():
	var defender_node = get_tree().get_first_node_in_group("defender") as Node2D

	if defender_node != null:
		return (defender_node.global_position - global_position).normalized()
	else:
		# Handle the case when there's no defender
		return Vector2.ZERO


func _on_area_2d_area_entered(area):
	queue_free()
