extends ProgressBar

#@onready var worldNode = get_node("../..")
#var worldNode = get_tree().get_root()
var maxHealth = 10
var health = maxHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	set_max(maxHealth)
	#set_max(worldNode.maxHealth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
