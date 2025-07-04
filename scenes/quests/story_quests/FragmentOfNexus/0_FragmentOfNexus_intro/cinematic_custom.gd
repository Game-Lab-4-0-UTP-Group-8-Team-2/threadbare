extends Cinematic

func _ready() -> void:
	show_custom_balloo(dialogue, "", [self])
	await DialogueManager.dialogue_ended

	if next_scene:
		(
			SceneSwitcher
			. change_to_file_with_transition(
				next_scene,
				spawn_point_path,
				Transition.Effect.FADE,
				Transition.Effect.FADE,
			)
		)
		
func show_custom_balloo(resource,title, extra_game_states=[]):
	var my_scene = "res://scenes/quests/story_quests/FragmentOfNexus/0_FragmentOfNexus_intro/custom_balloon.tscn"
	return DialogueManager.show_dialogue_balloon_scene(my_scene,resource,title,extra_game_states)
