class_name Unit
extends Area2D

@export var stats: UnitStats

@onready var drag_and_drop: DragAndDrop = $DragAndDrop
@onready var outline_highlighter: OutlineHighlighter = $OutlineHighlighter


func _ready() -> void:
	print(name, " ready")
	if not Engine.is_editor_hint():
		drag_and_drop.drag_started.connect(_on_drag_started)
		drag_and_drop.drag_canceled.connect(_on_drag_canceled)


func set_stats(value: UnitStats) -> void:
	stats = value
	
	if value == null:
		return
	
	if not is_node_ready():
		await ready
	
	pass


func reset_after_dragging(starting_position: Vector2) -> void:
	#velocity_based_rotation.enabled = false
	global_position = starting_position


func _on_drag_started() -> void:
	#velocity_based_rotation.enabled = true
	pass


func _on_drag_canceled(starting_position: Vector2) -> void:
	reset_after_dragging(starting_position)


func _on_mouse_entered() -> void:
	if drag_and_drop.dragging:
		return
	
	outline_highlighter.highlight()
	z_index = 1


func _on_mouse_exited() -> void:
	if drag_and_drop.dragging:
		return
	
	outline_highlighter.clear_highlight()
	z_index = 0
