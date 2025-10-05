extends CharacterBody2D

const speed = 200
const accel = 20

var inputs: Vector2
#calculation function
func get_input():
	#gets value of directional inputs and subtracts on the x and y axis
	inputs.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	inputs.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	#normilizes inputs to stop weird diagonal velosity shananigans
	return inputs.normalized()

#moving function
func _process(delta):
	var playerinput = get_input()
	
	#lerp is liniar interpritation. 1st value is the output, 2nd is the raw input and 3rd is the smoothnes
	velocity = lerp(velocity, playerinput * speed, delta * accel)
	
	move_and_slide()
