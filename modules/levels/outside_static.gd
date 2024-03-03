extends Node3D

@onready var level = $"../"
var speed = 15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.z += speed * delta
	if position.z > 282:
		level.spawnBackground(position.z-(level.backgroundAmount*level.backgroundOffset))
		queue_free()

