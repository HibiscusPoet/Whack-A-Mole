extends Node

class_name PickUps

signal mole_caught
signal mole_not_caught

#@onready var healthBar = get_node("CanvasLayer/HealthBar")
@onready var molehill = load("res://molehill.tscn")

@onready var healthBar = get_tree().get_root().get_node("World/CanvasLayer/HealthBar")

@onready var sprite2D = $MoleSprite
@onready var timer = $Timer

var mouse_inside_area = false
var mole_escaped = false

var worldNode

var leavesHoles = true
var pointValue = 0

func connnect_Nodes():
	worldNode = get_node("/root/World")
	mole_not_caught.connect(worldNode._on_mole_mole_not_caught)
	mole_caught.connect(worldNode._on_mole_mole_caught)
	
func escape_mole():
	if leavesHoles == true:
		#sprite2D.texture = load("res://Molehill.png")
		var hill = molehill.instantiate()
		add_child(hill)
		hill.position = sprite2D.position
	print("Mole escaped!")
	mole_not_caught.emit()
	mole_escaped = true
	#queue_free()
	
	

#
#func Adjust_Health(amount: int):
#	worldNode.score += pointValue
#


#----------------------------------------

