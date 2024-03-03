extends CharacterBody3D


const SPEED = 17.0# 13
const JUMP_VELOCITY = 4.5

var rngp = RandomNumberGenerator.new()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var anim = $JESUS/AnimationPlayer
@onready var animBoard = $JESUS/board/AnimationBoard
@onready var death_sensor = $DeathSensor
@onready var level = $"../Level"

var score = 0
var rotation_angle = 180
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		rngp.randomize()
		var num = rngp.randi_range(0, 1)
		if num == 0:
			anim.play("JESUS_JUMP1")
			animBoard.play("BOARD_JUMP1")
		else:
			anim.play("JESUS_JUMP2")
			animBoard.play("BOARD_JUMP2")
		
	# Down jump
	if Input.is_action_just_pressed("down") and !is_on_floor():
		velocity.y = -JUMP_VELOCITY*2
		anim.play("ArmatureAction")
		animBoard.play("Armature_001Action")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		##velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		##velocity.z = move_toward(velocity.z, 0, SPEED)
	var direction1 = Input.get_axis("ui_left", "ui_right")
	
	if direction1:
		velocity.x = direction1 * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction1 == -1:
		$JESUS.rotation.y = deg_to_rad(rotation_angle+10)
	elif direction1 == 1:
		$JESUS.rotation.y = deg_to_rad(rotation_angle-10)
	else:
		$JESUS.rotation.y = deg_to_rad(rotation_angle)
		
	score += 0.5
	$"../CanvasLayer/HUD/Score".text = str(int(score))
	move_and_slide()
	if is_on_floor():
		anim.play("ArmatureAction")
		animBoard.play("Armature_001Action")
	if death_sensor.is_colliding():
		print("alarm")
		death()

func deathByCar():
	death()
	
func deathByRock():
	death()

func deathByLava():
	death()
	
func deathBySwamp():
	death()
	
func deathByWall():
	death()
	
func deathByBarrier():
	death()

func death():
	#print("DEAD")
	#await get_tree().create_timer(10.0).timeout
	#get_tree().reload_current_scene()
	level.isPause = true
	await get_tree().create_timer(3.0).timeout
	get_tree().reload_current_scene()
