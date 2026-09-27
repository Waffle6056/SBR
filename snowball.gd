extends CharacterBody3D
class_name SnowBall

static var instance : SnowBall;
@export
var dash_strength : float = 400.0
@export
var downward_acceleration : float = 150
@export
var maximum_downward_velocity : float = 150
@export
var player_acceleration : float = 150
@export
var player_max_velocity : float = 150
@export
var max_z_movement : float = 1
@export
var sprite : Billboard

func _ready() -> void:
	instance = self;

#returns diameter
func get_circumference() -> float:
	return global_transform.basis.get_scale().x

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("left", "right")
	velocity.z += direction * player_acceleration * delta
	velocity.z = clampf(velocity.z, -player_max_velocity, player_max_velocity)
	velocity.x += downward_acceleration * delta
	velocity.x = clampf(velocity.x, -maximum_downward_velocity, maximum_downward_velocity)

	sprite.spin += velocity.x * delta / (get_circumference() * PI) * 2 * PI
	move_and_slide()
	
	if (get_circumference() > 10.0):
		max_z_movement = 5.0;
	global_position.z = clampf(global_position.z, -max_z_movement, max_z_movement)
