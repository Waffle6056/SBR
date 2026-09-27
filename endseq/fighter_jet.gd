extends CharacterBody3D

var speed : float = 500;
var rotation_speed : float = 1;
var dead_zone_scale : float = 200;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position() - get_viewport().get_visible_rect().size / 2;
	mouse_pos = Vector2(mouse_pos.x, -mouse_pos.y);
	mouse_pos /= dead_zone_scale;
	var normal_mouse_pos = mouse_pos.normalized();
	var axis = Vector3.FORWARD.cross(Vector3(normal_mouse_pos.x,normal_mouse_pos.y,0));
	rotate_object_local(axis, rotation_speed * delta * min(1,mouse_pos.length()));
	
	
func _physics_process(delta: float) -> void:
	pass
	velocity = -global_basis[2] * speed;
