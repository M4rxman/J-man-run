extends Node3D
#LEVELS
#@export var modules: Array[PackedScene] = [] #temp
@export var lvl1: Array[PackedScene] = []

var amount = 20
var rng = RandomNumberGenerator.new()
var offset = 10 #perfect 219.974

var speedmultiplier = 0.0
var initObs = 0

func _ready():
	$"../Timer".start()
	for n in amount:
		spawnModule(n*offset)
		#print("spawned")


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://menu.tscn")

func spawnModule(n):
	if initObs > 10: #preload
		rng.randomize()
		var num = rng.randi_range(0, lvl1.size()-1)
		var instance = lvl1[num].instantiate()
		instance.position.z = n
		add_child(instance)
	else:
		var instance = lvl1[0].instantiate() #start
		instance.position.z = n
		add_child(instance)
		
		print("CLEAR WAY")
	#print("calling spawn")

func _on_timer_timeout():
	initObs = 11
	speedmultiplier += 0.025
	print(speedmultiplier)


func _on_timer_2_timeout():
	initObs = 11
