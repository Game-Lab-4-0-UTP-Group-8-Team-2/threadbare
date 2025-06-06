# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
@tool
class_name Talker
extends NPC

const DEFAULT_DIALOGUE: DialogueResource = preload("uid://cc3paugq4mma4")

@export var npc_name: String
@export var dialogue: DialogueResource = DEFAULT_DIALOGUE

var _previous_look_at_side: Enums.LookAtSide = Enums.LookAtSide.UNSPECIFIED

@onready var interact_area: InteractArea = %InteractArea


func _ready() -> void:
	super._ready()
	if Engine.is_editor_hint():
		return
	interact_area.interaction_started.connect(_on_interaction_started)
	if npc_name:
		interact_area.action = "Talk to %s" % npc_name


func _on_interaction_started(player: Player, from_right: bool) -> void:
	_previous_look_at_side = look_at_side
	if look_at_side != Enums.LookAtSide.UNSPECIFIED:
		look_at_side = Enums.LookAtSide.RIGHT if from_right else Enums.LookAtSide.LEFT
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended, CONNECT_ONE_SHOT)
	DialogueManager.show_dialogue_balloon(dialogue, "", [self, player])


func _on_dialogue_ended(_dialogue_resource: DialogueResource) -> void:
	look_at_side = _previous_look_at_side
	interact_area.interaction_ended.emit()
