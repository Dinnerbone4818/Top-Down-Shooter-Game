extends Node2D

# Load the enemy and bullet scene (load the main enemy/bullet)
var main_enemy = load("res://Enemy/Enemy.tscn")
var player_scene = load("res://Player/PlayerReal.tscn")


var player = player_scene.instance()

# Create a new instance of the enemy and bullet scene
var enemy_instance = main_enemy.instance()




func ready():
	pass

func _physics_process(delta):
	player = player_scene.instance()
	

func _on_Timer_timeout():
	
	enemy_instance = main_enemy.instance()
	
	# Set the position of the instance
	enemy_instance.position = Vector2(randi() % 2000 + 1, randi() % 1000 + 1)

	# Add the instance to the scene
	add_child(enemy_instance)
