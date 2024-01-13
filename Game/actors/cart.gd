extends PathFollow2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 30

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset += delta * speed * direction
	pass


func _on_Button2_pressed():
	direction -= 0.5
	pass # Replace with function body.


func _on_Button_pressed():
	direction += 0.5
	pass # Replace with function body.
