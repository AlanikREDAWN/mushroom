extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_easy_pressed() -> void:
	Global.difficulty = Global.difficultyLevels.EASY
	#Global.point_1 = Vector2(-960, -540)
	#Global.point_2 = Vector2(960, 540)
	Global.point_1 = Vector2(-860, -440)
	Global.point_2 = Vector2(860, 440)
	Global.top_left = Vector2(-960, -540)
	
	Global.bottom_right = Vector2(960, 540)
	screen_things()
	
	Global.limit_left = -960
	Global.limit_top = -540
	Global.limit_right = 960
	Global.limit_bottom = 540
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_medium_pressed() -> void:
	Global.difficulty = Global.difficultyLevels.MEDIUM
	#Global.point_1 = Vector2(-1440, -810)
	#Global.point_2 = Vector2(1440, 810)
	Global.point_1 = Vector2(-1340, -710)
	Global.point_2 = Vector2(1340, 710)
	Global.top_left = Vector2(-1440, -810)
	Global.bottom_right = Vector2(1440, 810)
	screen_things()
	
	Global.limit_left = -1440
	Global.limit_top = -810
	Global.limit_right = 1440
	Global.limit_bottom = 810
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_hard_pressed() -> void:
	Global.difficulty = Global.difficultyLevels.HARD
	#Global.point_1 = Vector2(-1920, -1080)
	#Global.point_2 = Vector2(1920, 1080)
	Global.point_1 = Vector2(-1820, -980)
	Global.point_2 = Vector2(1820, 980)
	Global.top_left = Vector2(-1920, -1080)
	Global.bottom_right = Vector2(1920, 1080)
	screen_things()
	
	Global.limit_left = -1920
	Global.limit_top = -1080
	Global.limit_right = 1920
	Global.limit_bottom = 1080
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func screen_things():
	Global.screen_size = Global.bottom_right - Global.top_left
	Global.half_size = Global.screen_size / 2.0
	Global.min_boundary = Global.center_point - Global.half_size
	Global.max_boundary = Global.center_point + Global.half_size
