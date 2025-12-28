extends Node2D
const enemy_movement_speed = 60;
var movement_direction = 1;


@onready var ray_cast_2d_right: RayCast2D = $RayCast2D_right
@onready var ray_cast_2d_left: RayCast2D = $RayCast2D_left
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	if ray_cast_2d_right.is_colliding():
		animated_sprite_2d.flip_h = true
		movement_direction = -1
	elif  ray_cast_2d_left.is_colliding():
		animated_sprite_2d.flip_h = false
		movement_direction = 1
	
	position.x += movement_direction * enemy_movement_speed * delta
