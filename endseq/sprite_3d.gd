extends Sprite3D

var time = 0;
var jump_height = .5;
var jump_speed = 10;
var run_speed = 2;

func _ready() -> void:
	time = randf_range(0,PI);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += run_speed * delta
	global_position.y += sin(time) * delta * jump_height
	time += delta * jump_speed
