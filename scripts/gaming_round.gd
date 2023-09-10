extends Node

var wetter = {
	1: "schlecht.",
	2: "normal.",
	3: "sehr sonnig.",
	4: "richtig gut.",
	5: "der Knaller."
}

func _ready():
		$Ergebnis.text = "Das Wetter war " + wetter[Global.weather] + "\n\nEs ist Runde " + str(Global.player_round) + " und Du hast jetzt " + str(Global.player_food) + " Scheffel Nahrung und " + str(Global.worker) + " Arbeiter."
		
		$Tools.text = "\n\nDu hast Axt: " + str(Global.tools.axe) + " \nDu hast Bogen: " + str(Global.tools.bow) + " \nDu hast Picke: " + str(Global.tools.pick)
		
		$Defence.text = "\n\nDu hast Verteidigung: " + str(Global.worker + Global.tools["bow"] * 2 + Global.tools["axe"] * 2 + Global.tools["pick"] * 1)

		$Attack.text = "\n\nDu hast Angriff: " + str(Global.worker + Global.tools["bow"] * 4 + Global.tools["axe"] * 2 + Global.tools["pick"] * 1)
		
		if(Global.player_round >= 10):
			var fightValue = Global.worker + Global.tools["bow"] * 4 + Global.tools["axe"] * 2 + Global.tools["pick"] * 1 + Global.worker + Global.tools["bow"] * 2 + Global.tools["axe"] * 2 + Global.tools["pick"] * 1
			print (fightValue)
			if (fightValue >= 79):
				Global.player_fight = "gewonnen"
			else:
				Global.player_fight = "verloren"
			
			
			$Fight.text = "Es ist Runde " + str(Global.player_round) + " es kommt zum Kampf.\nDu hast " + Global.player_fight	
		
func _on_save_button_pressed():
	Global.save_data()
	get_tree().change_scene_to_file("res://scenes/gaming_data.tscn")
