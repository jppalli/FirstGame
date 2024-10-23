extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Skip applying the logic if the node is named "Platform"
	if name == "Platform":
		return

	# Handle direction change based on RayCast collisions
	if ray_cast_right.is_colliding():
		direction = -1

	if ray_cast_left.is_colliding():
		direction = 1

	# Update the position of the node (unless it's the "Platform")
	position.x += direction * SPEED * delta
