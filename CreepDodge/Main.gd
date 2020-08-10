extends Node

export (PackedScene) var Mob # import Mob via inspector
var score

func _ready():
	randomize() #if this is not called, random events will always happen in same order every run

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Music.stop()
	$DeathSound.play()
	get_tree().call_group("mobs", "queue_free") # assign the mob scene to a group to do this
	$HUD.show_game_over()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$Music.play()
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready!")

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.offset = randi() #get random location on Path2D
	var mob = Mob.instance()
	add_child(mob) #add Mob instance to scene
	#set mob direction perpendicular to path direction
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2 #pi, because godot uses radians not degrees
	mob.position = $MobPath/MobSpawnLocation.position
	direction += rand_range (-PI / 4, PI / 4)
	mob.rotation = direction
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
