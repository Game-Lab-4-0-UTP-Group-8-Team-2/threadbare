extends TileMapLayer

@export var npc_path: NodePath
@export var sound : AudioStreamPlayer
func _process(_delta: float) -> void:
	if npc_path == NodePath():
		return  # no se ha asignado ninguna ruta

	var npc: Node = get_node_or_null(npc_path)
	if npc == null:
		sound.play()
		queue_free()
		set_process(false)
