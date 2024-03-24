extends CenterContainer
@onready var start_game_button = %StartGameButton
@onready var quit_button = %QuitButton
@onready var fullscreen_button = %FullscreenButton

var fullscreen_toggle = false

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	start_game_button.grab_focus()

func _on_start_game_button_pressed():
	start_game_button.disabled = true 
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_file("res://level_one.tscn")
	LevelTransition.fade_from_black()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_fullscreen_button_pressed():
	if fullscreen_toggle:
		fullscreen_toggle = false
		fullscreen_button.text = "Fullscreen"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		fullscreen_toggle = true
		fullscreen_button.text = "Windowed"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
