extends Area2D

var startPosition
var projectileSpeed = 100
var targetNode: Node2D = null
var timePassed = 0.0
var maxFlightTime = 2.0

func _ready():
	startPosition = self.global_position
	print(startPosition)
	shoot()
	
func _process(delta):
	if targetNode != null:
		timePassed += delta
		
		# Berechne die Position des Pfeils auf der Parabel
		var t = timePassed / maxFlightTime
		var yOffset = -4.0  # Die Vertikale Verschiebung für die Parabel
		var x = lerp(startPosition.x, targetNode.global_position.x, t)
		var y = lerp(startPosition.y, targetNode.global_position.y + yOffset, t)
		self.global_position = Vector2(x, y)
		

func shoot():
	var attackers = get_tree().get_nodes_in_group("attacker")
	if attackers.size() > 0:
		targetNode = attackers[0] as Node2D

func _on_body_entered(body):
	if body.is_in_group("attacker"):
		print("kill")
		queue_free()

