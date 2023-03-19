extends KinematicBody2D

var speed = 150
var health = 100

var enemies
var bullets

var bullet_scene = load("res://Bullet/Bullet.tscn")
var bullet_instance = bullet_scene.instance()

var bullet_timer = 0
var bullet_max_timer = 100

onready var direction = Vector2(get_viewport().get_mouse_position() - position)

onready var health_bar = $HealthBar


func _ready():
	enemies = get_parent().find_node("Enemy")
	bullets = get_parent().find_node("Bullet")

func _physics_process(delta):
	var velocity = Vector2.ZERO
	var direction = Vector2(get_viewport().get_mouse_position() - position)
	rotation = direction.angle() + 1.5
	
	
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
		
	move_and_slide(velocity * speed)
	
	health_bar.value = health
	
	bullet_timer += 1
	if Input.is_mouse_button_pressed(1):
		
		if bullet_timer >= bullet_max_timer:
			
			bullet_instance = bullet_scene.instance()
			bullet_instance.position = position
			bullet_instance.direction = direction
			get_parent().add_child(bullet_instance)
			bullet_timer = 0
	
