extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")
	# connect() allows you to pass specific values into the connected function
	print("script ready")
	
# it seems that if the parent node already has the child node you want to call, you only need to write the
# _on_Button_pressed() func. 
# if Label had Button instead, and we were trying to call Button from Panel, we would call get_node("Label/Button")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init():
	print("script")

func _on_Button_pressed():
	get_node("Label").text = "HELLO!"
	print("pressed")
	pass # Replace with function body.
