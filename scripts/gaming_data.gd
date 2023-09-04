extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anrede.text = "Hallo " + str(Global.player_name) + " Du bist ein/eine " + str(Global.player_id) + " und hast " + str(Global.player_food) + " Scheffel Nahrung"
	$Energy.text = "Es ist Runde " + str(Global.player_round) + " und Du hast " + str(Global.player_energy) + " Energie."

func _on_button_pressed():
	Global.save_data()
