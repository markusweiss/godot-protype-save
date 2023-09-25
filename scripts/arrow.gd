extends Area2D


const MAX_SPEED = 200
var startPosition
var projectileSpeed = 2

func _ready():
	startPosition = self.position.x
	print(startPosition)
	
func _process(delta):	
	await get_tree().create_timer(1.0).timeout
	shoot()

func shoot():
	var attacker_node = get_tree().get_first_node_in_group("attacker") as Node2D
	if attacker_node != null:
		self.position.x += projectileSpeed
		print(attacker_node.global_position.x)
