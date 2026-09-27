extends CharacterBody3D
class_name FighterJet

static var instance : FighterJet
var speed : float = 8
var rotate_speed : float = 1;
var rotation_speed : float = 1;
var dead_zone_scale : float = 50;
var dead_zone_return_speed : float = .5;
var explosion_radius : float = 10;
var cursor_pos = Vector2.ZERO
@export
var cursor : Sprite3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	instance = self



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var normal_cursor_pos = cursor_pos.normalized();
	var axis = Vector3.FORWARD.cross(Vector3(normal_cursor_pos.x,normal_cursor_pos.y,0));
	if (axis.length() == 1):
		rotate_object_local(axis, rotation_speed * delta * min(1,cursor_pos.length()));
	
	cursor_pos -= cursor_pos * delta * dead_zone_return_speed;
	#cursor_pos = Vector2(0,0)
	if (cursor_pos.length() > 1):
		cursor_pos = cursor_pos.normalized()
	cursor.position = Vector3(cursor_pos.x, cursor_pos.y, -1.8);
	
	if (Input.is_action_pressed("left")):
		rotate_object_local(Vector3.FORWARD, rotate_speed*delta);
	if (Input.is_action_pressed("right")):
		rotate_object_local(Vector3.FORWARD, -rotate_speed*delta);

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion):
		var target = (event as InputEventMouseMotion).screen_relative/dead_zone_scale;
		target = Vector2(target.x, -target.y);
		#cursor_pos = cursor_pos.lerp(target,.5);
		cursor_pos += target
	if (event.is_action("decrease_speed")):
		speed -= 1;
	if (event.is_action("increase_speed")):
		speed += 1;
	
	
func _physics_process(delta: float) -> void:
	velocity = -global_basis[2] * speed;
	move_and_slide()
