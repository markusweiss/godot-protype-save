extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var fightValue = Global.worker + Global.tools["bow"] * 4 + Global.tools["axe"] * 2 + Global.tools["pick"] * 1 + Global.worker + Global.tools["bow"] * 2 + Global.tools["axe"] * 2 + Global.tools["pick"] * 1
	print (fightValue)
	if (fightValue >= 79):
		Global.player_fight = "gewonnen"
	else:
		Global.player_fight = "verloren"
	
	$Fight.text = "Es ist Runde " + str(Global.player_round) + " es kommt zum Kampf.\nDu hast " + Global.player_fight


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
