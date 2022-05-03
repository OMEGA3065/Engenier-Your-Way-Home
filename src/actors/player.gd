extends KinematicBody2D

onready var player_state: String = "idle"
onready var player_direction: int = 1

var velocity = Vector2.ZERO

onready var player_anim_sprite = get_node("player_anim")

export var speed : int = 100

func _physics_process(delta):
	print(delta*speed)
	if (Input.is_action_pressed("right") 
	or Input.is_action_pressed("left") 
	or Input.is_action_pressed("up") 
	or Input.is_action_pressed("down")):
		move_and_slide(velocity)
		player_state = "walking"
	else:
		player_state = "idle"

	if (Input.is_action_pressed("right") 
	and not Input.is_action_pressed("left") 
	and not Input.is_action_pressed("up") 
	and not Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_1")
		velocity = Vector2(speed*delta, 0)
		player_direction = 1
	elif (not Input.is_action_pressed("right") 
	and Input.is_action_pressed("left") 
	and not Input.is_action_pressed("up") 
	and not Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_5")
		velocity = Vector2(-speed*delta, 0)
		player_direction = 5
	elif (not Input.is_action_pressed("right") 
	and not Input.is_action_pressed("left") 
	and Input.is_action_pressed("up") 
	and not Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_7")
		velocity = Vector2(0, -speed*delta)
		player_direction = 7
	elif (not Input.is_action_pressed("right") 
	and not Input.is_action_pressed("left") 
	and not Input.is_action_pressed("up") 
	and Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_3")
		velocity = Vector2(0, speed*delta)
		player_direction = 3
	elif (Input.is_action_pressed("right") 
	and not Input.is_action_pressed("left") 
	and not Input.is_action_pressed("up") 
	and Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_2")
		velocity = Vector2(speed*delta, speed*delta)
		player_direction = 2
	elif (Input.is_action_pressed("right") 
	and not Input.is_action_pressed("left") 
	and Input.is_action_pressed("up") 
	and not Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_8")
		velocity = Vector2(speed*delta, -speed*delta)
		player_direction = 8
	elif (not Input.is_action_pressed("right") 
		and Input.is_action_pressed("left") 
		and Input.is_action_pressed("up") 
		and not Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_6")
		velocity = Vector2(-speed*delta, -speed*delta)
		player_direction = 6
	elif (not Input.is_action_pressed("right") 
		and Input.is_action_pressed("left") 
		and not Input.is_action_pressed("up") 
		and Input.is_action_pressed("down")):
		player_anim_sprite.play("walking_pos_4")
		velocity = Vector2(-speed*delta, speed*delta)
		player_direction = 4
	if (player_state == "idle"):
		if (player_direction == 1):
			player_anim_sprite.play("idle_pos_1")
		elif (player_direction == 2):
			player_anim_sprite.play("idle_pos_2")
		elif (player_direction == 3):
			player_anim_sprite.play("idle_pos_3")
		elif (player_direction == 4):
			player_anim_sprite.play("idle_pos_4")
		elif (player_direction == 5):
			player_anim_sprite.play("idle_pos_5")
		elif (player_direction == 6):
			player_anim_sprite.play("idle_pos_6")
		elif (player_direction == 7):
			player_anim_sprite.play("idle_pos_7")
		elif (player_direction == 8):
			player_anim_sprite.play("idle_pos_8")
	
