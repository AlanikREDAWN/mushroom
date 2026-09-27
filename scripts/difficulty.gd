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
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_medium_pressed() -> void:
	Global.difficulty = Global.difficultyLevels.MEDIUM
	#Global.point_1 = Vector2(-1440, -810)
	#Global.point_2 = Vector2(1440, 810)
	Global.point_1 = Vector2(-1340, -710)
	Global.point_2 = Vector2(1340, 710)
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_hard_pressed() -> void:
	Global.difficulty = Global.difficultyLevels.HARD
	#Global.point_1 = Vector2(-1920, -1080)
	#Global.point_2 = Vector2(1920, 1080)
	Global.point_1 = Vector2(-1820, -980)
	Global.point_2 = Vector2(1820, 980)
	get_tree().change_scene_to_file("res://scenes/main.tscn")
