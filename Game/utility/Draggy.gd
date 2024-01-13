extends DampedSpringJoint2D

signal dragging(state)

var drag = false

export var rope_brake_range = 120.0 # max distance between draggy and dragged object

func _ready():
	pass
	
func start_drag():
	drag = true
	emit_signal("dragging",true)
	$GrabbyPart/Line2D.visible = true
	$Rope.visible = true
	stiffness = 58
	damping = 5
	pass

func end_drag():
	emit_signal("dragging",false)
	drag = false
	$GrabbyPart/Line2D.visible = false
	print("bias: ",bias)
	$Rope.visible = false
	$GrabbyPart/CollisionShape2D.disabled = true
	$GrabbyPart.position = Vector2.ZERO
	stiffness = 0
	damping = 0
	yield(get_tree().create_timer(0.2),"timeout")
	$GrabbyPart/CollisionShape2D.disabled = false
	pass


func _physics_process(delta):
	
	if drag:
		var rope_length = $GrabbyPart.global_position.distance_to(get_parent().global_position)
		
		$GrabbyPart.global_position = get_global_mouse_position() 
		
		$Rope.set_point_position(0,$GrabbyPart.position)
		$Rope.rotation = 0
		$Rope.width = 16 - 14 * (rope_length / rope_brake_range)
		if  rope_length > rope_brake_range :
			end_drag()


func _input(event):
	if event.is_class("InputEventMouseButton") and drag:
		if event.button_index == 1 and !event.is_pressed():
			end_drag()
			

func _on_GrabbyPart_input_event(viewport, event:InputEvent, shape_idx):
	if event.is_class("InputEventMouseButton") and !drag:
		if event.button_index == 1 and event.is_pressed():
			start_drag()
