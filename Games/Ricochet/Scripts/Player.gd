extends KinematicBody2D

# ----- Variable Setup -----
export var acceleration = 250
export var speed_mult = 1

var velocity = Vector2.ZERO
var friction = 125

# ----- Moving The Paddle -----
func _physics_process(delta):
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
