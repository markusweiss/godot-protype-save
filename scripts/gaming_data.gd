extends Node


func _ready():
	$Anrede.text = "Hallo " + str(Global.player_name) + " Du bist ein/eine " + str(Global.player_id) + " und hast " + str(Global.player_food) + " Scheffel Nahrung"
	$Energy.text = "Es ist Runde " + str(Global.player_round) + " und Du hast " + str(Global.player_energy) + " Energie."


func _on_weiter_pressed():
	Global.player_round += 1
	Global.player_food += $FoodAnzahl.text.to_int()
	get_tree().change_scene_to_file("res://scenes/gaming_round.tscn")
