extends CharacterBody2D

var hp = 500
var max_hp = 500

var speed = 60
var phase = 1

var can_take_damage = true

func _physics_process(delta):
	var player = get_tree().get_first_node_in_group("player")

	if player:
		var dir = sign(player.global_position.x - global_position.x)
		velocity.x = dir * speed

	move_and_slide()

	check_phase()

func take_damage(amount):
	if not can_take_damage:
		return

	hp -= amount
	print("👹 Abaddon HP:", hp)

	if hp <= 0:
		die()

func check_phase():
	if hp <= 300 and phase == 1:
		phase = 2
		speed = 90
		print("🔥 ABADDON PHASE 2: RAGE MODE")

	if hp <= 150 and phase == 2:
		phase = 3
		speed = 130
		print("🔥 ABADDON PHASE 3: INFERNAL OVERDRIVE")

func die():
	print("💀 ABADDON DEFEATED")
	queue_free()
