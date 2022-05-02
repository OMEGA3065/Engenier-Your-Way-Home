extends KinematicBody2D

var direction_of_sprite_1 = preload("res://assets/player/player_idle_pos_1.png")
var direction_of_sprite_2 = preload("res://assets/player/player_idle_pos_1.png")
var direction_of_sprite_3 = preload("res://assets/player/player_idle_pos_1.png")
var direction_of_sprite_4 = preload("res://assets/player/player_idle_pos_1.png")
var direction_of_sprite_5 = preload("res://assets/player/player_idle_pos_5.png")
var direction_of_sprite_6 = preload("res://assets/player/player_idle_pos_5.png")
var direction_of_sprite_7 = preload("res://assets/player/player_idle_pos_5.png")
var direction_of_sprite_8 = preload("res://assets/player/player_idle_pos_5.png")
onready var player_state = "idle"

var velocity = Vector2.ZERO

onready var player_sprite = get_node("player_idle_pos_1")
func _physics_process(delta):
	if (Input.is_action_pressed("right") 
	or Input.is_action_pressed("left") 
	or Input.is_action_pressed("up") 
	or Input.is_action_pressed("down")):
		move_and_slide(velocity)
	if (Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("up") and not Input.is_action_pressed("down")):
		player_sprite.set_texture(direction_of_sprite_1)
		velocity = Vector2(100, 0)
	elif (not Input.is_action_pressed("right") and Input.is_action_pressed("left") and not Input.is_action_pressed("up") and not Input.is_action_pressed("down")):
		player_sprite.set_texture(direction_of_sprite_5)
		velocity = Vector2(-100, 0)
	elif (not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and Input.is_action_pressed("up") and not Input.is_action_pressed("down")):
		player_sprite.set_texture(direction_of_sprite_7)
		velocity = Vector2(0, -100)
	elif (not Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not Input.is_action_pressed("up") and Input.is_action_pressed("down")):
		player_sprite.set_texture(direction_of_sprite_3)
		velocity = Vector2(0, 100)
		

