extends Resource
class_name Status

@export var strength: int = 0
@export var magic: int = 0
@export var health: int = 0

func copy():
	var s = Status.new()
	s.strenght = self.strenght
	s.health = self.health
	return s

func add(other: Status):
	strength += other.strength
	health += other.health
	
