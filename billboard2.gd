extends Sprite3D
class_name Billboard

@export
var spin : float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation.z = -spin
	pass
	#look_at(get_viewport().get_camera_3d().global_position, Vector3.UP.rotated(Vector3.BACK,-spin));
	
