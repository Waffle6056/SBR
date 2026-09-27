extends Area3D

var exploded = false;
var velocity = Vector3(0,0,0);
var time = 0;
var jump_height = .5;
var jump_speed = 10;
var grav = 5;
var run_speed = 2;

func _ready() -> void:
	time = randf_range(0,PI);
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!exploded):
		global_position.x += run_speed * delta
		global_position.y += sin(time) * delta * jump_height
		time += delta * jump_speed
	else:
		global_position += velocity * delta
		velocity.y -= grav * delta;

func explode(explosion_origin: Vector3, explosion_radius: float) -> void:
	if (exploded):
		return;
	#print(exploded)
	var xz_dir = ((global_position - explosion_origin)*Vector3(1,0,1)).normalized();
	var power = explosion_radius - global_position.distance_to(explosion_origin);
	velocity = Vector3(xz_dir.x, 1, xz_dir.z) * power;
	exploded = true

func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	explode(body.global_position, body.explosion_radius);                              
	
