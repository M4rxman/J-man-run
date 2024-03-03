extends MarginContainer

@onready var played
# Called when the node enters the scene tree for the first time.
func _ready():
	_draw_the_menu()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(47.8).timeout
	
	if(_on_video_stream_player_finished()):
		_draw_the_menu()
		
		

func _draw_the_menu():
	if visible: 
		pass
	else:
		visible = true
		$MainMenu.visible = not $MainMenu.visible
		$Jesus.visible = not $Jesus.visible
		$MainMenu/MarginContainer.visible = true
		$MainMenu.visible = true 

func _on_video_stream_player_finished():
	return true
