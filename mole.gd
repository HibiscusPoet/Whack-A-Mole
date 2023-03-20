extends Area2D

signal mole_caught
signal mole_not_caught 

@onready var sprite2D = $MoleSprite

var mouse_inside_area = false
var mole_escaped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("ui_click") and mouse_inside_area and mole_escaped == false:
		print("Mole caught!")
		mole_caught.emit()
		queue_free()

func _on_mouse_entered():
	mouse_inside_area = true

func _on_mouse_exited():
	mouse_inside_area = false

func _on_timer_timeout():
	sprite2D.set_region_rect(Rect2(0, 16, 16, 16))
	print("Mole escaped!")
	mole_not_caught.emit()
	mole_escaped = true
