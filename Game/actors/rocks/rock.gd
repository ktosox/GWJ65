extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	randomize()
#	gravity_scale += randf() - 0.5
#	linear_damp += randf() - 0.5
	for c in get_children():
		c.rotation = randf() * PI
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggy_dragging(state):
	if state:
		mode = RigidBody2D.MODE_CHARACTER
#		print("gravity_scale: ",gravity_scale," linear_damp: ",linear_damp)
	else:
		mode = RigidBody2D.MODE_RIGID
	pass # Replace with function body.
