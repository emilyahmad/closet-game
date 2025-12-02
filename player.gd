extends Area2D

@export var speed = 900
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_rightD"):
		velocity.x += 1
	if Input.is_action_pressed("move_left") || Input.is_action_pressed("move_leftA"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down") || Input.is_action_pressed("move_downS"):
		velocity.y += 1
	if Input.is_action_pressed("move_up") || Input.is_action_pressed("move_upW"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
