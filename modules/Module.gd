extends Node3D

@onready var level = $"../"
var speed = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if level.isPause:
		pass
	else: 
		position.z += speed * delta
		if position.z > 20:
			level.spawnModule(position.z-(level.amount*level.offset))
			queue_free()

