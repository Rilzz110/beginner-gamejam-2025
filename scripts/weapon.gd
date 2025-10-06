extends CharacterBody2D

@onready var bullet_origin = $Bulletorigin

#preloads the debug bullet scene for future use
var bullet_scene = preload("res://scenes/debug bullet.tscn")

#sets the bullet spawn point and rotates the wepon to face the mouse
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("attack"):
		#sets the bullet scene to bullet
		var bullet = bullet_scene.instantiate()
		
		#sets the spawn rotation, location and direction. bullet origin is subtracted by player origin to counteract drift from spawning a local scene at a global location. same happens when get_global_mouse_position() is subtracted with global_position
		bullet.look_at(get_global_mouse_position() - global_position)
		bullet.global_position = bullet_origin.global_position
		bullet.direction = (get_global_mouse_position() - global_position).normalized()
		
		
		#spawns the bullet as a child of root
		$/root.add_child(bullet)
