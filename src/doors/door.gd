extends StaticBody2D

onready var door_collider = get_node("door_colistion")
onready var door_anim = get_node("door")
onready var door_frame = 0

var door_open: bool = true

func _on_door_entered(body):
	if (not door_anim.get_frame() >= 9):
		door_frame = door_anim.get_frame()
		door_anim.play("open_door", false)
		door_anim.set_frame(10-door_frame)
	else:
		door_anim.play("open_door")
	door_open = false


func _on_door_exited(body):
	if (not door_anim.get_frame() >= 9):
		door_frame = door_anim.get_frame()
		door_anim.play("close_door", false)
		door_anim.set_frame(10-door_frame)
	else:
		door_anim.play("close_door")
	door_open = true

func _process(delta):
	if (door_open and door_anim.get_frame() >= 6):
		door_collider.disabled = true
	else:
		door_collider.disabled = false
