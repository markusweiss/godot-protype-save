extends CharacterBody2D

const MAX_SPEED = 100

func _ready():
	while(true):
		await get_tree().create_timer(1.0).timeout
		spawnProjectile()
		


func _process(delta):
	var direction = get_direction_to_attacker()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_direction_to_attacker():
	var attacker_node = get_tree().get_first_node_in_group("attacker") as Node2D
	
	if attacker_node != null:
		if global_position.x <= 120:
			return (attacker_node.global_position - global_position).normalized()
		else:
			# Handle the case when there's an attacker but it's out of range
			return Vector2.ZERO
	else:
		# Handle the case when there's no attacker
		return Vector2.ZERO

func spawnProjectile():
	var projectile = preload("res://scenes/arrow.tscn").instantiate()
	projectile.position = self.position
	#get_parent().add_child(projectile)
	get_parent().call_deferred("add_child", projectile)
