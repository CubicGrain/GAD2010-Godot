extends RigidBody2D

var is_being_held : bool = false
var original_gravity : float = self.gravity_scale
var facing_right : bool = true
var holder : Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if linear_velocity.x > 0:
		facing_right = true
	else: if linear_velocity.x < 0:
		facing_right = false
	
	
	pass

func pick_up_interactable(instigator: Node) -> void:
	is_being_held = true
	holder = instigator
	
	if holder and is_being_held:
		$HoldJoint.node_b = holder.get_path()
	else:
		push_warning("Physics Interactable: Error trying to attach to holder")
		is_being_held = false
		holder = null
		$HoldJoint.node_b = ""
	pass

func throw_interactable(instigator: Node) -> void:
	is_being_held = false
	holder = null
	$HoldJoint.node_b = ""
	if facing_right:
		self.apply_force(Vector2(20,5))
	else:
		self.apply_force(Vector2(-20,5))
	
	
	pass


func _on_short_interaction(instigator: Node) -> void:
	if is_being_held:
		throw_interactable(instigator)
	else:
		pick_up_interactable(instigator)
