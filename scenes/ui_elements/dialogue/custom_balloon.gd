extends "res://scenes/ui_elements/dialogue/components/balloon.gd"

@onready var wrapper_hbox = $Balloon/PanelContainer/VBoxContainer/HBoxContainer/HBoxCharacter
@onready var character_image = $Balloon/PanelContainer/VBoxContainer/HBoxContainer/HBoxCharacter/TextureCharacter

func _ready() -> void:
	super._ready()
	dialogue_label.repartment(wrapper_hbox)
	dialogue_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL

func change_image(image: CompressedTexture2D):
	character_image.texture = image
