extends Node2D

var ball
var ball_position_x = 0

func _physics_process(delta):
	
	ball = get_parent().get_node("Ball")
	ball_position_x = ball.position.x + ((ball.scale.x * 8) / 2)
	position = Vector2(ball_position_x, ball.position.y)
