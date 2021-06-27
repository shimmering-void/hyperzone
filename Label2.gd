extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var colorMatrix = RBGRotate.mkMatrix()
var _t: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_t += delta
	RBGRotate.rotateHue(colorMatrix, _t)
	var c1 = RBGRotate.apply(colorMatrix, 1, 0, 0)
	var c2 = RBGRotate.apply(colorMatrix, 0, 1, 0)
	set("custom_colors/font_color", c1)
	# set("custom_colors/font_outline_modulate", c2)
