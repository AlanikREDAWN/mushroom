extends Node

@onready var point_1: Vector2 = Vector2(50, 50)
@onready var point_2: Vector2 = Vector2(1100, 600)
enum difficultyLevels {
	EASY,
	MEDIUM,
	HARD
}
@onready var difficulty: difficultyLevels = difficultyLevels.EASY
