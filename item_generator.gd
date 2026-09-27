extends Node3D
class_name ItemGenerator

@export
var item_templates = [];
var item_cap = 20;
var items_spawned = 0;
var line_width = 2;
var line_segments = 7;

var line_change_interval = 2;
var line_change_time = 0;

var line_idx = 0;
var line_velocity = 0;

var last_pos = 0;
var drop_distance = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_random_item(position: Vector3):
	var item = get_node(item_templates[randi_range(0,item_templates.size()-1)]) as SnowPile;
	var new_item = item.duplicate();
	new_item.parent_generator = self;
	new_item.distance_to_despawn = Camera.instance.get_despawn_distance();
	add_child(new_item);
	new_item.global_position = position;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	while (last_pos + drop_distance < Camera.instance.global_position.x + 10.0):
		spawn_random_item(SnowBall.instance.global_position * Vector3(1,0,0) + 
		Vector3(10,0,(line_segments/2-line_idx) * 1.0 / line_segments * line_width ) );
		last_pos += drop_distance
	line_change_time += delta
	if (line_change_time > line_change_interval):
		line_change_time -= line_change_interval
		line_velocity += randi_range(-1, 1)
		if (line_idx == 0 && line_velocity < 0):
			line_velocity = 1
		if (line_idx == line_segments-1 && line_velocity > 0):
			line_velocity = -1
	line_idx += delta * line_velocity
	#print(line_idx)
	#print(line_velocity)
	line_idx = clampf(line_idx, 0, line_segments-1);
		
	#while (items_spawned < item_cap):
		#var item = get_node(item_templates[randi_range(0,item_templates.size()-1)]) as SnowPile;
		#var new_item = item.duplicate();
		#new_item.parent_generator = self;
		#new_item.distance_to_despawn = SnowBall.instance.get_circumference()*3;
		#add_child(new_item);
		#new_item.global_position = Vector3(
			#Camera.instance.global_position.x + 2 * Camera.instance.size + 
			#randf_range(0, new_item.distance_to_despawn),
			#0,
			#randf_range(-1, 1)
		#);
		#items_spawned += 1;
