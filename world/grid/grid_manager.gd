class_name GridManager
extends Node2D

@export var grid_size: Vector2i = Vector2i(10,10)
@export var cell_size: Vector2i = Vector2i(16,16)

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

#var grid_units:

func _ready() -> void:
	pass
