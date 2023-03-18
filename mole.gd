extends Area2D

@onready var sprite2D = $MoleSprite

var mouse_inside_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("ui_click") and mouse_inside_area:
		print("Mole caught!")
		queue_free()

func _on_mouse_entered():
	mouse_inside_area = true

func _on_mouse_exited():
	mouse_inside_area = false

func _on_timer_timeout():
	sprite2D.set_region_rect(Rect2(0, 16, 16, 16))
	print("Mole escaped!")
