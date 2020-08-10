extends RigidBody2D

export var min_speed = 150 # exporting lets you change the variables from the inspector
export var max_speed = 250

func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()] #randi() returns random number from 0 to n-1

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #delete when off-screen
