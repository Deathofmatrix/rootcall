class_name UnitGrid
extends Node2D

signal unit_grid_changed

@export var size: Vector2i

var units: Dictionary


func _ready() -> void:
	for i in size.x:
		for j in size.y:
			units[Vector2i(i, j)] = null
	
	add_unit(Vector2i(0, 0), $"../../Plant")
	print("(0, 0) tile_occupied: ", is_tile_occupied(Vector2i(0, 0)))
	print("is_grid_full: ", is_grid_full())
	print("frst empty tile: ", get_first_empty_tile())
	print("get_all_units: ", get_all_units())


func add_unit(tile: Vector2i, unit: Node) -> void:
	units[tile] = unit
	unit_grid_changed.emit()


func is_tile_occupied(tile: Vector2i) -> bool:
	return units[tile] != null


func is_grid_full() -> bool:
	return units.keys().all(is_tile_occupied)


func get_first_empty_tile() -> Vector2i:
	for tile in units:
		if not is_tile_occupied(tile):
			return tile
	
	return Vector2i(-1, -1)


func get_all_units() -> Array[Plant]:
	var unit_array: Array[Plant] = []
	
	for unit: Plant in units.values():
		if unit:
			unit_array.append(unit)
	
	return unit_array
