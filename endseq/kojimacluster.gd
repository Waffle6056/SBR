extends Node3D

@export
var tree : Node3D
@export 
var min_amt = 3
@export 
var max_amt = 5
@export 
var spawn_range = .5
var distance_to_despawn = 50.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var amt  = randi_range(min_amt,max_amt);
	for i in range(amt):
		var newTree = tree.duplicate()
		add_child(newTree)
		newTree.global_position.x += randf_range(-spawn_range,spawn_range);
		newTree.global_position.z += randf_range(-spawn_range,spawn_range);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
