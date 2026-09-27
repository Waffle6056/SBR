extends Node3D
class_name ItemGenerator

@export
var item_templates = [];
var item_cap = 20;
var items_spawned = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while (items_spawned < item_cap):
		var item = get_node(item_templates[randi_range(0,item_templates.size()-1)]) as SnowPile;
		var new_item = item.duplicate();
		new_item.parent_generator = self;
		new_item.distance_to_despawn = SnowBall.instance.get_circumference()*3;
		add_child(new_item);
		new_item.global_position = Vector3(
			Camera.instance.global_position.x + 2 * Camera.instance.size + 
			randf_range(0, new_item.distance_to_despawn),
			0,
			randf_range(-1, 1)
		);
		items_spawned += 1;
