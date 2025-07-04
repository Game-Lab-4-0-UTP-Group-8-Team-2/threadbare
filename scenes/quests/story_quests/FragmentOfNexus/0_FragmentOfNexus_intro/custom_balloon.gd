extends "res://scenes/ui_elements/dialogue/components/balloon.gd"

@onready var wrapper_hbox = $Balloon/PanelContainer/VBoxContainer/CharacterBox
@onready var character_image = $Balloon/PanelContainer/VBoxContainer/CharacterBox/CharacterImage

const sierra_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_player_components/character_mini/sierra7_mini.png")
const alfa_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_player_components/character_mini/alfa_mini.png")
const bt_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_player_components/character_mini/bot_mini.png")
const archivo_image = preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/checkpoint.png")

func _ready() -> void:
	super._ready()
	dialogue_label.reparent(wrapper_hbox)
	dialogue_label.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	
func change_image(image:CompressedTexture2D):
	character_image.texture=image
