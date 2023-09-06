extends Node


var player_name: String = "<gd_name>"
var player_id: String= "<gd_id>"

var player_food: int = 10
var player_round: int = 1

var worker: int = 1

var weather: int = 1

const SAVEGAME: String = "res://savegame.json"

var tools = {
	"axe" : 0,
	"bow" : 0,
	"pick" : 0
}


func save():
	print("save")
	var save_dict = {
		"player_name" : player_name,
		"player_id" : player_id,
		"player_food" : player_food,
		"player_round" : player_round,
		"worker" : worker,
		"tools" : tools
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
		player_round = node_data.player_round
		worker = node_data.worker
		tools = node_data.tools
		
		print(node_data)
