extends FillGameLogic

func _ready() -> void:
	var filling_barrels: Array = get_tree().get_nodes_in_group("filling_barrels")
	barrels_to_win = clampi(barrels_to_win, 0, filling_barrels.size())
	if intro_dialogue:
		var player: Player = get_tree().get_first_node_in_group("player")
		show_custom_balloo(intro_dialogue, "", [self, player])
		await DialogueManager.dialogue_ended
	start()

func show_custom_balloo(resource,title, extra_game_states=[]):
	var my_scene = "res://scenes/quests/story_quests/FragmentOfNexus/0_FragmentOfNexus_intro/custom_balloon.tscn"
	return DialogueManager.show_dialogue_balloon_scene(my_scene,resource,title,extra_game_states)
