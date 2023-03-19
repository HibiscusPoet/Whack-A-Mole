extends Node2D

var moleScene = preload("res://mole.tscn")
var padding = 10
var molePerSecond = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	for n in molePerSecond:
		var mole = moleScene.instantiate()
		add_child(mole)
		mole.position = randomizePosition()
	print("tick, molePerSecond is: " + str(molePerSecond))

func randomizePosition() -> Vector2:
	var xPos = randi_range(padding, 320 - padding)
	print("xPos of a mole is: " + str(xPos))

	var yPos = randi_range(padding, 180 - padding)
	print("yPos of a mole is: " + str(yPos))
	
	return Vector2(xPos,yPos)

#screen_get_size

func _on_difficulty_timer_timeout():
	molePerSecond += 1
