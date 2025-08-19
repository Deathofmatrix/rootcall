class_name DestroyedComponent
extends Node

@export var actor: Node2D
@export var stats_component: StatsComponent

func _ready() -> void:
	stats_component.no_health.connect(destroy)

func destroy() -> void:
	# Add a spawner and and effect that it spawns
	# maybe add a timer of how long to wait before queue free
	actor.queue_free()
