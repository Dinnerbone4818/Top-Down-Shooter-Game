extends Area2D

#export var health = 1000
var player
var bullets

func _ready():
	player = get_parent().find_node("Player")
	bullets = get_parent().find_node("Bullet")

func _physics_process(delta):
	randomize()
	
	var speed = 100
	var velocity = Vector2.ZERO
	
	var direction = Vector2(player.position - position)
	velocity = direction.normalized() * 5
	
	rotation = direction.angle() + 90
	
	position = position.move_toward(player.position, speed * delta)
	

func _on_Enemy_body_entered(body):
	if body == player:
		player.health -= 20
	if body.is_in_group("bullets"):
		queue_free()
