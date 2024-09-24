extends RigidBody2D

var ball = preload("res://replicating_ball.tscn")

var below_start_time = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.item_amount = Global.item_amount + 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if below_start_time == true:
		var randomint = randi_range(0,1)
		var start_forcex = 0
		if randomint == 0:
			start_forcex = 1000
		if randomint == 1:
			start_forcex = -1000
		apply_force(Vector2(start_forcex, randf_range(-100,100)))

func _on_area_2d_area_entered(area):
	if area.is_in_group("Edge"):
		apply_force(Vector2(randf_range(-100,100), randf_range(-100,100)))
		$AudioStreamPlayer2D.play()
		var ball_loaded = ball.instantiate()
		add_sibling(ball_loaded)
		#ball_loaded.global_position = self.global_position

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Quit"):
		pass

func _on_timer_timeout() -> void:
	below_start_time = false

func change_to_random_color():
	self.set_visibility_layer_bit(randi_range(0, 255), randi_range(0, 255))
