extends Control

@onready var buttons = $MarginContainer/AspectRatioContainer/GridContainer.get_children()

var current_player
const tictactoe = ["X", "O"]
const cell_X = "X"
const cell_O = "O"
const cell_zero = ""

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
	button.text = current_player
	#playing in turns, two players
	current_player = cell_X if current_player == cell_O else cell_O
	button.disabled = true
	
	
func reset_game():
	current_player = cell_X
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
