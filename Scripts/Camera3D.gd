extends Camera3D

@export var randomStrengh: float = 30
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func apply_shake():
	shake_strength = randomStrengh

# Called every frame. 'delta' is the elapsed time since thesprevious frame.
func _process(delta):
	if Input.is_action_just_pressed("Shake"):
		apply_shake()
	
	look_at($"../Player".position + Vector3(0, 1, 0), Vector3(0,0.6,0))
	
