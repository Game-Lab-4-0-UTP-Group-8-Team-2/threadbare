extends "res://scenes/ui_elements/dialogue/components/balloon.gd"

@onready var wrapper_hbox = %CharacterBox
@onready var character_image = %CharacterImage
const sierra_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_player_components/prota-static.png")
const alpha_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/espada.png")
const bt_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/bateryCollect.png" )

func _ready() -> void:
	super._ready()
	dialogue_label.reparent(wrapper_hbox)
	dialogue_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
func change_image(image: CompressedTexture2D):
		character_image.texture = image
