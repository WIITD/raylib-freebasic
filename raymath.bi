#pragma once

#include once "crt/math.bi"

extern "C"

#define RAYMATH_H
#define MatrixToFloat(mat) MatrixToFloatV(mat).v
#define Vector3ToFloat(vec) Vector3ToFloatV(vec).v

#if (not defined(RAYMATH_HEADER_ONLY)) and not defined(RAYLIB_H)
  type Vector2
	x as single
	y as single
	declare constructor()
	declare constructor(x as single, y as single)
  end type

  constructor Vector2(x as single, y as single)
	this.x = x
	this.y = y
  end constructor

  constructor Vector2()
  end constructor

  type Vector3
	x as single
	y as single
	z as single
	declare constructor()
	declare constructor(x as single, y as single, z as single)
  end type

  constructor Vector3()
  end constructor

  constructor Vector3(x as single, y as single, z as single)
	this.x = x
	this.y = y
	this.z = z
  end constructor

  type Vector4
	x as single
	y as single
	z as single
	w as single
	declare constructor()
	declare constructor(x as single, y as single, z as single, w as single)
  end type

  constructor Vector4()
  end constructor

  constructor Vector4(x as single, y as single, z as single, w as single)
	this.x = x
	this.y = y
	this.z = z
	this.w = w
  end constructor

  type Quaternion as Vector4

  type Matrix
	m0 as single
	m4 as single
	m8 as single
	m12 as single
	m1 as single
	m5 as single
	m9 as single
	m13 as single
	m2 as single
	m6 as single
	m10 as single
	m14 as single
	m3 as single
	m7 as single
	m11 as single
	m15 as single
  end type

  type Color
	r as ubyte
	g as ubyte
	b as ubyte
	a as ubyte
	declare constructor()
	declare constructor(r as ubyte, g as ubyte, b as ubyte, a as ubyte)
  end type

  constructor Color()
  end constructor

  constructor Color(r as ubyte, g as ubyte, b as ubyte, a as ubyte)
	this.r = r
	this.g = g
	this.b = b
	this.a = a
  end constructor

  type Rectangle
	x as single
	y as single
	width as single
	height as single
	declare constructor()
	declare constructor(x as single, y as single, width as single, height as single)
  end type

  constructor Rectangle()
  end constructor

  constructor Rectangle(x as single, y as single, width as single, height as single)
	this.x = x
	this.y = y
	this.width = width
	this.height = height
  end constructor

  type Image
	data as any ptr
	width as long
	height as long
	mipmaps as long
	format as long
  end type

  type Texture
	id as ulong
	width as long
	height as long
	mipmaps as long
	format as long
  end type

  type Texture2D as Texture
  type TextureCubemap as Texture

  type RenderTexture
	id as ulong
	texture as Texture
	depth as Texture
  end type

  type RenderTexture2D as RenderTexture

  type NPatchInfo
	source as Rectangle
	left as long
	top as long
	right as long
	bottom as long
	layout as long
  end type
#endif

type float3
	v(0 to 2) as single
end type

type float16
	v(0 to 15) as single
end type

private function Clamp(byval value as single, byval min as single, byval max as single) as single
	dim res as const single = iif(value < min, min, value)
	return iif(res > max, max, res)
end function

private function Lerp(byval start as single, byval ends as single, byval amount as single) as single
	return start + (amount * (ends - start))
end function

private function Normalize(byval value as single, byval start as single, byval ends as single) as single
	return (value - start) / (ends - start)
end function

private function Remap(byval value as single, byval inputStart as single, byval inputEnd as single, byval outputStart as single, byval outputEnd as single) as single
	return (((value - inputStart) / (inputEnd - inputStart)) * (outputEnd - outputStart)) + outputStart
end function

private function Vector2Zero() as Vector2
	dim result as Vector2 = Vector2(0.0f, 0.0f)
	return result
end function

private function Vector2One() as Vector2
	dim result as Vector2 = Vector2(1.0f, 1.0f)
	return result
end function

