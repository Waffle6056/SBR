extends Node3D

@export
var tree : Sprite3D
var distance_to_despawn = 50.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var amt  = randi_range(3,5);
	for i in range(amt):
		var newTree = tree.duplicate()
		add_child(newTree)
		newTree.global_position.x += randf_range(-.5,.5);
		newTree.global_position.z += randf_range(-.5,.5);

func _process(delta: float) -> void:
	if (SnowBall.instance.global_position.x - global_position.x > distance_to_despawn):
		queue_free()
