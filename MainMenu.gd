extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://run.tscn")



func _on_quit_btn_pressed():
	get_tree().quit()


func _on_credits_pressed():
	#TODO
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
