extends Sprite

func _physics_process(delta):
	var scale = get_parent().get_scale()
	self.set_scale(Vector2(1/scale.x, 1/scale.y))
