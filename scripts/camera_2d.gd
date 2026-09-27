extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limit_left = Global.limit_left
	limit_top = Global.limit_top
	limit_right = Global.limit_right
	limit_bottom = Global.limit_bottom
