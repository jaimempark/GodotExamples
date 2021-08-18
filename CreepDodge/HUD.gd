extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout") # wait for MessageTimer to count down, show game over for 2 seconds
	$Message.text = "Dodge the \nCreeps!" # then return to title page, 1 second later play button becomes visible
	$Message.show()
	$Menu.play()
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.play()

func _on_StartButton_pressed():
	$StartButton.hide()
	$Menu.stop()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
