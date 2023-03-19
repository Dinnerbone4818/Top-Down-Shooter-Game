extends KinematicBody2D



var speed = 2
export var direction = Vector2.ZERO

var enemies
var player

func _ready():
	enemies = get_parent().find_node("Enemy")
	player = get_parent().find_node("Player")
	

func _physics_process(delta):
	
	rotation = direction.angle() + 1.5
	position += direction * speed * delta
	
	
	
	
