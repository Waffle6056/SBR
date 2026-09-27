extends Camera3D
class_name Camera

static var instance : Camera;
@export
var target : SnowBall
@export
var base_offset : Vector3
@export
var offset_scaling : Vector3
var offset : Vector3
@export
var size_scaling : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self
	size -= target.get_circumference() * size_scaling


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset = base_offset + Vector3(0.5 - 0.5 / target.velocity.x,0,0);
	global_position = target.global_position * Vector3(1,0,0) + offset
	size = 1 + target.get_circumference() * size_scaling
