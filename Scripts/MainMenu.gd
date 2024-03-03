extends VBoxContainer

var time_begin
var time_delay

@onready var startBtn = $StartBtn

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	startBtn.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_pressed():
	print("Hell Yeah!")
	$HellYEAH.play()
	await get_tree().create_timer(0.58).timeout
	get_tree().change_scene_to_file("res://run.tscn")
	



func _on_quit_btn_pressed():
	$"Forgive-Me-father".play()
	$AudioStreamPlayer.stop()
	await get_tree().create_timer(17.5).timeout
	get_tree().quit()


func _on_credits_pressed():
	$HellYEAH.play()      
	await get_tree().create_timer(0.58).timeout
	get_tree().change_scene_to_file("res://Credits.tscn")

func _on_start_btn_mouse_entered():
	$buttonClic.play()

func _on_credits_mouse_entered():
	$buttonClic.play()

func _on_quit_btn_mouse_entered():
	$buttonClic.play()


