extends Node2D

#@export var point_1: Vector2 = Vector2(50, 50)
#@export var point_2: Vector2 = Vector2(1100, 600)

@onready var mushroom_blueprint: Resource = preload("res://scenes/mushroom_placeholder.tscn")

func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)

func spawn_powerup():
	#var mushroom_instance: Node = mushroom_blueprint.instantiate()
	
	var spawn_location: Vector2 = get_random_point_inside(Global.point_1, Global.point_2)
	var spawn_tries = 0
	
	while spawn_tries < 5:
		if not is_spawn_location_colliding(spawn_location):
			var mushroom_instance: Node = mushroom_blueprint.instantiate()
			mushroom_instance.set_position(spawn_location)
			add_child(mushroom_instance)
			break
			#print("error")
		else:
			spawn_location = get_random_point_inside(Global.point_1, Global.point_2)
			spawn_tries += 1
		
		#if spawn_tries > 5:
			#print
	if spawn_tries > 5:
		print("spawn tries reached")

	#mushroom_instance.set_position(spawn_location)

func is_spawn_location_colliding(spawn_location: Vector2) -> bool:
	#var pp = PhysicsPointQueryParameters2D.new()
	var shape_rid = PhysicsServer2D.circle_shape_create()
	var radius = 150
	PhysicsServer2D.shape_set_data(shape_rid, radius)
	var pp = PhysicsShapeQueryParameters2D.new()
	pp.shape_rid = shape_rid
	pp.collide_with_areas = true
	#pp.position = spawn_location
	var circle = CircleShape2D.new()
	circle.radius = 150.0
	pp.shape = circle
	pp.transform = Transform2D(
		Vector2(1, 0),
		Vector2(0, 1),
		spawn_location,
	)
	if get_world_2d().direct_space_state.intersect_shape(pp):
		print("HIT")
		PhysicsServer2D.free_rid(shape_rid)
		return true
#		
	else:
		return false
	#return false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
	match Global.difficulty:
		Global.difficultyLevels.EASY:
			for i in range(5):
				spawn_powerup()
		Global.difficultyLevels.MEDIUM:
			for i in range(10):
				spawn_powerup()
		Global.difficultyLevels.HARD:
			for i in range (15):
				spawn_powerup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse"):
		spawn_powerup()
