extends TileMapLayer

# Exporta la ruta al nodo SequencePuzzleHintSign
@export var hint_sign_path: NodePath
@export var soundsfx: AudioStreamPlayer
var hint_sign : SequencePuzzleHintSign

func _ready() -> void:
	hint_sign = get_node(hint_sign_path)

func _process(_delta: float) -> void:
	# Verifica si el hint_sign está marcado como resuelto
	if hint_sign and hint_sign.is_solved:
		soundsfx.play()
		queue_free()	
