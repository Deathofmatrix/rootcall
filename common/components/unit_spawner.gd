class_name UnitSpawner
extends Node

signal unit_spawned(unit: Unit)

const UNIT = preload("res://entities/plants/unit.tscn")

@export var bench: PlayArea


func _ready() -> void:
	var newnit := preload("res://data/units/attack_plant.tres")
	var tween := create_tween()
	
	for i in 15:
		tween.tween_callback(spawn_unit.bind(newnit))
		tween.tween_interval(0.5)


func _get_first_avaliable_area() -> PlayArea:
	if not bench.unit_grid.is_grid_full():
		return bench
	
	print("No avaliable PlayArea to spawn Unit")
	return null


func spawn_unit(unit: UnitStats) -> void:
	var area := _get_first_avaliable_area()
	
	assert(area, "No avaliable space to add unit to!")
	
	var new_unit := UNIT.instantiate()
	var tile := area.unit_grid.get_first_empty_tile()
	area.unit_grid.add_child(new_unit)
	area.unit_grid.add_unit(tile, new_unit)
	new_unit.global_position = area.get_global_from_tile(tile) - Arena.HALF_CELL_SIZE
	new_unit.stats = unit
	unit_spawned.emit(new_unit)
