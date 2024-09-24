extends RigidBody2D

var ball = preload("res://replicating_ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.item_amount = Global.item_amount + 1
	apply_force(Vector2(100, 100))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area):
	if area.is_in_group("Edge"):
		apply_force(Vector2(100, 100))
		$AudioStreamPlayer2D.play()
		var ball_loaded = ball.instantiate()
		add_sibling(ball_loaded)
		#ball_loaded.global_position = self.global_position

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Quit"):
		pass
