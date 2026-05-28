extends Node

var base_damage = 25
var combo = 0
var combo_timer = 0.0
var combo_reset_time = 1.2

var can_attack = true

func _process(delta):
	if combo > 0:
		combo_timer += delta
		if combo_timer >= combo_reset_time:
			combo = 0
			combo_timer = 0

func attack():
	if not can_attack:
		return

	can_attack = false

	combo += 1
	combo_timer = 0

	var final_damage = base_damage + (combo * 5)

	print("⚔ Attack! Combo:", combo, "Damage:", final_damage)

	await get_tree().create_timer(0.4).timeout
	can_attack = true
