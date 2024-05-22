extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jump_count = 0
var knockbackForce = 3000
var boss = null
var timer = null
var isKnockback = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")

func _ready():
	add_child(timer)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor() and jump_count != 0:
		jump_count = 0
		isKnockback = false

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up") and jump_count < Game.jump_max:
		if Game.jump_max > 2:
			Game.jump_max = 2
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if not isKnockback:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction == -1:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction == 1:
			get_node("AnimatedSprite2D").flip_h = false
		if direction:
			velocity.x = direction * SPEED
			if velocity.y == 0:
				anim.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if velocity.y == 0:
				anim.play("idle")
		if velocity.y > 0:
			anim.play("fall")

	move_and_slide()

	if Game.playerHP <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")

func back():
	boss = get_node("../../Boss/Pig")
	var knockbackDirection = (self.position - boss.position).normalized()
	velocity = knockbackDirection * knockbackForce
	isKnockback = true
	timer = get_node("Timer")
	timer.one_shot = true
	timer.start(0.5)  # Set the duration of the knockback effect

func up():
	boss = get_node("../../Boss/Pig")
	var knockbackDirection = (self.position - boss.position).normalized()
	velocity.y = knockbackDirection.y * knockbackForce
	velocity.x = knockbackDirection.x * knockbackForce




func _on_timer_timeout():
	isKnockback = false
	velocity = Vector2()
