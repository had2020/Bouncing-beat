extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Click"):
		$Item_amount_label.text = "Ball Amount: " + str(Global.item_amount)
		$Item_amount_label.visible = true
		$Item_amount_label/Timer.start()

func _on_timer_timeout():
	$Item_amount_label.visible = false
