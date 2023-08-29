extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anrede.text = "Hallo " + str(Global.player_name) + " Du bist ein/eine " + str(Global.player_id) 


func _on_button_pressed():
	Global.save_data()
