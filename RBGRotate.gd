class_name RBGRotate

static func mkMatrix():
	return [[1,0,0],[0,1,0],[0,0,1]]

static func local_clamp(v):
	if v < 0:
		return 0
	if v > 1:
		return 1
	return v


static func rotateHue(mat, r):
	var cosA = cos(r)
	var sinA = sin(r)
	mat[0][0] = cosA + (1.0 - cosA) / 3.0
	mat[0][2] = 1.0/3.0 * (1.0 - cosA) - sqrt(1.0/3.0) * sinA
	mat[0][1] = 1.0/3.0 * (1.0 - cosA) + sqrt(1.0/3.0) * sinA
	mat[1][2] = 1.0/3.0 * (1.0 - cosA) + sqrt(1.0/3.0) * sinA
	mat[1][1] = cosA + 1.0/3.0*(1.0 - cosA)
	mat[1][0] = 1.0/3.0 * (1.0 - cosA) - sqrt(1.0/3.0) * sinA
	mat[2][1] = 1.0/3.0 * (1.0 - cosA) - sqrt(1.0/3.0) * sinA
	mat[2][0] = 1.0/3.0 * (1.0 - cosA) + sqrt(1.0/3.0) * sinA
	mat[2][2] = cosA + 1.0/3.0 * (1.0 - cosA)
	
static func apply(mat, r, g, b):
	var rx = r * mat[0][0] + g * mat[0][1] + b * mat[0][2]
	var gx = r * mat[1][0] + g * mat[1][1] + b * mat[1][2]
	var bx = r * mat[2][0] + g * mat[2][1] + b * mat[2][2]
	return Color(local_clamp(rx), local_clamp(gx), local_clamp(bx), 1)
