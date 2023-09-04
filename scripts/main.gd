extends Node


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://scenes/player_data.tscn")


func _on_load_game_pressed():
	Global.load_data()
	get_tree().change_scene_to_file("res://scenes/gaming_data.tscn")
