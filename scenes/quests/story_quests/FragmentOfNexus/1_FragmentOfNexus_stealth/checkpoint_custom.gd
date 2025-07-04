extends Checkpoint

func _on_interaction_started(player: Player, from_right: bool) -> void:
	sprite.flip_h = from_right

	show_custom_balloo(dialogue, "", [self, player])
	await DialogueManager.dialogue_ended

	sprite.flip_h = false
	interact_area.interaction_ended.emit()

func show_custom_balloo(resource,title, extra_game_states=[]):
	var my_scene = "res://scenes/quests/story_quests/FragmentOfNexus/0_FragmentOfNexus_intro/custom_balloon.tscn"
	return DialogueManager.show_dialogue_balloon_scene(my_scene,resource,title,extra_game_states)
