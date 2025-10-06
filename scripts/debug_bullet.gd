extends Area2D


var direction: Vector2

const speed = 20

#moves bullet by setting its position to the direction varible multiplyed by speed
func _physics_process(delta: float) -> void:
	global_position += direction * speed 


func _on_timer_timeout() -> void:
	queue_free()
