extends Node


func _ready():
	$Anrede.text = "Hallo " + str(Global.player_name) + " Du bist ein/eine " + str(Global.player_id) + " und hast " + str(Global.player_food) + " Scheffel Nahrung"
	$Energy.text = "Es ist Runde " + str(Global.player_round) + " und Du hast " + str(Global.worker) + " Arbeiter. Sie kosten " + str(Global.worker * 5) + " Nahrung"
	

func _on_weiter_pressed():
	Global.player_round += 1
	
	randomize()
	var randomErnte = randi_range(1,5)
	var factorMapping = {
		1: 0.5,
		2: 1.0,
		3: 1.5,
		4: 2.0,
		5: 2.5
		}
	
	Global.weather = randomErnte
	Global.worker += $ArbeiterAnzahl.value
	
	Global.player_food -= $FoodAnzahl.value * 0.75
	Global.player_food -= $ArbeiterAnzahl.value * (20 + 5)
	
	var assignedFactor = factorMapping[randomErnte]
	
	print ($FoodAnzahl.value)
	print (assignedFactor)
	print ($FoodAnzahl.value * assignedFactor)
	Global.player_food += $FoodAnzahl.value * assignedFactor * Global.worker
	get_tree().change_scene_to_file("res://scenes/gaming_round.tscn")
