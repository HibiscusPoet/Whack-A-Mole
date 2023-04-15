extends PickUps

class_name Heart

# Called when the node enters the scene tree for the first time.
func _ready():
	connnect_Nodes()
	pointValue = 3
	leavesHoles = false
	#worldNode.timeout.connect(_on_timer_timeout())
	#timer.timeout.connect(_on_timer_timeout)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("ui_click") and mouse_inside_area and mole_escaped == false:
		print("Mole caught!")
		mole_caught.emit(self)
		queue_free()

func _on_mouse_entered():
	mouse_inside_area = true

func _on_mouse_exited():
	mouse_inside_area = false

func _on_timer_timeout():
	escape_mole()
	queue_free()
