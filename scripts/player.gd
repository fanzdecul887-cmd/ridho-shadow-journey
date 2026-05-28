extends CharacterBody2D

const SPEED = 220
const JUMP_FORCE = -450
const GRAVITY = 900

var hp = 120
var can_attack = true

func _physics_process(delta):
	# gravitasi
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# gerakan kiri kanan
	var dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = dir * SPEED

	# lompat
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE

	# attack
	if Input.is_action_just_pressed("attack"):
		attack()

	move_and_slide()

func attack():
	if not can_attack:
		return

	can_attack = false

	print("Dilz menebas dengan Astra Excalibur!")

	await get_tree().create_timer(0.4).timeout
	can_attack = true

	can_attack = false
	print("Dilz menyerang dengan Astra Excalibur!")

	await get_tree().create_timer(0.4).timeout
	can_attack = true
