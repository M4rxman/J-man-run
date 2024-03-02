extends Node3D

@export var modules: Array[PackedScene] = []
var amount = 3
var rng = RandomNumberGenerator.new()
var offset = 220 #perfect 219.974

var speedmultiplier = 0.0
var initObs = 0

func _ready():
	$"../Timer".start()
	for n in amount:
		spawnModule(n*offset)
		print("spawned")


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://menu.tscn")

func spawnModule(n):
	if initObs > 10: #preload
		rng.randomize()
		var num = rng.randi_range(0, modules.size()-1)
		var instance = modules[num].instantiate()
		instance.position.z = n
		add_child(instance)
	else:
		var instance = modules[0].instantiate() #start
		instance.position.z = n
		add_child(instance)
		initObs += 1
	print("calling spawn")

func _on_timer_timeout():
	speedmultiplier += 0.025
	print(speedmultiplier)
