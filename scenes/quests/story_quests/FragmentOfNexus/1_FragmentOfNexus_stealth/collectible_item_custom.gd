extends CollectibleItem

func _on_interacted(player: Player, _from_right: bool) -> void:
	z_index += 1
	animation_player.play("collected")
	await animation_player.animation_finished

	GameState.add_collected_item(item)

	if collected_dialogue:
		show_custom_balloo(collected_dialogue, dialogue_title, [self, player])
		await DialogueManager.dialogue_ended

	interact_area.end_interaction()
	queue_free()

	if next_scene:
		SceneSwitcher.change_to_file_with_transition(next_scene)
		
func show_custom_balloo(resource,title, extra_game_states=[]):
	var my_scene = "res://scenes/quests/story_quests/FragmentOfNexus/0_FragmentOfNexus_intro/custom_balloon.tscn"
	return DialogueManager.show_dialogue_balloon_scene(my_scene,resource,title,extra_game_states)
