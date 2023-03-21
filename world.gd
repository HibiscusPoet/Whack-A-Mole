extends Node2D

@onready var moleScene = preload("res://mole.tscn")
@onready var healthBar = get_node("CanvasLayer/HealthBar")
@onready var scoreText = get_node("CanvasLayer/UI/CenterContainer/VBoxContainer/Label")
@onready var UINode = get_node("CanvasLayer/UI")

var padding = 10
var molePerSecond = 1
var score = 0
var maxHealth = 10
#var health = 10
var isAlive = true


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


func _on_mole_mole_caught():
	if isAlive:
		score += 1
		print("Score is currently at: " + str(score))


func _on_mole_mole_not_caught():
	if isAlive:
		healthBar.health -= 1
		healthBar.value -= 1
		print("Health is: " + str(healthBar.health))
		if healthBar.health == 0:
			UINode.visible = true
