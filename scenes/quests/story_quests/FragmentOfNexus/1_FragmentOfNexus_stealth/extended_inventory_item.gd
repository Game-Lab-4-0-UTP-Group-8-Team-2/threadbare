@tool
class_name ExtendedInventoryItem
extends InventoryItem


enum ExtendedItemType {
	BLADE,
	BATERY
}

const EXTENDED_TEXTURES: Dictionary[ExtendedItemType, Texture2D] = {
	ExtendedItemType.BLADE: preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/espada.png"),
	ExtendedItemType.BATERY: preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/bateryCollect.png")
}

const EXTENDED_WORLD_TEXTURES: Dictionary[ExtendedItemType, Texture2D] = {
	ExtendedItemType.BLADE: preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/espada.png"),
	ExtendedItemType.BATERY: preload("res://scenes/quests/story_quests/FragmentOfNexus/FragmentOfNexus_map_component/bateryCollect.png")
}

@export var extended_type: ExtendedItemType


func is_extended_type() -> bool:
	return true


func texture() -> Texture2D:
	return EXTENDED_TEXTURES[extended_type]


func get_world_texture() -> Texture2D:
	return EXTENDED_WORLD_TEXTURES.get(extended_type, null)

func type_name() -> String:
	return ItemType.find_key(type).to_pascal_case()


func same_type_as(other_item: InventoryItem) -> bool:
	if other_item is ExtendedInventoryItem:
		return extended_type == other_item.extend_type
	return false


static func with_extended_type(a_type: ExtendedItemType) -> ExtendedInventoryItem:
	var item := ExtendedInventoryItem.new()
	item.extend_type = a_type
	return item


static func extended_item_types() -> Array:
	return ExtendedItemType.values()
