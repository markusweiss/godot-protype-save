extends Area2D

var startPosition
var projectileSpeed = 100

func _ready():
	startPosition = self.global_position


func _process(delta):
	var attacker_node = get_tree().get_first_node_in_group("attacker") as Node2D
	if attacker_node != null:
		#print(attacker_node.global_position)
		#print(startPosition)
		var direction = (attacker_node.global_position - self.global_position).normalized()
		var new_position = self.global_position + direction * projectileSpeed * delta
		self.global_position = new_position
	else:
		return Vector2.ZERO

func _on_area_entered(area):
	queue_free()
