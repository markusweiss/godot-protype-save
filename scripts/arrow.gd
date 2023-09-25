extends Area2D

var startPosition
var projectileSpeed = 100
var targetNode: Node2D = null

func _ready():
	startPosition = self.global_position
	print(startPosition)
	shoot()
	
func _process(delta):
	if targetNode != null:
		var direction = (targetNode.global_position - self.global_position).normalized()
		self.global_position += direction * projectileSpeed * delta

func shoot():
	var attackers = get_tree().get_nodes_in_group("attacker")
	if attackers.size() > 0:
		targetNode = attackers[0] as Node2D

func _on_body_entered(body):
	if body.is_in_group("attacker"):
		print("kill")
		queue_free()
