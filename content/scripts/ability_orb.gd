extends Node2D

var is_collected : bool = false

@export var duration : float = 5.0
@export var cooldown : float = 6.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = duration
	$Cooldown.wait_time = cooldown
	$AnimatedSprite2D.play("active")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not is_collected:
		is_collected = true
		print("Ability Orb Collected")
		$AnimatedSprite2D.play("inactive")
		$Timer.start()
		$Cooldown.start()
	
	
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	print("Orb Ability Expired")
	pass # Replace with function body.


func _on_cooldown_timeout() -> void:
	is_collected = false
	print("Ability Orb Respawned")
	$AnimatedSprite2D.play("active")
	pass # Replace with function body.
