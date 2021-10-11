extends Node

export (PackedScene) var mob_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$UserInterface/Retry.hide()

func _on_MobTimer_timeout():
	var mob = mob_scene.instance()
	var mob_spawn_location = get_node("Path/SpawnLocation")
	# randf() gives between 0 and 1
	mob_spawn_location.unit_offset = randf()
	
	var player_position = $Player.transform.origin
	# Add mob as a child of Main node
	add_child(mob)
	mob.initialize(mob_spawn_location.translation, player_position)
	#connect mob to score label, which lets score update upon squash
	mob.connect("squashed", $UserInterface/ScoreLabel, "_on_Mob_squashed")


func _on_Player_hit():
	$MobTimer.stop()
	$UserInterface/Retry.show()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		#restart the scene
		get_tree().reload_current_scene()
