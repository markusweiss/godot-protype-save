extends Node


var player_name: String = "<gd_name>"
var player_id: String= "<gd_id>"

var player_food: int = 8
var player_energy: int = 10
var player_round: int = 1

var test: int = 1

const SAVEGAME: String = "res://savegame.json"


func save():
	print("save")
	var save_dict = {
		"player_name" : player_name,
		"player_id" : player_id,
		"player_food" : player_food,
		"player_energy" : player_energy,
		"player_round" : player_round
	}
	return save_dict

func save_data():
	print ("data")
	var save_game = FileAccess.open(SAVEGAME, FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save_game.store_line(json_string)
	

func load_data():
	if not FileAccess.file_exists(SAVEGAME):
		return
	
	var save_game = FileAccess.open(SAVEGAME, FileAccess.READ)	
	
	while  save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		player_name = node_data.player_name
		player_id = node_data.player_id
		player_food = node_data.player_food
		player_energy = node_data.player_energy
		player_round = node_data.player_round
		
		print(node_data)
