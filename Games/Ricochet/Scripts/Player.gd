extends KinematicBody2D

# ----- Variable Setup -----
export var acceleration = 250
export var speed_mult = 1
export var player_length = 0

onready var paddle_left = get_node("PaddleLeft")
onready var paddle_mid = get_node("PaddleMiddle")
onready var paddle_right = get_node("PaddleRight")
onready var collider = get_node("Collider")

var velocity = Vector2.ZERO
var friction = 125
var collider_update = CapsuleShape2D.new()

# ----- Change Paddle Size -----
func player_size():
	paddle_mid.scale.x = player_length
	print(player_length)
	paddle_left.position = Vector2(paddle_mid.position.x + ((paddle_mid.scale.x * -8) / 2), paddle_mid.position.y)
	paddle_right.position = Vector2(paddle_mid.position.x + ((paddle_mid.scale.x * 8) / 2), paddle_mid.position.y)
	collider_update.height = player_length * 8 + 8
	collider_update.radius = 4
	collider.shape = collider_update

# ----- Moving The Paddle -----
func _physics_process(delta):
	player_size()
	position.y = 320
	
	if (Input.is_action_pressed("action_2")):
		speed_mult = 0.5
	else:
		speed_mult = 1
	
	if (Input.is_action_pressed("move_left")):
		velocity.x = -acceleration * speed_mult
	elif (Input.is_action_pressed("move_right")):
		velocity.x = acceleration * speed_mult
	
	move_and_slide(velocity)
	velocity = velocity.move_toward(Vector2.ZERO, friction)
