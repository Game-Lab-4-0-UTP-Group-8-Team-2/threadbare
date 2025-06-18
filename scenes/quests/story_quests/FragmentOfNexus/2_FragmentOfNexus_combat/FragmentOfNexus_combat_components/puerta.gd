extends TileMapLayer

@export var npc_path: NodePath

func _process(_delta: float) -> void:
	if npc_path == NodePath():
		return  # no se ha asignado ninguna ruta

	var npc: Node = get_node_or_null(npc_path)
	if npc == null:
		queue_free()
		set_process(false)
