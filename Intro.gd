extends VideoStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):   
		get_tree().change_scene_to_file("res://menu.tscn")


func _on_finished():
	get_tree().change_scene_to_file("res://menu.tscn")
