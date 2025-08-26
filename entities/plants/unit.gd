class_name Unit
extends Area2D

@export var stats: StatsComponent

@onready var drag_and_drop: DragAndDrop = $DragAndDrop
@onready var outline_highlighter: OutlineHighlighter = $OutlineHighlighter


func reset_after_dragging(starting_position: Vector2) -> void:
	#velocity_based_rotation.enabled = false
	global_position = starting_position

func _on_mouse_entered() -> void:
	if drag_and_drop.dragging:
		return
	
	outline_highlighter.highlight()


func _on_mouse_exited() -> void:
	if drag_and_drop.dragging:
		return
	
	outline_highlighter.clear_highlight()
