
Skater_Default_Stats = 5.0
STATS_AIR = 0
STATS_HANGTIME = 1
STATS_OLLIE = 2
STATS_SPEED = 3
STATS_SPIN = 4
STATS_FLIPSPEED = 5
STATS_SWITCH = 6
STATS_RAILBALANCE = 7
STATS_LIPBALANCE = 8
STATS_MANUAL = 9
standard_switch = (0.9, 1)
no_switch = (1, 1)
Skater_Max_Standing_Kick_Speed_Stat = { (355, 496) limit = 900 STATS_SPEED #"switch" = (0.8, 1) }
Skater_Max_Crouched_Kick_Speed_Stat = { (475, 675) limit = 900 STATS_SPEED #"switch" = (0.8, 1) }
Physics_Standing_Acceleration_Stat = { (600, 700) STATS_SPEED #"switch" = standard_switch }
Physics_Crouching_Acceleration_stat = { (1000, 1200) STATS_SPEED #"switch" = standard_switch }
Skater_Max_Speed_Stat = { (700, 900) STATS_SPEED #"switch" = no_switch }
Skater_Max_Max_Speed_Stat = { (900, 1100) STATS_SPEED #"switch" = no_switch }
Skater_Flip_Speed_Stat = { (1, 1.3) STATS_FLIPSPEED #"switch" = standard_switch }
Physics_Jump_Speed_Stat = { (400, 450) STATS_OLLIE #"switch" = standard_switch }
Physics_Jump_Speed_min_Stat = { (350, 350) STATS_OLLIE #"switch" = standard_switch }
Physics_Boneless_Jump_Speed_Stat = { (475, 525) STATS_OLLIE #"switch" = standard_switch }
Physics_Boneless_Jump_Speed_min_Stat = { (400, 400) STATS_OLLIE #"switch" = standard_switch }
Physics_Air_Jump_Speed_Stat = { (220, 275) STATS_AIR #"switch" = standard_switch }
Physics_Air_Jump_Speed_min_Stat = { (100, 100) STATS_AIR #"switch" = standard_switch }
Physics_Boneless_Air_Jump_Speed_Stat = { (240, 325) STATS_AIR #"switch" = standard_switch }
Physics_Boneless_Air_Jump_Speed_min_Stat = { (200, 200) STATS_AIR #"switch" = standard_switch }
Physics_Air_Rotation_stat = { (6.5, 7.75) STATS_SPIN #"switch" = standard_switch }
Physics_air_tap_turn_speed_stat = { (6.5, 7.75) STATS_SPIN #"switch" = standard_switch }
Physics_Air_Lean_stat = { (1, 1) STATS_SPIN #"switch" = standard_switch }
Physics_Spine_Lean_stat = { (3, 3) STATS_SPIN #"switch" = standard_switch }
Physics_Air_No_Lean_Time = 200
Physics_Air_Ramp_Lean_Time = 200
Spine_Max_Width = 800
Physics_recover_rate_stat = { (2, 2) STATS_SPIN #"switch" = standard_switch }
Physics_Air_hang_Stat = { (1, 1) STATS_HANGTIME #"switch" = standard_switch }
Physics_Vert_hang_Stat = { (1, 1.1) STATS_HANGTIME #"switch" = standard_switch }
Lip_side_hop_speed = 10
Lip_side_jump_speed = 200
Lip_along_jump_speed = 100
Lip_held_jump_out_time = 300
Lip_held_jump_along_time = 300
skater_upright_sideways_speed = -60.0
physics_break_air_speed_scale = 0.75
physics_break_air_up_scale = 0.75
Skater_Break_Vert_forward_tilt = 45
Skater_Vert_Allow_break_Time = 200
Skater_vert_push_time = 130
Skater_vert_active_up_time = 250
Physics_Air_Gravity = -1350
Physics_Ground_Gravity = -1000
Physics_Rail_Gravity = -2000
Wall_Ride_Gravity = -969
Rail_Speed_Boost = 150
Physics_Standing_Air_Friction = 0.00001
Physics_Crouched_Air_Friction = 0.0
Physics_Brake_Acceleration = 900.0
Skater_Drift_Upright_Speed = 0.3
Physics_Vert_Push_Out = 3
Physics_Rolling_Friction = 0.00001
Physics_Heavy_Air_Friction = 0.00001
Skater_Flip_Speed = 1.0
Skater_Late_Jump_Slop = 333
Skater_max_tense_time = 200
Skater_autoturn_speed = 3.0
skater_autoturn_cancel_time = 300
skater_autoturn_vert_angle = 5
Skater_Cam_Horiz_FOV = 72.0
Skater_Cam_Behind = 14
Skater_Cam_Above = 4.0
Skater_Cam_Tilt = 0.18
Skater_Cam_Slerp = 0.08
Skater_Cam_Vert_Air_Slerp = 0.025
Skater_Origin_Offset = 0.0
Skater_Camera_Undefined = { horiz_fov = 0.0 behind = 0.0 above = 0.0 Tilt = 0.0 slerp = 0.0 vert_air_slerp = 0.0 vert_air_landed_slerp = 0.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.0 grind_zoom = 0.0 origin_offset = 0.0 name = "undefined" }
Skater_Camera_Standard_Medium = { horiz_fov = 72.0 behind = 12.0 above = 4.3 Tilt = 0.18 slerp = 0.04 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Standard_Far = { horiz_fov = 70.0 behind = 12.0 above = 4.3 Tilt = 0.18 slerp = 0.04 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "far" }
Skater_Camera_Standard_Near = { horiz_fov = 66.0 behind = 12.0 above = 4.3 Tilt = 0.18 slerp = 0.04 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "near" }
Skater_Camera_Standard_Medium_LTG = { horiz_fov = 68.0 behind = 12.0 above = 4.3 Tilt = 0.18 slerp = 0.04 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard ltg" }
Skater_Camera_2P_Vert_Medium = { horiz_fov = 72.0 behind = 14.0 above = 4.3 Tilt = 0.18 slerp = 0.04 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_2P_Vert_Far = { horiz_fov = 72.0 behind = 22.0 above = 6.0 Tilt = 0.3 slerp = 0.08 vert_air_slerp = 0.025 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.6 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "far" }
Skater_Camera_2P_Vert_Near = { horiz_fov = 72.0 behind = 6 above = 2.0 Tilt = 0.18 slerp = 0.08 vert_air_slerp = 0.025 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.9 lip_trick_zoom = 1.6 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "near" }
Skater_Camera_2P_Vert_Medium_LTG = { horiz_fov = 72.0 behind = 14.0 above = 3.0 Tilt = 0.15 slerp = 0.08 vert_air_slerp = 0.025 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.6 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard ltg" }
Skater_Camera_2P_Horiz_Medium = { horiz_fov = 72.0 behind = 15.0 above = 3.5 Tilt = 0.2 slerp = 0.08 vert_air_slerp = 0.025 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.6 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "far" }
Skater_Camera_2P_Horiz_Far = { horiz_fov = 72.0 behind = 25.0 above = 3.5 Tilt = 0.3 slerp = 0.04 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_2P_Horiz_Medium_LTG = { horiz_fov = 72.0 behind = 15.0 above = 3.0 Tilt = 0.15 slerp = 0.08 vert_air_slerp = 0.025 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.6 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard ltg" }
Skater_Camera_2P_Horiz_Near = { horiz_fov = 72.0 behind = 8.0 above = 3.2 Tilt = 0.18 slerp = 0.08 vert_air_slerp = 0.025 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 1.0 lip_trick_zoom = 1.6 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "near" }
Skater_Camera_Replay_Front = { horiz_fov = 72.0 behind = 18.0 above = 4.0 Tilt = 0.2 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Front_Zoom = { horiz_fov = 72.0 behind = 10.0 above = 4.0 Tilt = 0.3 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.5 lip_trick_zoom = -1.5 lip_trick_tilt = 0.6 lip_trick_above = 0.8 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Left = { horiz_fov = 72.0 behind = 18.0 above = 4.0 Tilt = 0.2 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Left_Zoom = { horiz_fov = 72.0 behind = 10.0 above = 4.0 Tilt = 0.3 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Behind = { horiz_fov = 72.0 behind = 18.0 above = 4.0 Tilt = 0.2 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Behind_Zoom = { horiz_fov = 72.0 behind = 10.0 above = 4.0 Tilt = 0.3 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Right = { horiz_fov = 72.0 behind = 18.0 above = 4.0 Tilt = 0.2 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Replay_Right_Zoom = { horiz_fov = 72.0 behind = 10.0 above = 4.0 Tilt = 0.3 slerp = 0.08 vert_air_slerp = 0.04 vert_air_landed_slerp = 0.375 lerp_xz = 0.25 lerp_y = 0.75 vert_air_lerp_xz = 1.0 vert_air_lerp_y = 1.0 zoom_lerp = 0.0625 big_air_trick_zoom = 0.7 lip_trick_zoom = 1.0 lip_trick_tilt = -0.8 lip_trick_above = 0.4 grind_zoom = 1.0 origin_offset = 0.2 name = "standard" }
Skater_Camera_Array = [ Skater_Camera_Undefined
  Skater_Camera_Standard_Near
  Skater_Camera_Standard_Medium
  Skater_Camera_Standard_Far
  Skater_Camera_Standard_Medium_LTG
  Skater_Camera_Replay_Front
  Skater_Camera_Replay_Front_Zoom
  Skater_Camera_Replay_Left
  Skater_Camera_Replay_Left_Zoom
  Skater_Camera_Replay_Behind
  Skater_Camera_Replay_Behind_Zoom
  Skater_Camera_Replay_Right
  Skater_Camera_Replay_Right_Zoom
]
Skater_Camera_2P_Vert_Array = [ Skater_Camera_Undefined
  Skater_Camera_2P_Vert_Near
  Skater_Camera_2P_Vert_Medium
  Skater_Camera_2P_Vert_Far
  Skater_Camera_2P_Vert_Medium_LTG
]
Skater_Camera_2P_Horiz_Array = [ Skater_Camera_Undefined
  Skater_Camera_2P_Horiz_Near
  Skater_Camera_2P_Horiz_Medium
  Skater_Camera_2P_Horiz_Far
  Skater_Camera_2P_Horiz_Medium_LTG
]
Skater_default_head_height = 77
Physics_Ground_Snap_Up = 13
Physics_Air_Snap_Up = 15
Physics_Ground_Snap_Down = 8.2
Physics_Ground_Snap_Down_Skitching = 150.0
Physics_Ground_Snap_up_Skitching = 50.0
Skater_First_Forward_Collision_Height = 8.1
Skater_First_Forward_Collision_Length = 10
Skater_Min_Distance_To_Wall = 8.0
Skater_side_collide_height = 16
Skater_side_collide_length = 15
Skater_air_extra_side_col = 12
Physics_Ground_Rotation = 1.8
Physics_Ground_Sharp_Rotation = 3.6
Physics_Air_No_Rotate_Time = 100
Physics_Air_Ramp_Rotate_Time = 50
spin_count_slop = 60
Normal_Lerp_Speed = 0.1
Normal_Lerp_Velocity_Scale = 250.0
Ground_stick_angle = 30
Ground_stick_angle_forward = 60
Rail_Max_Snap = 40.0
Rail_jump_rerail_time = 300
Rail_minimum_rerail_time = 500
Rail_Corner_Leave_Angle = 50
Rail_Jump_Angle = 15
Rail_Tolerance = 0.7
Rail_Bad_Ledge_Side_Dist = 5
Rail_Bad_Ledge_Drop_Down_Dist = 3
Wall_Bounce_Angle_Multiplier = 1.1
Wall_Bounce_Dont_Slow_Angle = 30
Wall_Bounce_Dont_Flail_Speed = 100
Wall_Non_Skatable_Angle = 25
Wall_Ride_Min_Speed = 200
Wall_Ride_Max_Incident_Angle = 60
Wall_Ride_Max_Tilt = 68.5
Wall_Ride_Upside_Down_Angle = 53
Wall_Ride_Triangle_Window = 0.333
Wall_Ride_Delay = 0.666
Wall_Ride_Down_Collision_Check_Length = -10
Wall_Ride_Turn_Speed = 0.004
Wall_Ride_Jump_Out_Speed = 40
Wall_Ride_Jump_Up_Speed = 80
Skater_max_sloped_turn_speed = 300.0
Skater_max_sloped_turn_cosine = 0.5
Skater_Slow_Turn_on_slopes = 3.0
BalanceIgnoreButtonPeriod = 0
BalanceSafeButtonPeriod = 1000
ManualParams =
{
  Cheese = { (700, 700) STATS_MANUAL #"switch" = standard_switch }
  CheeseFrames = { (100, 100) STATS_MANUAL #"switch" = standard_switch }
  Lean_Gravity_Stat = { (0.02, 0.02) STATS_MANUAL #"switch" = standard_switch }
  Instable_Rate = { (0.11, 0.07) STATS_MANUAL #"switch" = standard_switch }
  Instable_Base = { (1, 1) STATS_MANUAL #"switch" = standard_switch }
  Lean_Min_Speed = { (5, 5) STATS_MANUAL #"switch" = standard_switch }
  Lean_Rnd_Speed = { (20, 20) STATS_MANUAL #"switch" = standard_switch }
  Repeat_Min = { (1, 1) STATS_MANUAL #"switch" = standard_switch }
  Repeat_Multiplier = { (0.25, 0.25) STATS_MANUAL #"switch" = standard_switch }
  Lean_Repeat_Multiplier = { (0.8, 0.8) STATS_MANUAL #"switch" = standard_switch }
  Lean_Acc = { (10, 10) STATS_MANUAL #"switch" = standard_switch }
  Lean_Bail_Angle = { (4000, 4000) STATS_MANUAL #"switch" = standard_switch }
}
SkitchParams =
{
  Cheese = { (700, 700) }
  CheeseFrames = { (1, 1) }
  Lean_Gravity_Stat = { (0.01, 0.01) }
  Instable_Rate = { (0.04, 0.04) }
  Instable_Base = { (0.5, 0.5) }
  Lean_Min_Speed = { (5, 5) }
  Lean_Rnd_Speed = { (10, 10) }
  Repeat_Min = { (1, 1) }
  Repeat_Multiplier = { (0.25, 0.25) }
  Lean_Repeat_Multiplier = { (0.8, 0.8) }
  Lean_Acc = { (8, 8) }
  Lean_Bail_Angle = { (4000, 4000) }
}
GrindParams =
{
  Cheese = { (2500, 2500) STATS_RAILBALANCE #"switch" = standard_switch }
  CheeseFrames = { (30, 30) STATS_RAILBALANCE #"switch" = standard_switch }
  Lean_Gravity_Stat = { (0.02, 0.02) STATS_RAILBALANCE #"switch" = standard_switch }
  Instable_Rate = { (0.11, 0.09) STATS_RAILBALANCE #"switch" = standard_switch }
  Instable_Base = { (1, 1) STATS_RAILBALANCE #"switch" = standard_switch }
  Lean_Min_Speed = { (5, 5) STATS_RAILBALANCE #"switch" = standard_switch }
  Lean_Rnd_Speed = { (7.5, 6) limit = 6 STATS_RAILBALANCE #"switch" = standard_switch }
  Repeat_Min = { (1, 1) STATS_RAILBALANCE #"switch" = standard_switch }
  Repeat_Multiplier = { (0.4, 0.1) STATS_RAILBALANCE #"switch" = standard_switch }
  Lean_Repeat_Multiplier = { (0.65, 0.5) STATS_RAILBALANCE #"switch" = standard_switch }
  Lean_Acc = { (10, 10) STATS_RAILBALANCE #"switch" = standard_switch }
  Lean_Bail_Angle = { (4000, 4000) STATS_RAILBALANCE #"switch" = standard_switch }
  Same_Grind_Add_Time = { (2, 2) STATS_RAILBALANCE #"switch" = standard_switch }
  New_Grind_Sub_Time = { (-0.4, 0) STATS_RAILBALANCE #"switch" = standard_switch }
}
LipParams =
{
  Cheese = { (3000, 1000) STATS_LIPBALANCE #"switch" = standard_switch }
  CheeseFrames = { (180, 180) STATS_LIPBALANCE #"switch" = standard_switch }
  Lean_Gravity_Stat = { (0.02, 0.02) STATS_LIPBALANCE #"switch" = standard_switch }
  Instable_Rate = { (1, 0.5) STATS_LIPBALANCE #"switch" = standard_switch }
  Instable_Base = { (1, 1) STATS_LIPBALANCE #"switch" = standard_switch }
  Lean_Min_Speed = { (5, 5) STATS_LIPBALANCE #"switch" = standard_switch }
  Lean_Rnd_Speed = { (20, 20) STATS_LIPBALANCE #"switch" = standard_switch }
  Repeat_Min = { (1, 1) STATS_LIPBALANCE #"switch" = standard_switch }
  Repeat_Multiplier = { (1, 1) STATS_LIPBALANCE #"switch" = standard_switch }
  Lean_Repeat_Multiplier = { (1, 1) STATS_LIPBALANCE #"switch" = standard_switch }
  Lean_Acc = { (10, 10) STATS_LIPBALANCE #"switch" = standard_switch }
  Lean_Bail_Angle = { (4000, 4000) STATS_LIPBALANCE #"switch" = standard_switch }
}
DefaultWobbleParams =
{
  WobbleAmpA = { (0.05, 0.05) STATS_MANUAL }
  WobbleAmpB = { (0.04, 0.04) STATS_MANUAL }
  WobbleK1 = { (0.0022, 0.0022) STATS_MANUAL }
  WobbleK2 = { (0.0017, 0.0017) STATS_MANUAL }
  SpazFactor = { (1, 1) STATS_MANUAL }
}
BashPeriod = 400
BashSpeedupFactor = 0.2
BashMaxPercentSpeedup = 100
SkateInAble_HorizOffset = 30
SkateInAble_DownOffset = 7
SkateInAble_LipHorizOffset = 24
SkateInAble_LipDownOffset = 7
SkateInAble_LipExtraCheckHorizOffset = 13
SkateInAble_LipExtraCheckDownOffset = 2400
LipAllowAngle = 15
LipAllowAngle_Override = 60
LipPlayerHorizontalAngle = 47
LipRampVertAngle = 68.5
CarPlant_Forward_boost = 400
CarPlant_Upward_boost = 100
min_car_height_diff = 60
min_car_height_downwards = 30
NewSpecial = 1
Skate_min_wall_lean_push_speed = 1000
Skate_wall_lean_push_time = 0.4
Skate_wall_lean_push_length = 35
Skate_wall_lean_push_height = 30
Skitch_Max_Distance = 120
Skitch_Offset = 27
skitch_suck_speed = 200
skitch_speed_match = 1.0
skitch_hold_time = 200
SnowBoard_Friction = 0.3
Snowboard_turn_multiplier = 2.0
cess_turn_min_speed = 40
cess_turn_cap_speed = 500
cess_turn_multiplier = 3.0
cess_Friction = 0.06
slomo_speed = 0.5
Matrix_speed = 0.15
Sim_speed = 1.25
Moon_gravity = 0.5
rubber_acc = 0.001
rubber_friction = 0.04
rubber_limit = 1000
InternetClientCollCoefficient = 180.0
InternetServerCollCoefficient = 120.0
InternetClientCollRadius = 120.0
InternetServerCollRadius = 94.0
LanClientCollCoefficient = 90.0
LanServerCollCoefficient = 90.0
LanClientCollRadius = 70.0
LanServerCollRadius = 70.0
ClientCollCoefficient = 20.0
ServerCollCoefficient = 20.0
ClientCollRadius = 70.0
ServerCollRadius = 70.0
ped_push_dist = 24
ped_push_skater_speed = 400