private function Vector2Add(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = Vector2(v1.x + v2.x, v1.y + v2.y)
	return result
end function

private function Vector2AddValue(byval v as Vector2, byval add as single) as Vector2
	dim result as Vector2 = Vector2(v.x + add, v.y + add)
	return result
end function

private function Vector2Subtract(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = Vector2(v1.x - v2.x, v1.y - v2.y)
	return result
end function

private function Vector2SubtractValue(byval v as Vector2, byval subs as single) as Vector2
	dim result as Vector2 = Vector2(v.x - subs, v.y - subs)
	return result
end function

private function Vector2Length(byval v as Vector2) as single
	dim result as single = sqrtf((v.x * v.x) + (v.y * v.y))
	return result
end function

private function Vector2LengthSqr(byval v as Vector2) as single
	dim result as single = (v.x * v.x) + (v.y * v.y)
	return result
end function

private function Vector2DotProduct(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = (v1.x * v2.x) + (v1.y * v2.y)
	return result
end function

private function Vector2Distance(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = sqrtf(((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y)))
	return result
end function

private function Vector2Angle(byval v1 as Vector2, byval v2 as Vector2) as single
	dim result as single = atan2f(v2.y - v1.y, v2.x - v1.x) * (180.0f / 3.14159265358979323846f)
	if result < 0 then
		result += 360.0f
	end if
	return result
end function

private function Vector2Scale(byval v as Vector2, byval scale as single) as Vector2
	dim result as Vector2 = Vector2(v.x * scale, v.y * scale)
	return result
end function

private function Vector2Multiply(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = Vector2(v1.x * v2.x, v1.y * v2.y)
	return result
end function

private function Vector2Negate(byval v as Vector2) as Vector2
	dim result as Vector2 = Vector2(-v.x, -v.y)
	return result
end function

private function Vector2Divide(byval v1 as Vector2, byval v2 as Vector2) as Vector2
	dim result as Vector2 = Vector2(v1.x / v2.x, v1.y / v2.y)
	return result
end function

private function Vector2Normalize(byval v as Vector2) as Vector2
	dim result as Vector2 = Vector2Scale(v, 1 / Vector2Length(v))
	return result
end function

private function Vector2Lerp(byval v1 as Vector2, byval v2 as Vector2, byval amount as single) as Vector2
	dim result as Vector2
	result.x = v1.x + (amount * (v2.x - v1.x))
	result.y = v1.y + (amount * (v2.y - v1.y))
	return result
end function

private function Vector2Reflect(byval v as Vector2, byval normal as Vector2) as Vector2
	dim result as Vector2
	dim dotProduct as single = Vector2DotProduct(v, normal)
	result.x = v.x - ((2.0f * normal.x) * dotProduct)
	result.y = v.y - ((2.0f * normal.y) * dotProduct)
	return result
end function

private function Vector2Rotate(byval v as Vector2, byval degs as single) as Vector2
	dim rads as single = degs * (3.14159265358979323846f / 180.0f)
	dim result as Vector2 = Vector2((v.x * cosf(rads)) - (v.y * sinf(rads)), (v.x * sinf(rads)) + (v.y * cosf(rads)))
	return result
end function

private function Vector2MoveTowards(byval v as Vector2, byval target as Vector2, byval maxDistance as single) as Vector2
	dim result as Vector2
	dim dx as single = target.x - v.x
	dim dy as single = target.y - v.y
	dim value as single = (dx * dx) + (dy * dy)
	if (value = 0) orelse ((maxDistance >= 0) andalso (value <= (maxDistance * maxDistance))) then
		result = target
	end if
	dim dist as single = sqrtf(value)
	result.x = v.x + ((dx / dist) * maxDistance)
	result.y = v.y + ((dy / dist) * maxDistance)
	return result
end function

private function Vector3Zero() as Vector3
	dim result as Vector3 = Vector3(0.0f, 0.0f, 0.0f)
	return result
end function

private function Vector3One() as Vector3
	dim result as Vector3 = Vector3(1.0f, 1.0f, 1.0f)
	return result
end function

private function Vector3Add(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = Vector3(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
	return result
end function

private function Vector3AddValue(byval v as Vector3, byval add as single) as Vector3
	dim result as Vector3 = Vector3(v.x + add, v.y + add, v.z + add)
	return result
end function

private function Vector3Subtract(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = Vector3(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
	return result
end function

private function Vector3SubtractValue(byval v as Vector3, byval subs as single) as Vector3
	dim result as Vector3 = Vector3(v.x - subs, v.y - subs, v.z - subs)
	return result
end function

private function Vector3Scale(byval v as Vector3, byval scalar as single) as Vector3
	dim result as Vector3 = Vector3(v.x * scalar, v.y * scalar, v.z * scalar)
	return result
end function

private function Vector3Multiply(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = Vector3(v1.x * v2.x, v1.y * v2.y, v1.z * v2.z)
	return result
end function

private function Vector3CrossProduct(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = Vector3((v1.y * v2.z) - (v1.z * v2.y), (v1.z * v2.x) - (v1.x * v2.z), (v1.x * v2.y) - (v1.y * v2.x))
	return result
end function

private function Vector3Perpendicular(byval v as Vector3) as Vector3
	dim result as Vector3
	dim min as single = csng(fabs(v.x))
	dim cardinalAxis as Vector3 = Vector3(1.0f, 0.0f, 0.0f)
	if fabs(v.y) < min then
		min = csng(fabs(v.y))
		dim tmp as Vector3 = Vector3(0.0f, 1.0f, 0.0f)
		cardinalAxis = tmp
	end if
	if fabs(v.z) < min then
		dim tmp as Vector3 = Vector3(0.0f, 0.0f, 1.0f)
		cardinalAxis = tmp
	end if
	result = Vector3CrossProduct(v, cardinalAxis)
	return result
end function

private function Vector3Length(byval v as const Vector3) as single
	dim result as single = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z))
	return result
end function

private function Vector3LengthSqr(byval v as const Vector3) as single
	dim result as single = ((v.x * v.x) + (v.y * v.y)) + (v.z * v.z)
	return result
end function

private function Vector3DotProduct(byval v1 as Vector3, byval v2 as Vector3) as single
	dim result as single = ((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z)
	return result
end function

private function Vector3Distance(byval v1 as Vector3, byval v2 as Vector3) as single
	dim dx as single = v2.x - v1.x
	dim dy as single = v2.y - v1.y
	dim dz as single = v2.z - v1.z
	dim result as single = sqrtf(((dx * dx) + (dy * dy)) + (dz * dz))
	return result
end function

private function Vector3Negate(byval v as Vector3) as Vector3
	dim result as Vector3 = Vector3(-v.x, -v.y, -v.z)
	return result
end function

private function Vector3Divide(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3 = Vector3(v1.x / v2.x, v1.y / v2.y, v1.z / v2.z)
	return result
end function

private function Vector3Normalize(byval v as Vector3) as Vector3
	dim result as Vector3 = v
	dim length as single
	dim ilength as single
	length = Vector3Length(v)
	if length = 0.0f then
		length = 1.0f
	end if
	ilength = 1.0f / length
	result.x *= ilength
	result.y *= ilength
	result.z *= ilength
	return result
end function

private sub Vector3OrthoNormalize(byval v1 as Vector3 ptr, byval v2 as Vector3 ptr)
	(*v1) = Vector3Normalize(*v1)
	dim vn as Vector3 = Vector3CrossProduct(*v1, *v2)
	vn = Vector3Normalize(vn)
	(*v2) = Vector3CrossProduct(vn, *v1)
end sub

private function Vector3Transform(byval v as Vector3, byval mat as Matrix) as Vector3
	dim result as Vector3
	dim x as single = v.x
	dim y as single = v.y
	dim z as single = v.z
	result.x = (((mat.m0 * x) + (mat.m4 * y)) + (mat.m8 * z)) + mat.m12
	result.y = (((mat.m1 * x) + (mat.m5 * y)) + (mat.m9 * z)) + mat.m13
	result.z = (((mat.m2 * x) + (mat.m6 * y)) + (mat.m10 * z)) + mat.m14
	return result
end function

private function Vector3RotateByQuaternion(byval v as Vector3, byval q as Quaternion) as Vector3
	dim result as Vector3
	result.x = ((v.x * ((((q.x * q.x) + (q.w * q.w)) - (q.y * q.y)) - (q.z * q.z))) + (v.y * (((2 * q.x) * q.y) - ((2 * q.w) * q.z)))) + (v.z * (((2 * q.x) * q.z) + ((2 * q.w) * q.y)))
	result.y = ((v.x * (((2 * q.w) * q.z) + ((2 * q.x) * q.y))) + (v.y * ((((q.w * q.w) - (q.x * q.x)) + (q.y * q.y)) - (q.z * q.z)))) + (v.z * ((((-2) * q.w) * q.x) + ((2 * q.y) * q.z)))
	result.z = ((v.x * ((((-2) * q.w) * q.y) + ((2 * q.x) * q.z))) + (v.y * (((2 * q.w) * q.x) + ((2 * q.y) * q.z)))) + (v.z * ((((q.w * q.w) - (q.x * q.x)) - (q.y * q.y)) + (q.z * q.z)))
	return result
end function

private function Vector3Lerp(byval v1 as Vector3, byval v2 as Vector3, byval amount as single) as Vector3
	dim result as Vector3
	result.x = v1.x + (amount * (v2.x - v1.x))
	result.y = v1.y + (amount * (v2.y - v1.y))
	result.z = v1.z + (amount * (v2.z - v1.z))
	return result
end function

private function Vector3Reflect(byval v as Vector3, byval normal as Vector3) as Vector3
	dim result as Vector3
	dim dotProduct as single = Vector3DotProduct(v, normal)
	result.x = v.x - ((2.0f * normal.x) * dotProduct)
	result.y = v.y - ((2.0f * normal.y) * dotProduct)
	result.z = v.z - ((2.0f * normal.z) * dotProduct)
	return result
end function

private function Vector3Min(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3
	result.x = fminf(v1.x, v2.x)
	result.y = fminf(v1.y, v2.y)
	result.z = fminf(v1.z, v2.z)
	return result
end function

private function Vector3Max(byval v1 as Vector3, byval v2 as Vector3) as Vector3
	dim result as Vector3
	result.x = fmaxf(v1.x, v2.x)
	result.y = fmaxf(v1.y, v2.y)
	result.z = fmaxf(v1.z, v2.z)
	return result
end function

private function Vector3Barycenter(byval p as Vector3, byval a as Vector3, byval b as Vector3, byval c as Vector3) as Vector3
	dim v0 as Vector3 = Vector3Subtract(b, a)
	dim v1 as Vector3 = Vector3Subtract(c, a)
	dim v2 as Vector3 = Vector3Subtract(p, a)
	dim d00 as single = Vector3DotProduct(v0, v0)
	dim d01 as single = Vector3DotProduct(v0, v1)
	dim d11 as single = Vector3DotProduct(v1, v1)
	dim d20 as single = Vector3DotProduct(v2, v0)
	dim d21 as single = Vector3DotProduct(v2, v1)
	dim denom as single = (d00 * d11) - (d01 * d01)
	dim result as Vector3
	result.y = ((d11 * d20) - (d01 * d21)) / denom
	result.z = ((d00 * d21) - (d01 * d20)) / denom
	result.x = 1.0f - (result.z + result.y)
	return result
end function

private function Vector3ToFloatV(byval v as Vector3) as float3
	dim buffer as float3
	buffer.v(0) = v.x
	buffer.v(1) = v.y
	buffer.v(2) = v.z
	return buffer
end function

private function MatrixDeterminant(byval mat as Matrix) as single
	dim a00 as single = mat.m0
	dim a01 as single = mat.m1
	dim a02 as single = mat.m2
	dim a03 as single = mat.m3
	dim a10 as single = mat.m4
	dim a11 as single = mat.m5
	dim a12 as single = mat.m6
	dim a13 as single = mat.m7
	dim a20 as single = mat.m8
	dim a21 as single = mat.m9
	dim a22 as single = mat.m10
	dim a23 as single = mat.m11
	dim a30 as single = mat.m12
	dim a31 as single = mat.m13
	dim a32 as single = mat.m14
	dim a33 as single = mat.m15
	dim result as single = (((((((((((((((((((((((((a30 * a21) * a12) * a03) - (((a20 * a31) * a12) * a03)) - (((a30 * a11) * a22) * a03)) + (((a10 * a31) * a22) * a03)) + (((a20 * a11) * a32) * a03)) - (((a10 * a21) * a32) * a03)) - (((a30 * a21) * a02) * a13)) + (((a20 * a31) * a02) * a13)) + (((a30 * a01) * a22) * a13)) - (((a00 * a31) * a22) * a13)) - (((a20 * a01) * a32) * a13)) + (((a00 * a21) * a32) * a13)) + (((a30 * a11) * a02) * a23)) - (((a10 * a31) * a02) * a23)) - (((a30 * a01) * a12) * a23)) + (((a00 * a31) * a12) * a23)) + (((a10 * a01) * a32) * a23)) - (((a00 * a11) * a32) * a23)) - (((a20 * a11) * a02) * a33)) + (((a10 * a21) * a02) * a33)) + (((a20 * a01) * a12) * a33)) - (((a00 * a21) * a12) * a33)) - (((a10 * a01) * a22) * a33)) + (((a00 * a11) * a22) * a33)
	return result
end function

private function MatrixTrace(byval mat as Matrix) as single
	dim result as single = ((mat.m0 + mat.m5) + mat.m10) + mat.m15
	return result
end function

private function MatrixTranspose(byval mat as Matrix) as Matrix
	dim result as Matrix = (0)
	result.m0 = mat.m0
	result.m1 = mat.m4
	result.m2 = mat.m8
	result.m3 = mat.m12
	result.m4 = mat.m1
	result.m5 = mat.m5
	result.m6 = mat.m9
	result.m7 = mat.m13
	result.m8 = mat.m2
	result.m9 = mat.m6
	result.m10 = mat.m10
	result.m11 = mat.m14
	result.m12 = mat.m3
	result.m13 = mat.m7
	result.m14 = mat.m11
	result.m15 = mat.m15
	return result
end function

private function MatrixInvert(byval mat as Matrix) as Matrix
	dim result as Matrix = (0)
	dim a00 as single = mat.m0
	dim a01 as single = mat.m1
	dim a02 as single = mat.m2
	dim a03 as single = mat.m3
	dim a10 as single = mat.m4
	dim a11 as single = mat.m5
	dim a12 as single = mat.m6
	dim a13 as single = mat.m7
	dim a20 as single = mat.m8
	dim a21 as single = mat.m9
	dim a22 as single = mat.m10
	dim a23 as single = mat.m11
	dim a30 as single = mat.m12
	dim a31 as single = mat.m13
	dim a32 as single = mat.m14
	dim a33 as single = mat.m15
	dim b00 as single = (a00 * a11) - (a01 * a10)
	dim b01 as single = (a00 * a12) - (a02 * a10)
	dim b02 as single = (a00 * a13) - (a03 * a10)
	dim b03 as single = (a01 * a12) - (a02 * a11)
	dim b04 as single = (a01 * a13) - (a03 * a11)
	dim b05 as single = (a02 * a13) - (a03 * a12)
	dim b06 as single = (a20 * a31) - (a21 * a30)
	dim b07 as single = (a20 * a32) - (a22 * a30)
	dim b08 as single = (a20 * a33) - (a23 * a30)
	dim b09 as single = (a21 * a32) - (a22 * a31)
	dim b10 as single = (a21 * a33) - (a23 * a31)
	dim b11 as single = (a22 * a33) - (a23 * a32)
	dim invDet as single = 1.0f / ((((((b00 * b11) - (b01 * b10)) + (b02 * b09)) + (b03 * b08)) - (b04 * b07)) + (b05 * b06))
	result.m0 = (((a11 * b11) - (a12 * b10)) + (a13 * b09)) * invDet
	result.m1 = ((((-a01) * b11) + (a02 * b10)) - (a03 * b09)) * invDet
	result.m2 = (((a31 * b05) - (a32 * b04)) + (a33 * b03)) * invDet
	result.m3 = ((((-a21) * b05) + (a22 * b04)) - (a23 * b03)) * invDet
	result.m4 = ((((-a10) * b11) + (a12 * b08)) - (a13 * b07)) * invDet
	result.m5 = (((a00 * b11) - (a02 * b08)) + (a03 * b07)) * invDet
	result.m6 = ((((-a30) * b05) + (a32 * b02)) - (a33 * b01)) * invDet
	result.m7 = (((a20 * b05) - (a22 * b02)) + (a23 * b01)) * invDet
	result.m8 = (((a10 * b10) - (a11 * b08)) + (a13 * b06)) * invDet
	result.m9 = ((((-a00) * b10) + (a01 * b08)) - (a03 * b06)) * invDet
	result.m10 = (((a30 * b04) - (a31 * b02)) + (a33 * b00)) * invDet
	result.m11 = ((((-a20) * b04) + (a21 * b02)) - (a23 * b00)) * invDet
	result.m12 = ((((-a10) * b09) + (a11 * b07)) - (a12 * b06)) * invDet
	result.m13 = (((a00 * b09) - (a01 * b07)) + (a02 * b06)) * invDet
	result.m14 = ((((-a30) * b03) + (a31 * b01)) - (a32 * b00)) * invDet
	result.m15 = (((a20 * b03) - (a21 * b01)) + (a22 * b00)) * invDet
	return result
end function

private function MatrixNormalize(byval mat as Matrix) as Matrix
	dim result as Matrix = (0)
	dim det as single = MatrixDeterminant(mat)
	result.m0 = mat.m0 / det
	result.m1 = mat.m1 / det
	result.m2 = mat.m2 / det
	result.m3 = mat.m3 / det
	result.m4 = mat.m4 / det
	result.m5 = mat.m5 / det
	result.m6 = mat.m6 / det
	result.m7 = mat.m7 / det
	result.m8 = mat.m8 / det
	result.m9 = mat.m9 / det
	result.m10 = mat.m10 / det
	result.m11 = mat.m11 / det
	result.m12 = mat.m12 / det
	result.m13 = mat.m13 / det
	result.m14 = mat.m14 / det
	result.m15 = mat.m15 / det
	return result
end function

private function MatrixIdentity() as Matrix
    dim as Matrix result
    result.m0 = 1
    result.m1 = 0
    result.m2 = 0
    result.m3 = 0
    result.m4 = 0
    result.m5 = 1
    result.m6 = 0
    result.m7 = 0
    result.m8 = 0
    result.m9 = 0
    result.m10 = 1
    result.m11 = 0
    result.m12 = 0
    result.m13 = 0
    result.m14 = 0
    result.m15 = 1
	return result
end function

private function MatrixAdd(byval lefts as Matrix, byval rights as Matrix) as Matrix
	dim result as Matrix = MatrixIdentity()
	result.m0 = lefts.m0 + rights.m0
	result.m1 = lefts.m1 + rights.m1
	result.m2 = lefts.m2 + rights.m2
	result.m3 = lefts.m3 + rights.m3
	result.m4 = lefts.m4 + rights.m4
	result.m5 = lefts.m5 + rights.m5
	result.m6 = lefts.m6 + rights.m6
	result.m7 = lefts.m7 + rights.m7
	result.m8 = lefts.m8 + rights.m8
	result.m9 = lefts.m9 + rights.m9
	result.m10 = lefts.m10 + rights.m10
	result.m11 = lefts.m11 + rights.m11
	result.m12 = lefts.m12 + rights.m12
	result.m13 = lefts.m13 + rights.m13
	result.m14 = lefts.m14 + rights.m14
	result.m15 = lefts.m15 + rights.m15
	return result
end function

private function MatrixSubtract(byval lefts as Matrix, byval rights as Matrix) as Matrix
	dim result as Matrix = MatrixIdentity()
	result.m0 = lefts.m0 - rights.m0
	result.m1 = lefts.m1 - rights.m1
	result.m2 = lefts.m2 - rights.m2
	result.m3 = lefts.m3 - rights.m3
	result.m4 = lefts.m4 - rights.m4
	result.m5 = lefts.m5 - rights.m5
	result.m6 = lefts.m6 - rights.m6
	result.m7 = lefts.m7 - rights.m7
	result.m8 = lefts.m8 - rights.m8
	result.m9 = lefts.m9 - rights.m9
	result.m10 = lefts.m10 - rights.m10
	result.m11 = lefts.m11 - rights.m11
	result.m12 = lefts.m12 - rights.m12
	result.m13 = lefts.m13 - rights.m13
	result.m14 = lefts.m14 - rights.m14
	result.m15 = lefts.m15 - rights.m15
	return result
end function

private function MatrixMultiply(byval lefts as Matrix, byval rights as Matrix) as Matrix
	dim result as Matrix = (0)
	result.m0 = (((lefts.m0 * rights.m0) + (lefts.m1 * rights.m4)) + (lefts.m2 * rights.m8)) + (lefts.m3 * rights.m12)
	result.m1 = (((lefts.m0 * rights.m1) + (lefts.m1 * rights.m5)) + (lefts.m2 * rights.m9)) + (lefts.m3 * rights.m13)
	result.m2 = (((lefts.m0 * rights.m2) + (lefts.m1 * rights.m6)) + (lefts.m2 * rights.m10)) + (lefts.m3 * rights.m14)
	result.m3 = (((lefts.m0 * rights.m3) + (lefts.m1 * rights.m7)) + (lefts.m2 * rights.m11)) + (lefts.m3 * rights.m15)
	result.m4 = (((lefts.m4 * rights.m0) + (lefts.m5 * rights.m4)) + (lefts.m6 * rights.m8)) + (lefts.m7 * rights.m12)
	result.m5 = (((lefts.m4 * rights.m1) + (lefts.m5 * rights.m5)) + (lefts.m6 * rights.m9)) + (lefts.m7 * rights.m13)
	result.m6 = (((lefts.m4 * rights.m2) + (lefts.m5 * rights.m6)) + (lefts.m6 * rights.m10)) + (lefts.m7 * rights.m14)
	result.m7 = (((lefts.m4 * rights.m3) + (lefts.m5 * rights.m7)) + (lefts.m6 * rights.m11)) + (lefts.m7 * rights.m15)
	result.m8 = (((lefts.m8 * rights.m0) + (lefts.m9 * rights.m4)) + (lefts.m10 * rights.m8)) + (lefts.m11 * rights.m12)
	result.m9 = (((lefts.m8 * rights.m1) + (lefts.m9 * rights.m5)) + (lefts.m10 * rights.m9)) + (lefts.m11 * rights.m13)
	result.m10 = (((lefts.m8 * rights.m2) + (lefts.m9 * rights.m6)) + (lefts.m10 * rights.m10)) + (lefts.m11 * rights.m14)
	result.m11 = (((lefts.m8 * rights.m3) + (lefts.m9 * rights.m7)) + (lefts.m10 * rights.m11)) + (lefts.m11 * rights.m15)
	result.m12 = (((lefts.m12 * rights.m0) + (lefts.m13 * rights.m4)) + (lefts.m14 * rights.m8)) + (lefts.m15 * rights.m12)
	result.m13 = (((lefts.m12 * rights.m1) + (lefts.m13 * rights.m5)) + (lefts.m14 * rights.m9)) + (lefts.m15 * rights.m13)
	result.m14 = (((lefts.m12 * rights.m2) + (lefts.m13 * rights.m6)) + (lefts.m14 * rights.m10)) + (lefts.m15 * rights.m14)
	result.m15 = (((lefts.m12 * rights.m3) + (lefts.m13 * rights.m7)) + (lefts.m14 * rights.m11)) + (lefts.m15 * rights.m15)
	return result
end function

private function MatrixTranslate(byval x as single, byval y as single, byval z as single) as Matrix
	dim result as Matrix = (1.0f, 0.0f, 0.0f, x, 0.0f, 1.0f, 0.0f, y, 0.0f, 0.0f, 1.0f, z, 0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function MatrixRotate(byval axis as Vector3, byval angle as single) as Matrix
	dim result as Matrix = (0)
	dim x as single = axis.x
	dim y as single = axis.y
	dim z as single = axis.z
	dim lengthSquared as single = ((x * x) + (y * y)) + (z * z)
	if (lengthSquared <> 1.0f) andalso (lengthSquared <> 0.0f) then
		dim inverseLength as single = 1.0f / sqrtf(lengthSquared)
		x *= inverseLength
		y *= inverseLength
		z *= inverseLength
	end if
	dim sinres as single = sinf(angle)
	dim cosres as single = cosf(angle)
	dim t as single = 1.0f - cosres
	result.m0 = ((x * x) * t) + cosres
	result.m1 = ((y * x) * t) + (z * sinres)
	result.m2 = ((z * x) * t) - (y * sinres)
	result.m3 = 0.0f
	result.m4 = ((x * y) * t) - (z * sinres)
	result.m5 = ((y * y) * t) + cosres
	result.m6 = ((z * y) * t) + (x * sinres)
	result.m7 = 0.0f
	result.m8 = ((x * z) * t) + (y * sinres)
	result.m9 = ((y * z) * t) - (x * sinres)
	result.m10 = ((z * z) * t) + cosres
	result.m11 = 0.0f
	result.m12 = 0.0f
	result.m13 = 0.0f
	result.m14 = 0.0f
	result.m15 = 1.0f
	return result
end function

private function MatrixRotateX(byval angle as single) as Matrix
	dim result as Matrix = MatrixIdentity()
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.m5 = cosres
	result.m6 = -sinres
	result.m9 = sinres
	result.m10 = cosres
	return result
end function

private function MatrixRotateY(byval angle as single) as Matrix
	dim result as Matrix = MatrixIdentity()
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.m0 = cosres
	result.m2 = sinres
	result.m8 = -sinres
	result.m10 = cosres
	return result
end function

private function MatrixRotateZ(byval angle as single) as Matrix
	dim result as Matrix = MatrixIdentity()
	dim cosres as single = cosf(angle)
	dim sinres as single = sinf(angle)
	result.m0 = cosres
	result.m1 = -sinres
	result.m4 = sinres
	result.m5 = cosres
	return result
end function

private function MatrixRotateXYZ(byval ang as Vector3) as Matrix
	dim result as Matrix = MatrixIdentity()
	dim cosz as single = cosf(-ang.z)
	dim sinz as single = sinf(-ang.z)
	dim cosy as single = cosf(-ang.y)
	dim siny as single = sinf(-ang.y)
	dim cosx as single = cosf(-ang.x)
	dim sinx as single = sinf(-ang.x)
	result.m0 = cosz * cosy
	result.m4 = ((cosz * siny) * sinx) - (sinz * cosx)
	result.m8 = ((cosz * siny) * cosx) + (sinz * sinx)
	result.m1 = sinz * cosy
	result.m5 = ((sinz * siny) * sinx) + (cosz * cosx)
	result.m9 = ((sinz * siny) * cosx) - (cosz * sinx)
	result.m2 = -siny
	result.m6 = cosy * sinx
	result.m10 = cosy * cosx
	return result
end function

private function MatrixRotateZYX(byval ang as Vector3) as Matrix
	dim result as Matrix = (0)
	dim cz as single = cosf(ang.z)
	dim sz as single = sinf(ang.z)
	dim cy as single = cosf(ang.y)
	dim sy as single = sinf(ang.y)
	dim cx as single = cosf(ang.x)
	dim sx as single = sinf(ang.x)
	result.m0 = cz * cy
	result.m1 = ((cz * sy) * sx) - (cx * sz)
	result.m2 = (sz * sx) + ((cz * cx) * sy)
	result.m3 = 0
	result.m4 = cy * sz
	result.m5 = (cz * cx) + ((sz * sy) * sx)
	result.m6 = ((cx * sz) * sy) - (cz * sx)
	result.m7 = 0
	result.m8 = -sy
	result.m9 = cy * sx
	result.m10 = cy * cx
	result.m11 = 0
	result.m12 = 0
	result.m13 = 0
	result.m14 = 0
	result.m15 = 1
	return result
end function

private function MatrixScale(byval x as single, byval y as single, byval z as single) as Matrix
	dim result as Matrix = (x, 0.0f, 0.0f, 0.0f, 0.0f, y, 0.0f, 0.0f, 0.0f, 0.0f, z, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function MatrixFrustum(byval lefts as double, byval rights as double, byval bottom as double, byval top as double, byval near as double, byval far as double) as Matrix
	dim result as Matrix = (0)
	dim rl as single = csng(rights - lefts)
	dim tb as single = csng(top - bottom)
	dim fn as single = csng(far - near)
	result.m0 = (csng(near) * 2.0f) / rl
	result.m1 = 0.0f
	result.m2 = 0.0f
	result.m3 = 0.0f
	result.m4 = 0.0f
	result.m5 = (csng(near) * 2.0f) / tb
	result.m6 = 0.0f
	result.m7 = 0.0f
	result.m8 = (csng(rights) + csng(lefts)) / rl
	result.m9 = (csng(top) + csng(bottom)) / tb
	result.m10 = (-(csng(far) + csng(near))) / fn
	result.m11 = -1.0f
	result.m12 = 0.0f
	result.m13 = 0.0f
	result.m14 = (-((csng(far) * csng(near)) * 2.0f)) / fn
	result.m15 = 0.0f
	return result
end function

private function MatrixPerspective(byval fovy as double, byval aspect as double, byval near as double, byval far as double) as Matrix
	dim top as double = near * tan(fovy * 0.5)
	dim rights as double = top * aspect
	dim result as Matrix = MatrixFrustum(-rights, rights, -top, top, near, far)
	return result
end function

private function MatrixOrtho(byval lefts as double, byval rights as double, byval bottom as double, byval top as double, byval near as double, byval far as double) as Matrix
	dim result as Matrix = (0)
	dim rl as single = csng(rights - lefts)
	dim tb as single = csng(top - bottom)
	dim fn as single = csng(far - near)
	result.m0 = 2.0f / rl
	result.m1 = 0.0f
	result.m2 = 0.0f
	result.m3 = 0.0f
	result.m4 = 0.0f
	result.m5 = 2.0f / tb
	result.m6 = 0.0f
	result.m7 = 0.0f
	result.m8 = 0.0f
	result.m9 = 0.0f
	result.m10 = (-2.0f) / fn
	result.m11 = 0.0f
	result.m12 = (-(csng(lefts) + csng(rights))) / rl
	result.m13 = (-(csng(top) + csng(bottom))) / tb
	result.m14 = (-(csng(far) + csng(near))) / fn
	result.m15 = 1.0f
	return result
end function

private function MatrixLookAt(byval eye as Vector3, byval target as Vector3, byval up as Vector3) as Matrix
	dim result as Matrix = (0)
	dim z as Vector3 = Vector3Subtract(eye, target)
	z = Vector3Normalize(z)
	dim x as Vector3 = Vector3CrossProduct(up, z)
	x = Vector3Normalize(x)
	dim y as Vector3 = Vector3CrossProduct(z, x)
	result.m0 = x.x
	result.m1 = y.x
	result.m2 = z.x
	result.m3 = 0.0f
	result.m4 = x.y
	result.m5 = y.y
	result.m6 = z.y
	result.m7 = 0.0f
	result.m8 = x.z
	result.m9 = y.z
	result.m10 = z.z
	result.m11 = 0.0f
	result.m12 = -Vector3DotProduct(x, eye)
	result.m13 = -Vector3DotProduct(y, eye)
	result.m14 = -Vector3DotProduct(z, eye)
	result.m15 = 1.0f
	return result
end function

private function MatrixToFloatV(byval mat as Matrix) as float16
	dim buffer as float16
	buffer.v(0) = mat.m0
	buffer.v(1) = mat.m1
	buffer.v(2) = mat.m2
	buffer.v(3) = mat.m3
	buffer.v(4) = mat.m4
	buffer.v(5) = mat.m5
	buffer.v(6) = mat.m6
	buffer.v(7) = mat.m7
	buffer.v(8) = mat.m8
	buffer.v(9) = mat.m9
	buffer.v(10) = mat.m10
	buffer.v(11) = mat.m11
	buffer.v(12) = mat.m12
	buffer.v(13) = mat.m13
	buffer.v(14) = mat.m14
	buffer.v(15) = mat.m15
	return buffer
end function

private function QuaternionAdd(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = Quaternion(q1.x + q2.x, q1.y + q2.y, q1.z + q2.z, q1.w + q2.w)
	return result
end function

private function QuaternionAddValue(byval q as Quaternion, byval add as single) as Quaternion
	dim result as Quaternion = Quaternion(q.x + add, q.y + add, q.z + add, q.w + add)
	return result
end function

private function QuaternionSubtract(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = Quaternion(q1.x - q2.x, q1.y - q2.y, q1.z - q2.z, q1.w - q2.w)
	return result
end function

private function QuaternionSubtractValue(byval q as Quaternion, byval subs as single) as Quaternion
	dim result as Quaternion = Quaternion(q.x - subs, q.y - subs, q.z - subs, q.w - subs)
	return result
end function

private function QuaternionIdentity() as Quaternion
	dim result as Quaternion = Quaternion(0.0f, 0.0f, 0.0f, 1.0f)
	return result
end function

private function QuaternionLength(byval q as Quaternion) as single
	dim result as single = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w))
	return result
end function

private function QuaternionNormalize(byval q as Quaternion) as Quaternion
	dim result as Quaternion
	dim length as single
	dim ilength as single
	length = QuaternionLength(q)
	if length = 0.0f then
		length = 1.0f
	end if
	ilength = 1.0f / length
	result.x = q.x * ilength
	result.y = q.y * ilength
	result.z = q.z * ilength
	result.w = q.w * ilength
	return result
end function

private function QuaternionInvert(byval q as Quaternion) as Quaternion
	dim result as Quaternion = q
	dim length as single = QuaternionLength(q)
	dim lengthSq as single = length * length
	if lengthSq <> 0.0 then
		dim i as single = 1.0f / lengthSq
		result.x *= -i
		result.y *= -i
		result.z *= -i
		result.w *= i
	end if
	return result
end function

private function QuaternionMultiply(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion
	dim qax as single = q1.x
	dim qay as single = q1.y
	dim qaz as single = q1.z
	dim qaw as single = q1.w
	dim qbx as single = q2.x
	dim qby as single = q2.y
	dim qbz as single = q2.z
	dim qbw as single = q2.w
	result.x = (((qax * qbw) + (qaw * qbx)) + (qay * qbz)) - (qaz * qby)
	result.y = (((qay * qbw) + (qaw * qby)) + (qaz * qbx)) - (qax * qbz)
	result.z = (((qaz * qbw) + (qaw * qbz)) + (qax * qby)) - (qay * qbx)
	result.w = (((qaw * qbw) - (qax * qbx)) - (qay * qby)) - (qaz * qbz)
	return result
end function

private function QuaternionScale(byval q as Quaternion, byval mul as single) as Quaternion
	dim result as Quaternion
	dim qax as single = q.x
	dim qay as single = q.y
	dim qaz as single = q.z
	dim qaw as single = q.w
	result.x = (((qax * mul) + (qaw * mul)) + (qay * mul)) - (qaz * mul)
	result.y = (((qay * mul) + (qaw * mul)) + (qaz * mul)) - (qax * mul)
	result.z = (((qaz * mul) + (qaw * mul)) + (qax * mul)) - (qay * mul)
	result.w = (((qaw * mul) - (qax * mul)) - (qay * mul)) - (qaz * mul)
	return result
end function

private function QuaternionDivide(byval q1 as Quaternion, byval q2 as Quaternion) as Quaternion
	dim result as Quaternion = Quaternion(q1.x / q2.x, q1.y / q2.y, q1.z / q2.z, q1.w / q2.w)
	return result
end function

private function QuaternionLerp(byval q1 as Quaternion, byval q2 as Quaternion, byval amount as single) as Quaternion
	dim result as Quaternion
	result.x = q1.x + (amount * (q2.x - q1.x))
	result.y = q1.y + (amount * (q2.y - q1.y))
	result.z = q1.z + (amount * (q2.z - q1.z))
	result.w = q1.w + (amount * (q2.w - q1.w))
	return result
end function

private function QuaternionNlerp(byval q1 as Quaternion, byval q2 as Quaternion, byval amount as single) as Quaternion
	dim result as Quaternion = QuaternionLerp(q1, q2, amount)
	result = QuaternionNormalize(result)
	return result
end function

private function QuaternionSlerp(byval q1 as Quaternion, byval q2 as Quaternion, byval amount as single) as Quaternion
	dim result as Quaternion
	dim cosHalfTheta as single = (((q1.x * q2.x) + (q1.y * q2.y)) + (q1.z * q2.z)) + (q1.w * q2.w)
	if cosHalfTheta < 0 then
		q2.x = -q2.x
		q2.y = -q2.y
		q2.z = -q2.z
		q2.w = -q2.w
		cosHalfTheta = -cosHalfTheta
	end if
	if fabs(cosHalfTheta) >= 1.0f then
		result = q1
	elseif cosHalfTheta > 0.95f then
		result = QuaternionNlerp(q1, q2, amount)
	else
		dim halfTheta as single = acosf(cosHalfTheta)
		dim sinHalfTheta as single = sqrtf(1.0f - (cosHalfTheta * cosHalfTheta))
		if fabs(sinHalfTheta) < 0.001f then
			result.x = (q1.x * 0.5f) + (q2.x * 0.5f)
			result.y = (q1.y * 0.5f) + (q2.y * 0.5f)
			result.z = (q1.z * 0.5f) + (q2.z * 0.5f)
			result.w = (q1.w * 0.5f) + (q2.w * 0.5f)
		else
			dim ratioA as single = sinf((1 - amount) * halfTheta) / sinHalfTheta
			dim ratioB as single = sinf(amount * halfTheta) / sinHalfTheta
			result.x = (q1.x * ratioA) + (q2.x * ratioB)
			result.y = (q1.y * ratioA) + (q2.y * ratioB)
			result.z = (q1.z * ratioA) + (q2.z * ratioB)
			result.w = (q1.w * ratioA) + (q2.w * ratioB)
		end if
	end if
	return result
end function

private function QuaternionFromVector3ToVector3(byval from as Vector3, byval tos as Vector3) as Quaternion
	dim result as Quaternion
	dim cos2Theta as single = Vector3DotProduct(from, tos)
	dim cross as Vector3 = Vector3CrossProduct(from, tos)
	result.x = cross.x
	result.y = cross.y
	result.z = cross.z
	result.w = 1.0f + cos2Theta
	result = QuaternionNormalize(result)
	return result
end function

private function QuaternionFromMatrix(byval mat as Matrix) as Quaternion
	dim result as Quaternion
	if (mat.m0 > mat.m5) andalso (mat.m0 > mat.m10) then
		dim s as single = sqrtf(((1.0f + mat.m0) - mat.m5) - mat.m10) * 2
		result.x = 0.25f * s
		result.y = (mat.m4 + mat.m1) / s
		result.z = (mat.m2 + mat.m8) / s
		result.w = (mat.m9 - mat.m6) / s
	elseif mat.m5 > mat.m10 then
		dim s as single = sqrtf(((1.0f + mat.m5) - mat.m0) - mat.m10) * 2
		result.x = (mat.m4 + mat.m1) / s
		result.y = 0.25f * s
		result.z = (mat.m9 + mat.m6) / s
		result.w = (mat.m2 - mat.m8) / s
	else
		dim s as single = sqrtf(((1.0f + mat.m10) - mat.m0) - mat.m5) * 2
		result.x = (mat.m2 + mat.m8) / s
		result.y = (mat.m9 + mat.m6) / s
		result.z = 0.25f * s
		result.w = (mat.m4 - mat.m1) / s
	end if
	return result
end function

private function QuaternionToMatrix(byval q as Quaternion) as Matrix
	dim result as Matrix = MatrixIdentity()
	dim a2 as single = 2 * (q.x * q.x)
	dim b2 as single = 2 * (q.y * q.y)
	dim c2 as single = 2 * (q.z * q.z)
	dim ab as single = 2 * (q.x * q.y)
	dim ac as single = 2 * (q.x * q.z)
	dim bc as single = 2 * (q.y * q.z)
	dim ad as single = 2 * (q.x * q.w)
	dim bd as single = 2 * (q.y * q.w)
	dim cd as single = 2 * (q.z * q.w)
	result.m0 = (1 - b2) - c2
	result.m1 = ab - cd
	result.m2 = ac + bd
	result.m4 = ab + cd
	result.m5 = (1 - a2) - c2
	result.m6 = bc - ad
	result.m8 = ac - bd
	result.m9 = bc + ad
	result.m10 = (1 - a2) - b2
	return result
end function

private function QuaternionFromAxisAngle(byval axis as Vector3, byval angle as single) as Quaternion
	dim result as Quaternion = Quaternion(0.0f, 0.0f, 0.0f, 1.0f)
	if Vector3Length(axis) <> 0.0f then
		angle *= 0.5f
	end if
	axis = Vector3Normalize(axis)
	dim sinres as single = sinf(angle)
	dim cosres as single = cosf(angle)
	result.x = axis.x * sinres
	result.y = axis.y * sinres
	result.z = axis.z * sinres
	result.w = cosres
	result = QuaternionNormalize(result)
	return result
end function

private sub QuaternionToAxisAngle(byval q as Quaternion, byval outAxis as Vector3 ptr, byval outAngle as single ptr)
	if fabs(q.w) > 1.0f then
		q = QuaternionNormalize(q)
	end if
	dim resAxis as Vector3 = Vector3(0.0f, 0.0f, 0.0f)
	dim resAngle as single = 2.0f * acosf(q.w)
	dim den as single = sqrtf(1.0f - (q.w * q.w))
	if den > 0.0001f then
		resAxis.x = q.x / den
		resAxis.y = q.y / den
		resAxis.z = q.z / den
	else
		resAxis.x = 1.0f
	end if
	(*outAxis) = resAxis
	(*outAngle) = resAngle
end sub

private function QuaternionFromEuler(byval pitch as single, byval yaw as single, byval roll as single) as Quaternion
	dim q as Quaternion
	dim x0 as single = cosf(pitch * 0.5f)
	dim x1 as single = sinf(pitch * 0.5f)
	dim y0 as single = cosf(yaw * 0.5f)
	dim y1 as single = sinf(yaw * 0.5f)
	dim z0 as single = cosf(roll * 0.5f)
	dim z1 as single = sinf(roll * 0.5f)
	q.x = ((x1 * y0) * z0) - ((x0 * y1) * z1)
	q.y = ((x0 * y1) * z0) + ((x1 * y0) * z1)
	q.z = ((x0 * y0) * z1) - ((x1 * y1) * z0)
	q.w = ((x0 * y0) * z0) + ((x1 * y1) * z1)
	return q
end function

private function QuaternionToEuler(byval q as Quaternion) as Vector3
	dim result as Vector3
	dim x0 as single = 2.0f * ((q.w * q.x) + (q.y * q.z))
	dim x1 as single = 1.0f - (2.0f * ((q.x * q.x) + (q.y * q.y)))
	result.x = atan2f(x0, x1) * (180.0f / 3.14159265358979323846f)
	dim y0 as single = 2.0f * ((q.w * q.y) - (q.z * q.x))
	y0 = iif(y0 > 1.0f, 1.0f, y0)
	y0 = iif(y0 < (-1.0f), -1.0f, y0)
	result.y = asinf(y0) * (180.0f / 3.14159265358979323846f)
	dim z0 as single = 2.0f * ((q.w * q.z) + (q.x * q.y))
	dim z1 as single = 1.0f - (2.0f * ((q.y * q.y) + (q.z * q.z)))
	result.z = atan2f(z0, z1) * (180.0f / 3.14159265358979323846f)
	return result
end function

private function QuaternionTransform(byval q as Quaternion, byval mat as Matrix) as Quaternion
	dim result as Quaternion
	result.x = (((mat.m0 * q.x) + (mat.m4 * q.y)) + (mat.m8 * q.z)) + (mat.m12 * q.w)
	result.y = (((mat.m1 * q.x) + (mat.m5 * q.y)) + (mat.m9 * q.z)) + (mat.m13 * q.w)
	result.z = (((mat.m2 * q.x) + (mat.m6 * q.y)) + (mat.m10 * q.z)) + (mat.m14 * q.w)
	result.w = (((mat.m3 * q.x) + (mat.m7 * q.y)) + (mat.m11 * q.z)) + (mat.m15 * q.w)
	return result
end function

private function Vector3Unproject(byval source as Vector3, byval projection as Matrix, byval views as Matrix) as Vector3
	dim result as Vector3 = Vector3(0.0f, 0.0f, 0.0f)
	dim matViewProj as Matrix = MatrixMultiply(views, projection)
	matViewProj = MatrixInvert(matViewProj)
	dim quat as Quaternion = Quaternion(source.x, source.y, source.z, 1.0f)
	quat = QuaternionTransform(quat, matViewProj)
	result.x = quat.x / quat.w
	result.y = quat.y / quat.w
	result.z = quat.z / quat.w
	return result
end function

end extern
