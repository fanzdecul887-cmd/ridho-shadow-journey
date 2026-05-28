extends Camera2D

@export var target_path: NodePath
var target

func _ready():
	target = get_node(target_path)

func _process(delta):
	if target:
		global_position = global_position.lerp(target.global_position, 0.1)
