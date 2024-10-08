extends Node3D
#LEVELS
#@export var modules: Array[PackedScene] = [] #temp
@export var lvl1: Array[PackedScene] = []
@export var lvl2: Array[PackedScene] = []
@export var lvl3: Array[PackedScene] = []
@export var lvl4: Array[PackedScene] = []
#@export var lvl5: Array[PackedScene] = []
#@export var lvl6: Array[PackedScene] = []
#@export var lvl7: Array[PackedScene] = []
#@export var lvl8: Array[PackedScene] = []
@export var lvlBackground: Array[PackedScene] = []

@onready var player = $"../Player"

var amount = 25
var rng = RandomNumberGenerator.new()
var offset = 10 #perfect 219.974

var isPause = false

var backgroundAmount = 5
var backgroundOffset = 141.5 #perfect 141.9

var currentLevel
var speedmultiplier = 0.0
var initObs = 0

func _ready():
	$"../Timer".start()
	for n in amount:
		spawnModule(n*offset)
		#print("spawned")
		
	for u in backgroundAmount:
		spawnBackground(u*backgroundOffset)


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://menu.tscn")
	

func spawnModule(n):
	if initObs > 6: #preload
		if player.score >= 0 and player.score < 300:
			currentLevel = lvl1
		elif player.score >= 300 and player.score < 600:
			currentLevel = lvl2
		elif player.score >= 600 and player.score < 1000:
			currentLevel = lvl3
		elif player.score >= 1000:
			currentLevel = lvl4
		rng.randomize()
		var num = rng.randi_range(0, currentLevel.size()-1)
		var instance = currentLevel[num].instantiate()
		instance.position.z = n
		add_child(instance)
		initObs += 1
	else:
		var instance = lvl1[0].instantiate() #start
		instance.position.z = n
		add_child(instance)
		
		print("CLEAR WAY")
	#print("calling spawn")

func spawnBackground(i):
	var instance = lvlBackground[0].instantiate()
	instance.position.z = i
	add_child(instance)

func _on_timer_timeout():
	initObs = 11
	if speedmultiplier < 5:
		speedmultiplier += 0.05
	print(speedmultiplier)


func _on_timer_2_timeout():
	initObs = 11
