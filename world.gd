extends Node2D

const moleScene = preload("res://mole.tscn")
const evilMoleScene = preload("res://evil_mole.tscn")
const heartScene = preload("res://heart.tscn")

@onready var healthBar = get_node("CanvasLayer/HealthBar")
@onready var scoreText = get_node("CanvasLayer/UI/CenterContainer/VBoxContainer/Label")
@onready var UINode = get_node("CanvasLayer/UI")
@onready var UILabel = get_node("CanvasLayer/UI/CenterContainer/VBoxContainer/Label")
@onready var audioStreamPlayer = get_node("AudioStreamPlayer")

var padding = 10
var molePerSecond = 1
var score = 0
var maxHealth = 10
#var health = 10
var isAlive = true

var arraySize
#var evilMole = PickUps.new()

var moleType = [moleScene, evilMoleScene, heartScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	arraySize = moleType.size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	if isAlive:
		for n in molePerSecond:
			var item = moleType[randi() % arraySize].instantiate()
			add_child(item)
			item.position = randomizePosition()
#			var mole = moleScene.instantiate()
#			add_child(mole)
#			mole.position = randomizePosition()
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


func _on_mole_mole_caught(mole):
	if isAlive:
		if mole is Heart:
			healthBar.health += mole.pointValue
			healthBar.value += mole.pointValue
		if mole is EvilMole || mole is Mole:
			score += mole.pointValue
#		score += damage
		audioStreamPlayer.play()
		print("Score is currently at: " + str(score))


func _on_mole_mole_not_caught(mole):
	if isAlive:
		
		if mole is EvilMole || mole is Mole:
			healthBar.health -= mole.pointValue
			healthBar.value -= mole.pointValue
		
#		healthBar.health -= damage
#		healthBar.value -= damage
		print("Health is: " + str(healthBar.health))
		if healthBar.health <= 0:
			isAlive = false
			UILabel.text = "You whacked " + str(score) + " moles!"
			UINode.visible = true
