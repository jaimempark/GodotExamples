extends Node

export (PackedScene) var Ball

signal my_signal(value, other_value)

func _input(event):
	if event.is_action_pressed("click"):
		var new_ball = Ball.instance()
		new_ball.position = get_viewport().get_mouse_position()
		add_child(new_ball)
	emit_signal("my_signal",true,420)
		
func _init():
	print("Hello! Get Ready!")
	

func _on_Timer_timeout():
	print("1 second timer sent a timeout signal")
	$Sprite.visible = !$Sprite.visible
