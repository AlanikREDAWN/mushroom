extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.flip_h = true
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("sleep")

	position += velocity * delta
	#var input_direction := Input.get_vector("left", "right", "up", "down")
	#velocity = input_direction * SPEED
	
	
	
	#var horizontal_direction = Input.get_axis("left", "right")
	#var vertical_direction = Input.get_axis("up", "down")
	#var direction = Vector2(horizontal_direction, vertical_direction).normalized()
	#velocity = direction * SPEED
	
	
	#if direction:
		#velocity = direction * SPEED
	#else:
		#velocity = move_toward(velocity, 0, SPEED)

	move_and_slide()
	#position = position.clamp(Vector2.ZERO, Global.screen_size)
	position.x = clamp(position.x, Global.min_boundary.x, Global.max_boundary.x)
	position.y = clamp(position.y, Global.min_boundary.y, Global.max_boundary.y)
