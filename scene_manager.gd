extends Node3D
class_name SceneManager

static var instance;
@export
var scene_sequence = []
var idx = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enable_scene(scene_path: String):
	var scene_node = get_node(scene_path) as Sequence
	scene_node.process_mode = Node.PROCESS_MODE_INHERIT
	scene_node.cam.make_current()
	scene_node.visible = true
	scene_node.on_enable()

func disable_scene(scene_path: String):
	var scene_node = get_node(scene_path) as Sequence
	scene_node.process_mode = Node.PROCESS_MODE_DISABLED
	scene_node.visible = false

func next_scene() -> void:
	disable_scene(scene_sequence[idx]);
	idx += 1;
	enable_scene(scene_sequence[idx]);
