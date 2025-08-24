class_name PlayArea
extends TileMapLayer

@export var unit_grid: UnitGrid

var bounds: Rect2i

func _ready() -> void:
	bounds = Rect2i(Vector2.ZERO, unit_grid.size)
