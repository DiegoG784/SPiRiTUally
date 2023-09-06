extends KinematicBody
class_name Entity

var motion = Vector3()
const JUMP = Vector3(0, -1, 0)
export(int, 1) var walking_speed = 80
export(int, 1) var jump_force = -370
export(int, 1) var gravity = 20
export(int, 1) var MAX_walking_speed = 100
