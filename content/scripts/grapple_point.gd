extends Node2D

@export var launch_velocity : float = 1200


func _on_short_interaction(instigator: Node) -> void:
	var direction = (global_position - instigator.global_position).normalized()
	
	instigator.velocity = direction * launch_velocity
	print("success")
	
	pass # Replace with function body.
