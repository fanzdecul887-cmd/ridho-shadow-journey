extends Node

var damage = 25
var combo = 0
var combo_reset_time = 1.2
var can_attack = true

func attack():
	if not can_attack:
		return

	can_attack = false
	combo += 1

	print("Combo:", combo, "Damage:", damage)

	await get_tree().create_timer(0.4).timeout
	can_attack = true

	await get_tree().create_timer(combo_reset_time).timeout
	combo = 0
