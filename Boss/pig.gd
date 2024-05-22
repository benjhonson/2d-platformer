extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = null
var chase = false
var ref = "res://ProgressBar.gd"


func _ready():
	get_node("AnimatedSprite2D").play("idle")
func _physics_process(delta):
	#Gravity for pig
	velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("run")
		player = get_node("../../Player/Player")
		# Check if the player node exists 
		if player:
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
			else:
				get_node("AnimatedSprite2D").flip_h = false
			velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	8
	
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false



func _on_player_death_body_entered(body):
	if body.name == "Player":
		player.up()
		if Game.pigHP == 0:
			death()
		else:
			Game.pigHP -= 5


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		player.back()
		Game.playerHP -= 2
		Game.Gold -= 7


func death():
	Game.Gold += 50
	Utils.saveGame()
	chase = false
	get_node("AnimatedSprite2D").play("death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()

