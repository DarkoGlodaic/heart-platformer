extends ColorRect

signal next_level()
signal retry()


@onready var next_level_button = %NextLevelButton
@onready var retry_button = %RetryButton

func _on_next_level_button_pressed():
	next_level.emit()

func _on_retry_button_pressed():
	retry.emit()

