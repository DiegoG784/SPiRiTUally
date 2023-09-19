extends KinematicBody
class_name Entity

var motion = Vector3()
const JUMP = Vector3(0, -1, 0)
export(int) var walking_speed = 80
export(int) var jump_force = -370
export(int) var gravity = 20
export(int) var MAX_walking_speed = 100
