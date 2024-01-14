extends Button

@export var parent_container : Control
@export var offset_position : Vector2 = Vector2(0,0)
@export var close_window : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("_on_size_changed")

func _process(delta):
	_on_size_changed()

func _on_size_changed():
	# Snap to corner
	global_position = Vector2(parent_container.global_position.x + parent_container.size.x, parent_container.global_position.y)
	# Offset to center
	global_position += -(size * 0.5) + offset_position

func _on_pressed():
	close_window.queue_free()
	call_deferred("queue_free")
