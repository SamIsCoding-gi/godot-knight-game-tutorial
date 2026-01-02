extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -260.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get player input directyion which will be either -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip sprite animation based on direction -1, 0, 1
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		#Play jump animation
		if direction == 0:
			animated_sprite.play("knight_idle")
		else:
			animated_sprite.play("knight_run")
	else: 
		animated_sprite.play("knight_jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
