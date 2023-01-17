extends KinematicBody2D

# ----- Variable Setup -----
export var speed = 150
export var direction = Vector2(0.5, 1)

onready var vis_notif = get_node("VisibilityNotifier2D")

var is_running = false
var paddle_pos_x = 0

# ----- Runs Every Frame -----
func _physics_process(delta):
	
	paddle_pos_x = get_parent().get_node("Player").position.x
	
	# ----- Firing The Ball & Paddle Tracking -----
	if Input.is_action_just_pressed("action_1"):
		is_running = true
	elif not is_running:
		position = Vector2(paddle_pos_x, 313)
	
	# ----- After Firing The Ball -----
	if is_running:
		var velocity = speed * direction * delta
		var collision = move_and_collide(velocity)
		if collision != null:
			direction = direction.bounce(collision.normal)
	
	# ----- Check if Game is Over
	is_game_over()

func is_game_over():
	if vis_notif.is_on_screen():
		print("visible")
	else:
		print ("not visible")	
