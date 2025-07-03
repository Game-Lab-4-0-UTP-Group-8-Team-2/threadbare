extends Node2D

@onready var bt = $AnimatedSprite2D

func _ready():
	bt.play("sentado")
	
func _process(delta):
	pass
