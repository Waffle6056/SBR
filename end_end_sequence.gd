extends Sequence

@export
var Ball : SnowBall
@export
var KojimaCluster : Node3D
@export
var FighterJet : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_enable() -> void: 
	KojimaCluster.reparent(self)
	Kojima.move = false;
	Ball.reparent(self)
	Ball.process_mode = Node.PROCESS_MODE_DISABLED
	Ball.global_position = FighterJet.global_position + Vector3(0,10,0);
	cam.global_position = Ball.global_position + Vector3(0,10,0);
	
