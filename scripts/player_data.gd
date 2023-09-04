extends Node2D


func _on_weiter_pressed():
	Global.player_name = $playername.text
	Global.player_id = $playerid.text
	get_tree().change_scene_to_file("res://scenes/gaming_data.tscn")
