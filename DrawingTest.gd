extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _noise: OpenSimplexNoise
var _t: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Instantiate
	_noise = OpenSimplexNoise.new()

	# Configure
	_noise.seed = randi()
	_noise.octaves = 4
	_noise.period = 20.0
	_noise.persistence = 0.8

	# Sample
	print(_noise.get_noise_2d(1.0, 1.0))
	print(_noise.get_noise_3d(0.5, 3.0, 15.0))
	print(_noise.get_noise_4d(0.5, 1.9, 4.7, 0.0))
	
	pass # Replace with function body.

func draw_rounded_line(start, end, color):
	var size = 12
	draw_line(start, end, color, size*2)
	draw_circle(start, size*2, color)
	draw_circle(end, size*2, color)
	
func draw_shadowed_line(start, end, color, shadow_color):
	draw_rounded_line(start + Vector2(0, 16), end + Vector2(0, 16), shadow_color)
	draw_rounded_line(start, end, color)

func _draw():
	var k = 80

	for x in range(1, 20):
		for y in range(1, 10):
			var n = _noise.get_noise_2d((x+_t)*3.0, (y+_t)*3.0)
			draw_shadowed_line(Vector2(k*x, k*y),Vector2(k*x, k*y) + k*Vector2(sin(n*PI), cos(n*PI)), Color((1+cos(n*PI)/1.2)/2, (1+sin(n*n*PI)-0.2)/2, sin(n*PI), 1), Color((sin(n*PI*1.4)+1)/2, (cos(n*PI*0.3)+1)/2, tan(n*PI*1.9), 1))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_t = _t + delta
	update()
	# rotate(0.01)

