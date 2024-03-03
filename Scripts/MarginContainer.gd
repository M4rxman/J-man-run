extends MarginContainer

@onready var played
# Called when the node enters the scene tree for the first time.
func _ready():
	_draw_the_menu()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _hide_the_menu():
	if visible: 
		visible = false

		$MainMenu.visible = false 
		

func _draw_the_menu():
	if visible: 
		pass
	else:
		visible = true
		$MainMenu.visible = true 

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://run.tscn")


func _on_video_stream_player_draw():
	_hide_the_menu()

func _on_start_btn_pressed():
	print("Gay")
