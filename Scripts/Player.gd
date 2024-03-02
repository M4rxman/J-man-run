extends CharacterBody3D


const SPEED = 13.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var death_sensor = $DeathSensor

var score = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Down jump
	if Input.is_action_just_pressed("down") and !is_on_floor():
		velocity.y = -JUMP_VELOCITY*2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
	
	score += 0.5
	$"../CanvasLayer/HUD/Score".text = str(int(score))
	move_and_slide()
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
	get_tree().reload_current_scene()
