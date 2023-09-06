extends Node

var wetter = {
	1: "schlecht.",
	2: "normal.",
	3: "sehr sonnig.",
	4: "richtig gut.",
	5: "der Knaller."
}

func _ready():
		$Ergebnis.text = "Das Wetter war " + wetter[Global.weather] + "\n\nEs ist Runde " + str(Global.player_round) + " und Du hast jetzt " + str(Global.player_food) + " Scheffel Nahrung und " + str(Global.worker) + " Arbeiter.\n\nDu hast Axt:" + str(Global.tools.axe) + " \nDu hast Bogen:" + str(Global.tools.bow) + " \nDu hast Picke:" + str(Global.tools.pick)


func _on_save_button_pressed():
	Global.save_data()
	get_tree().change_scene_to_file("res://scenes/gaming_data.tscn")
