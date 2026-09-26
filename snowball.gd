extends CharacterBody2D



@export
var dash_strength : float = 400.0
@export
var downward_acceleration : float = 150
@export
var player_acceleration : float = 150


func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("left", "right")
	velocity.x += direction * player_acceleration * delta
	velocity.y += downward_acceleration * delta

	move_and_slide()
