extends Sprite

var colorMatrix = RBGRotate.mkMatrix()
var _t: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_t += delta
#	RBGRotate.rotateHue(colorMatrix, _t)
#	var c1 = RBGRotate.apply(colorMatrix, 0, 0, 1)
#	set("modulate", c1)
	rotation = sin(_t)*0.1
	scale = Vector2(1+cos(_t)*8, 1+sin(_t)*8)
	pass
