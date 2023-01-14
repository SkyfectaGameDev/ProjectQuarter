extends StaticBody2D

# ----- Variable Setup -----
export var health = 1
var block_sprite1 = preload("res://Games/Ricochet/Sprites/block_1.png")
var block_sprite2 = preload("res://Games/Ricochet/Sprites/block_2.png")
var block_sprite3 = preload("res://Games/Ricochet/Sprites/block_3.png")

# ----- Changing Sprite Based On Health -----
func _physics_process(delta):
	if (health == 1):
		get_node("BlockSprite").texture = block_sprite1
	elif (health == 2):
		get_node("BlockSprite").texture = block_sprite2
	elif (health == 3):
		get_node("BlockSprite").texture = block_sprite3
