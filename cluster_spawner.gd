extends Node3D

@export
var item : Node3D

var last_pos = 0;
var drop_distance = 1;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_cluster(position: Vector3):
	var new_item = item.duplicate();
	new_item.distance_to_despawn = Camera.instance.offset.x*3;
	add_child(new_item);
	new_item.global_position = position;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while (last_pos + drop_distance < Camera.instance.global_position.x + Camera.instance.offset.x*3):
		for i in range(0, 10):
			spawn_cluster(SnowBall.instance.global_position * Vector3(1,0,0) + 
				Vector3(
					last_pos + randf_range(-drop_distance/2,drop_distance/2),
					item.global_position.y,
			 		1.75 + i
					)
				);
		for i in range(0, 10):
			spawn_cluster(SnowBall.instance.global_position * Vector3(1,0,0) + 
				Vector3(
					last_pos + randf_range(-drop_distance/2,drop_distance/2),
					item.global_position.y,
			 		-1.75 - i 
					)
				);
			
		last_pos += drop_distance
