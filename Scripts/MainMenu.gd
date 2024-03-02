extends VBoxContainer

var time_begin
var time_delay

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_pressed():
	$HellYEAH.play()
	await get_tree().create_timer(0.58).timeout
	get_tree().change_scene_to_file("res://run.tscn")
	



func _on_quit_btn_pressed():
	$"Forgive-Me-father".play()
	$AudioStreamPlayer.stop()
	await get_tree().create_timer(19.89).timeout
	get_tree().quit()


func _on_credits_pressed():
	#TODO
	$HellYEAH.play()
	await get_tree().create_timer(0.58).timeout
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")

func _on_start_btn_mouse_entered():
	$buttonClic.play()

func _on_credits_mouse_entered():
	$buttonClic.play()

func _on_quit_btn_mouse_entered():
	$buttonClic.play()


