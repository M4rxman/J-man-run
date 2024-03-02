extends Node3D
#LEVELS
#@export var modules: Array[PackedScene] = [] #temp
@export var lvl1: Array[PackedScene] = []
@export var lvl2: Array[PackedScene] = []
@export var lvl3: Array[PackedScene] = []
@export var lvl4: Array[PackedScene] = []
@export var lvl5: Array[PackedScene] = []
@export var lvl6: Array[PackedScene] = []
@export var lvl7: Array[PackedScene] = []
@export var lvl8: Array[PackedScene] = []

@onready var player = $"../Player"


var amount = 20
var rng = RandomNumberGenerator.new()
var offset = 10 #perfect 219.974

var currentLevel
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
		if player.score >= 0 and player.score < 500:
			currentLevel = lvl1
		elif player.score >= 500 and player.score < 1000:
			currentLevel = lvl2
		elif player.score >=1000 and player.score < 1500:
			currentLevel = lvl3
		rng.randomize()
		var num = rng.randi_range(0, currentLevel.size()-1)
		var instance = currentLevel[num].instantiate()
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
