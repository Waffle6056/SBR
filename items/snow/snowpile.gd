extends Area3D
class_name SnowPile

@export
var growth_amount : float
var distance_to_despawn = 50.0;
var parent_generator : ItemGenerator;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (SnowBall.instance.global_position.x - global_position.x > distance_to_despawn):
		queue_free()



func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if (body is SnowBall):
		(body as SnowBall).scale += Vector3.ONE * growth_amount;
		body.global_position.y += growth_amount / 2;
		queue_free()
	
func _exit_tree() -> void:
	if (parent_generator):
		parent_generator.items_spawned -= 1;
