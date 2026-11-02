extends CharacterBody2D
var candy_count = 0
func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()


func _on_pickup_area_area_2d_area_entered(area):
	if area.is_in_group("Candy") and not $HeldCandy.visible:
		area.queue_free()
		$HeldCandy.visible = true
	if area.is_in_group("basket") and $HeldCandy.visible:
		$HeldCandy.visible = false
		candy_count += 1
		$CanvasLayer/CandyCountDisplay.text = "Candies: " + str(candy_count)
