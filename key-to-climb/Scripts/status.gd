extends Resource
class_name Status

@export var strength: int = 0
@export var magic: int = 0
@export var health: int = 100

#func add(other: Status):
	#strength += other.strength
	#health += other.health
	
