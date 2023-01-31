extends KinematicBody2D

# ----- Variable Setup -----
export var speed = 150
export var direction = Vector2(0.5, 1)

const player_container = preload("res://Games/Ricochet/Resources/PlayerContainer.tres")

var world = "res://Games/Ricochet/Stages/Scene.tscn"
var game_over = false
var is_running = false
var paddle_pos_x = 0

onready var vis_notif = get_node("VisibilityNotifier2D")

# ----- Runs Every Frame -----
func _physics_process(delta):
	
	paddle_pos_x = get_parent().get_node("Player").position.x
	
	# ----- Firing The Ball & Paddle Tracking -----
	if Input.is_action_just_pressed("action_1"):
		is_running = true
	elif not is_running:
		position = Vector2(paddle_pos_x, 312)
	
	# ----- After Firing The Ball -----
	if is_running:
		direction = direction.normalized()
		var velocity = speed * direction * delta
		var collision = move_and_collide(velocity)
		if collision != null:
			if collision.collider == player_container.player:
				print("Player")
				direction = direction.bounce(collision.normal)
				direction.x = get_x_bounce_direction(collision)
			else:
				direction = direction.bounce(collision.normal)
	
	# ----- Check if Game is Over
	check_game_over()

func get_x_bounce_direction(collision: KinematicCollision2D):
	var relative_x = collision.position.x - player_container.player.global_position.x
	var percentage = relative_x / player_container.player_width
	return (percentage - 0.5) * 2

func check_game_over():
	if not vis_notif.is_on_screen():
		print("Game Over")
		get_tree().change_scene(world)
