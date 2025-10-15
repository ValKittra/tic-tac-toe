extends Control

@onready var buttons = $MarginContainer/AspectRatioContainer/GridContainer.get_children()

var player = cell_X
var computer_player 
var computer_button
const tictactoe = ["X", "O"]
const cell_X = "X"
const cell_O = "O"
const cell_zero = ""
var board = ["", "", "", "", "", "", "", "", ""]
var wins = [
	[0, 1, 2],  # top row
	[3, 4, 5],  # middle row
	[6, 7, 8],  # bottom row
	[0, 3, 6],  # left column
	[1, 4, 7],  # middle column
	[2, 5, 8],  # right column
	[0, 4, 8],  # diagonal
	[2, 4, 6]   # other diagonal
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(buttons)
	#buttons number
	var button_num = 0
	#as i understood bind here helps to connect the actual button and the index which is being pressed to call the func
	#otherwise the func would be called everytime any button is pressed
	for button in buttons:
		button.connect("pressed", _on_button_click.bind(button_num, button))
		button_num += 1
	reset_game()


func _on_button_click(button_num, button) -> void:
	#button.text = tictactoe.pick_random()
	button.text = player
	#playing in turns, two players
	button.disabled = true
	check_for_win()
	computer_play()
	

func computer_play():

	var available_buttons = []
	for b in buttons:
		if not b.disabled:
			available_buttons.append(b)

	if available_buttons.is_empty():
		return

	var computer_button = available_buttons.pick_random()
	computer_button.text = cell_O
	computer_button.disabled = true
		
func check_for_win():
	for combo in wins:
		if board[combo[0]] != "" and board[combo[0]] == board[combo[1]] and board[combo[1]] == board[combo[2]]:
			print("win")
			return true
	return false

func reset_game():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
