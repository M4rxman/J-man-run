extends Control


@onready var startBtn = $StartBtn

# Called when the node enters the scene tree for the first time.
func _ready():
	startBtn.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
