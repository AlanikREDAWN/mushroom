extends Node2D

@export var point_1: Vector2 = Vector2(50, 50)
@export var point_2: Vector2 = Vector2(1100, 600)

@onready var mushroom_blueprint: Resource = preload("res://scenes/mushroom_placeholder.tscn")

func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)

func spawn_powerup():
	var mushroom_instance: Node = mushroom_blueprint.instantiate()
	
	add_child(mushroom_instance)
	
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	mushroom_instance.set_position(spawn_location)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse"):
		spawn_powerup()
