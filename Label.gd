extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _t: float = 0
var _initial_position

# Called when the node enters the scene tree for the first time.
func _ready():
	_initial_position = get_position()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_t += delta*2
	set_position(_initial_position + Vector2(0, 16*cos(_t)))
	set_rotation(sin(_t*2)*0.1)
	rect_scale = Vector2((sin(_t)+1)/8+0.8, (sin(_t+0.2)+1)/8+0.8)
	
	
