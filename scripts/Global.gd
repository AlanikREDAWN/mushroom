extends Node

@onready var point_1: Vector2 = Vector2(50, 50)
@onready var point_2: Vector2 = Vector2(1100, 600)
enum difficultyLevels {
	EASY,
	MEDIUM,
	HARD
}
@onready var difficulty: difficultyLevels = difficultyLevels.EASY
@onready var mushrooms_foraged = 0
@onready var game_active = false
signal mushroom_grabbed

@onready var screen_size: Vector2
@onready var top_left: Vector2
@onready var bottom_right: Vector2
@onready var center_point: Vector2 = Vector2.ZERO
@onready var half_size: Vector2
@onready var min_boundary: Vector2
@onready var max_boundary: Vector2

@onready var limit_left
@onready var limit_top
@onready var limit_right
@onready var limit_bottom
