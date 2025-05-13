

extends CharacterBody2D


const SPEED = 200.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO  # Reset velocity every frame
	
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1
		$AnimatedSprite2D.play("run")
	elif Input.is_key_pressed(KEY_UP):
		velocity.y -= 1
		$AnimatedSprite2D.play("run back") 
	
		
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += 1
		$AnimatedSprite2D.play("run left")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_key_pressed(KEY_LEFT):
		velocity.x -= 1
		$AnimatedSprite2D.play("run left")
		$AnimatedSprite2D.flip_h = true
		
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
		var screen_size = get_viewport_rect().size
		
	
	
	velocity = velocity.normalized() * SPEED
	print("Velocity: ", velocity)
	move_and_slide() 
	
			

var entered = false 
var current_level = 1  # Track the current level (starting at level 1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_tree().change_scene_to_file("res://maze_2.tscn")
func _on_area_2d_body_exited(body: Node2D) -> void:
	entered = false 
	
	entered = true
	
func change_scene():
	
	if current_level == 2: 
		get_tree().change_scene_to_file("res://maze_3.tscn")
