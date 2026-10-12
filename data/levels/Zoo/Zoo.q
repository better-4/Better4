NodeArray =
[
  {
    Position = (-38.02052, -33.34352, -1410.265)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart01
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "P1: Restart"
    restart_types = [ Player1 ]
  }
  {
    Position = (5795.3, -255.26, 3875.4)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart03
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "P1: Tram Restart"
    restart_types = [ Player1 ]
  }
  {
    Position = (239.5865, 312.968, 359.9723)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail01
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Main01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail04 ]
  }
  {
    Position = (-0.41355, 312.968, 359.9724)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail02
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Main01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail01 ]
  }
  {
    Position = (-0.41355, 312.968, 479.9724)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail03
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Main01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail02 ]
  }
  {
    Position = (239.5865, 312.968, 479.9723)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail04
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Main01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail03 ]
  }
  {
    Position = (-277.3613, 0.17917, -672.0002)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail423
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail424 ]
  }
  {
    Position = (-168, 0.17917, -672.0002)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail424
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail425 ]
  }
  {
    Position = (-168, 0.17917, -528.0002)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail425
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail426 ]
  }
  {
    Position = (-277.3614, 0.17917, -528.0002)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail426
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail423 ]
  }
  {
    Position = (514.7674, 0.17917, -658.1309)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail427
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail428 ]
  }
  {
    Position = (514.7673, 0.17917, -535.8781)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail428
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail429 ]
  }
  {
    Position = (416.3824, 0.17917, -535.8781)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail429
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail430 ]
  }
  {
    Position = (416.3825, 0.17917, -658.1309)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail430
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail427 ]
  }
  {
    Position = (-139.1833, 15.01387, 345.3023)
    Angles = (0, 0, 0)
    name = TRG_03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail09
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-139.1834, 15.0139, -134.6975)
    Angles = (0, 0, 0)
    name = TRG_04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail09
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_03 ]
  }
  {
    Position = (-36.46083, 15.0139, -134.6975)
    Angles = (0, 0, 0)
    name = TRG_05
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail09
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_06 ]
  }
  {
    Position = (-36.46073, 15.01387, 345.3023)
    Angles = (0, 0, 0)
    name = TRG_06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail09
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (286.1451, 15.01387, 345.3023)
    Angles = (0, 0, 0)
    name = TRG_07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail08
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (286.145, 15.0139, -134.6975)
    Angles = (0, 0, 0)
    name = TRG_08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail08
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_07 ]
  }
  {
    Position = (382.094, 15.0139, -134.6975)
    Angles = (0, 0, 0)
    name = TRG_09
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail08
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (382.0939, 15.01387, 345.3023)
    Angles = (0, 0, 0)
    name = TRG_10
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail08
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_09 ]
  }
  {
    Position = (599.9998, -35.2568, 1320.428)
    Angles = (0, 0, 0)
    name = TRG_12
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (702.1659, -7.21642, 1207.105)
    Angles = (0, 0, 0)
    name = TRG_13
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_12 ]
  }
  {
    Position = (809.7112, -7.21643, 1081.006)
    Angles = (0, 0, 0)
    name = TRG_14
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_13 ]
  }
  {
    Position = (935.5748, -7.21643, 841.0232)
    Angles = (0, 0, 0)
    name = TRG_15
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_14 ]
  }
  {
    Position = (975.8586, -7.21643, 715.725)
    Angles = (0, 0, 0)
    name = TRG_16
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_15 ]
  }
  {
    Position = (988.4429, -7.21645, 599.5209)
    Angles = (0, 0, 0)
    name = TRG_17
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_16 ]
  }
  {
    Position = (946.7736, -7.21645, 481.2317)
    Angles = (0, 0, 0)
    name = TRG_18
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_17 ]
  }
  {
    Position = (839.9999, -7.21646, 360)
    Angles = (0, 0, 0)
    name = TRG_19
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_18 ]
  }
  {
    Position = (731.957, -7.21647, 234.9856)
    Angles = (0, 0, 0)
    name = TRG_20
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_19 ]
  }
  {
    Position = (684.0605, -7.21646, 120.0054)
    Angles = (0, 0, 0)
    name = TRG_21
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_20 ]
  }
  {
    Position = (681.8311, -7.21648, -121.2768)
    Angles = (0, 0, 0)
    name = TRG_22
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_21 ]
  }
  {
    Position = (710.7896, -7.21648, -237.2506)
    Angles = (0, 0, 0)
    name = TRG_23
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_22 ]
  }
  {
    Position = (756.4567, -7.21649, -362.5966)
    Angles = (0, 0, 0)
    name = TRG_24
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_23 ]
  }
  {
    Position = (804.3531, -7.21649, -599.2068)
    Angles = (0, 0, 0)
    name = TRG_25
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_24 ]
  }
  {
    Position = (839.9999, -7.21651, -840.0009)
    Angles = (0, 0, 0)
    name = TRG_26
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_25 ]
  }
  {
    Position = (857.4437, -7.21652, -1086.414)
    Angles = (0, 0, 0)
    name = TRG_27
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_26 ]
  }
  {
    Position = (859.6016, -7.21653, -1205.788)
    Angles = (0, 0, 0)
    name = TRG_28
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_27 ]
  }
  {
    Position = (826.9288, -7.21652, -1316.902)
    Angles = (0, 0, 0)
    name = TRG_29
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_28 ]
  }
  {
    Position = (691.8868, -7.21654, -1441.087)
    Angles = (0, 0, 0)
    name = TRG_32
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_29 ]
  }
  {
    Position = (-451.8869, -7.21654, -1441.087)
    Angles = (0, 0, 0)
    name = TRG_35
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-584.1475, -7.21652, -1316.901)
    Angles = (0, 0, 0)
    name = TRG_36
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_35 ]
  }
  {
    Position = (-619.6017, -7.21653, -1205.787)
    Angles = (0, 0, 0)
    name = TRG_39
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_36 ]
  }
  {
    Position = (-617.4438, -7.21652, -1086.413)
    Angles = (0, 0, 0)
    name = TRG_40
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_39 ]
  }
  {
    Position = (-600, -7.21651, -840.0006)
    Angles = (0, 0, 0)
    name = TRG_41
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_40 ]
  }
  {
    Position = (-564.3533, -7.21649, -599.2066)
    Angles = (0, 0, 0)
    name = TRG_42
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_41 ]
  }
  {
    Position = (-516.4568, -7.21649, -362.5964)
    Angles = (0, 0, 0)
    name = TRG_43
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_42 ]
  }
  {
    Position = (-470.7897, -7.21648, -237.2503)
    Angles = (0, 0, 0)
    name = TRG_44
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_43 ]
  }
  {
    Position = (-441.8312, -7.21648, -121.2765)
    Angles = (0, 0, 0)
    name = TRG_45
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_44 ]
  }
  {
    Position = (-444.0606, -7.21646, 120.0056)
    Angles = (0, 0, 0)
    name = TRG_46
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_45 ]
  }
  {
    Position = (-491.9572, -7.21647, 234.9859)
    Angles = (0, 0, 0)
    name = TRG_47
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_46 ]
  }
  {
    Position = (-600, -7.21646, 360.0003)
    Angles = (0, 0, 0)
    name = TRG_48
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_47 ]
  }
  {
    Position = (-706.7737, -7.21645, 481.2319)
    Angles = (0, 0, 0)
    name = TRG_49
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_48 ]
  }
  {
    Position = (-748.4431, -7.21645, 599.5211)
    Angles = (0, 0, 0)
    name = TRG_50
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_49 ]
  }
  {
    Position = (-735.8588, -7.21643, 715.7252)
    Angles = (0, 0, 0)
    name = TRG_51
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_50 ]
  }
  {
    Position = (-707.7698, -7.21643, 841.0234)
    Angles = (0, 0, 0)
    name = TRG_52
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_51 ]
  }
  {
    Position = (-561.1191, -7.21643, 1081.006)
    Angles = (0, 0, 0)
    name = TRG_53
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_52 ]
  }
  {
    Position = (-455.54, -7.21642, 1207.105)
    Angles = (0, 0, 0)
    name = TRG_54
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_53 ]
  }
  {
    Position = (-360, -35.82084, 1320.001)
    Angles = (0, 0, 0)
    name = TRG_55
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_54 ]
  }
  {
    Position = (1982.272, -170.7406, 987.9313)
    Angles = (0, 0, 0)
    name = TRG_59
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_60 ]
  }
  {
    Position = (2057.793, -170.7162, 839.7134)
    Angles = (0, 0, 0)
    name = TRG_60
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_61 ]
  }
  {
    Position = (2061.573, -176.3531, 374.4023)
    Angles = (0, 0, 0)
    name = TRG_61
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_62 ]
  }
  {
    Position = (2535.979, -170.6918, -99.07343)
    Angles = (0, 0, 0)
    name = TRG_62
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_63 ]
  }
  {
    Position = (2759.565, -170.7162, -99.07352)
    Angles = (0, 0, 0)
    name = TRG_63
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail04
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3242.279, -170.6918, -99.07339)
    Angles = (0, 0, 0)
    name = TRG_64
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_65 ]
  }
  {
    Position = (3472.475, -170.7162, -99.07349)
    Angles = (0, 0, 0)
    name = TRG_65
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_66 ]
  }
  {
    Position = (3938.017, -170.6918, 367.4312)
    Angles = (0, 0, 0)
    name = TRG_66
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_67 ]
  }
  {
    Position = (3938.018, -170.7162, 598.934)
    Angles = (0, 0, 0)
    name = TRG_67
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3939.81, -170.7162, 1080.755)
    Angles = (0, 0, 0)
    name = TRG_68
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_69 ]
  }
  {
    Position = (3939.81, -170.6918, 1312.258)
    Angles = (0, 0, 0)
    name = TRG_69
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_70 ]
  }
  {
    Position = (3473.512, -170.9025, 1778.626)
    Angles = (0, 0, 0)
    name = TRG_70
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_71 ]
  }
  {
    Position = (3242.279, -170.6918, 1778.762)
    Angles = (0, 0, 0)
    name = TRG_71
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1865.071, -198.7813, 1336.929)
    Angles = (0, 0, 0)
    name = TRG_72
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_73 ]
  }
  {
    Position = (1873.792, -198.7813, 1552.33)
    Angles = (0, 0, 0)
    name = TRG_73
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_74 ]
  }
  {
    Position = (1848.998, -198.7813, 1734.018)
    Angles = (0, 0, 0)
    name = TRG_74
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_75 ]
  }
  {
    Position = (1823.052, -198.7813, 1889.813)
    Angles = (0, 0, 0)
    name = TRG_75
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_76 ]
  }
  {
    Position = (1820.823, -181.2646, 2027.529)
    Angles = (0, 0, 0)
    name = TRG_76
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_77 ]
  }
  {
    Position = (1772.926, -167.0023, 2154.986)
    Angles = (0, 0, 0)
    name = TRG_77
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_78 ]
  }
  {
    Position = (1664.883, -157.0554, 2280.001)
    Angles = (0, 0, 0)
    name = TRG_78
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_79 ]
  }
  {
    Position = (1558.109, -156.9914, 2408.593)
    Angles = (0, 0, 0)
    name = TRG_79
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_80 ]
  }
  {
    Position = (1538.749, -159.1216, 2449.643)
    Angles = (0, 0, 0)
    name = TRG_80
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_933 ]
  }
  {
    Position = (1529.024, -158.1931, 2676.958)
    Angles = (0, 0, 0)
    name = TRG_81
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_82 ]
  }
  {
    Position = (1585.011, -162.9325, 2815.417)
    Angles = (0, 0, 0)
    name = TRG_82
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_83 ]
  }
  {
    Position = (1626.37, -183.9574, 2955.849)
    Angles = (0, 0, 0)
    name = TRG_83
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_84 ]
  }
  {
    Position = (1611.258, -207.4328, 3097.596)
    Angles = (0, 0, 0)
    name = TRG_84
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_85 ]
  }
  {
    Position = (1559.999, -228.4926, 3240.001)
    Angles = (0, 0, 0)
    name = TRG_85
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_86 ]
  }
  {
    Position = (1484.682, -230.4556, 3406.223)
    Angles = (0, 0, 0)
    name = TRG_86
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_87 ]
  }
  {
    Position = (1362.892, -229.9345, 3539.621)
    Angles = (0, 0, 0)
    name = TRG_87
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_88 ]
  }
  {
    Position = (1222.421, -231.0521, 3631.434)
    Angles = (0, 0, 0)
    name = TRG_88
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_89 ]
  }
  {
    Position = (1050.828, -228.9776, 3670.511)
    Angles = (0, 0, 0)
    name = TRG_89
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_90 ]
  }
  {
    Position = (862.1993, -228.857, 3659.94)
    Angles = (0, 0, 0)
    name = TRG_90
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_91 ]
  }
  {
    Position = (701.8257, -228.7155, 3576.825)
    Angles = (0, 0, 0)
    name = TRG_91
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_92 ]
  }
  {
    Position = (576.7839, -231.0944, 3464.904)
    Angles = (0, 0, 0)
    name = TRG_92
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_257 ]
  }
  {
    Position = (528.9579, -222.6687, 3916.669)
    Angles = (0, 0, 0)
    name = TRG_192
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_193 ]
  }
  {
    Position = (523.8759, -222.6687, 3855.262)
    Angles = (0, 0, 0)
    name = TRG_193
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_194 ]
  }
  {
    Position = (490.0872, -222.6687, 3808.394)
    Angles = (0, 0, 0)
    name = TRG_194
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_195 ]
  }
  {
    Position = (427.7377, -222.6687, 3779.171)
    Angles = (0, 0, 0)
    name = TRG_195
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_196 ]
  }
  {
    Position = (340.6735, -222.6687, 3764.255)
    Angles = (0, 0, 0)
    name = TRG_196
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_197 ]
  }
  {
    Position = (235.6427, -222.6687, 3758.048)
    Angles = (0, 0, 0)
    name = TRG_197
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_203 ]
  }
  {
    Position = (6.03951, -222.6687, 3758.448)
    Angles = (0, -1.5708, 0)
    name = TRG_198
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_199 ]
  }
  {
    Position = (-100.0666, -222.6687, 3764.875)
    Angles = (0, -1.5708, 0)
    name = TRG_199
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_200 ]
  }
  {
    Position = (-188.3125, -222.6687, 3779.576)
    Angles = (0, -1.5708, 0)
    name = TRG_200
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_201 ]
  }
  {
    Position = (-251.1117, -222.6687, 3807.984)
    Angles = (0, -1.5708, 0)
    name = TRG_201
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_202 ]
  }
  {
    Position = (-284.0505, -222.6687, 3853.612)
    Angles = (0, -1.5708, 0)
    name = TRG_202
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_215 ]
  }
  {
    Position = (121.0484, -222.6687, 3756.554)
    Angles = (0, -1.5708, 0)
    name = TRG_203
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_198 ]
  }
  {
    Position = (221.0722, -222.6687, 4144.676)
    Angles = (0, 1.5708, 0)
    name = TRG_204
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_205 ]
  }
  {
    Position = (317.9143, -222.6687, 4125.062)
    Angles = (0, 1.5708, 0)
    name = TRG_205
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_206 ]
  }
  {
    Position = (400.3121, -222.6687, 4091.606)
    Angles = (0, 1.5708, 0)
    name = TRG_206
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_207 ]
  }
  {
    Position = (464.3781, -222.6687, 4043.704)
    Angles = (0, 1.5708, 0)
    name = TRG_207
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_208 ]
  }
  {
    Position = (508.0315, -222.6687, 3983.108)
    Angles = (0, 1.5708, 0)
    name = TRG_208
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_192 ]
  }
  {
    Position = (116.5679, -222.6687, 4150.907)
    Angles = (0, 1.5708, 0)
    name = TRG_209
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_204 ]
  }
  {
    Position = (-265.0409, -222.6687, 3979.749)
    Angles = (0, -3.14159, 0)
    name = TRG_210
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_211 ]
  }
  {
    Position = (-221.7222, -222.6687, 4040.503)
    Angles = (0, -3.14159, 0)
    name = TRG_211
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_212 ]
  }
  {
    Position = (-159.9865, -222.6687, 4089.043)
    Angles = (0, -3.14159, 0)
    name = TRG_212
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_213 ]
  }
  {
    Position = (-80.91669, -222.6687, 4123.318)
    Angles = (0, -3.14159, 0)
    name = TRG_213
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_214 ]
  }
  {
    Position = (13.13359, -222.6687, 4143.795)
    Angles = (0, -3.14159, 0)
    name = TRG_214
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_209 ]
  }
  {
    Position = (-287.3552, -222.6687, 3913.869)
    Angles = (0, -3.14159, 0)
    name = TRG_215
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Fountain
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_210 ]
  }
  {
    Position = (-1132.913, -206.1064, 4439.692)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge01
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge02 ]
  }
  {
    Position = (-958.0025, -146.2274, 4439.718)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge02
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge03 ]
  }
  {
    Position = (-832.6816, -103.5614, 4439.938)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge04 ]
  }
  {
    Position = (-707.3607, -75.09897, 4439.628)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge05 ]
  }
  {
    Position = (-524.188, -36.29164, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge05
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge06 ]
  }
  {
    Position = (-359.2915, -9.00703, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge07 ]
  }
  {
    Position = (-190.9846, 14.25963, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge08 ]
  }
  {
    Position = (32.69208, 31.67535, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge09 ]
  }
  {
    Position = (298.1649, 26.8945, 4440.23)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge09
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge10 ]
  }
  {
    Position = (418.1648, 14.10853, 4440.23)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge10
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge11 ]
  }
  {
    Position = (586.4717, -6.67624, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge11
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge12 ]
  }
  {
    Position = (751.3682, -33.83514, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge12
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge13 ]
  }
  {
    Position = (934.541, -71.6364, 4439.628)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge13
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge14 ]
  }
  {
    Position = (1059.862, -101.6648, 4439.938)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge14
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge15 ]
  }
  {
    Position = (-183.7153, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_120
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_121 ]
  }
  {
    Position = (-183.7153, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_121
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-159.7153, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_122
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-159.7153, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_123
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_122 ]
  }
  {
    Position = (2399.812, -122.1368, 2465.981)
    Angles = (0, -1.37008, 0)
    name = TRG_Sk3Ed_Rail1672
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1673 ]
  }
  {
    Position = (2447.66, -122.1368, 2230.799)
    Angles = (0, -1.37008, 0)
    name = TRG_Sk3Ed_Rail1673
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2406.301, -155.7368, 2222.384)
    Angles = (0, -1.37008, 0)
    name = TRG_Sk3Ed_Rail1674
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2358.452, -155.7368, 2457.566)
    Angles = (0, -1.37008, 0)
    name = TRG_Sk3Ed_Rail1675
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1674 ]
  }
  {
    Position = (2162.253, -196.0433, 3439.617)
    Angles = (0, -1.5708, 0)
    name = TRG_Sk3Ed_Rail1676
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1677 ]
  }
  {
    Position = (2162.253, -196.0433, 3199.617)
    Angles = (0, -1.5708, 0)
    name = TRG_Sk3Ed_Rail1677
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2120.046, -229.6433, 3199.617)
    Angles = (0, -1.5708, 0)
    name = TRG_Sk3Ed_Rail1678
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2131 ]
  }
  {
    Position = (2120.046, -229.6433, 3439.617)
    Angles = (0, -1.5708, 0)
    name = TRG_Sk3Ed_Rail1679
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1678 ]
  }
  {
    Position = (1801.701, -230.4906, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable09
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (1534.297, -230.4906, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable11
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable09 ]
    TriggerScript = TRG_G_COMPNOT_RailTable11Script
  }
  {
    Position = (1534.297, -230.4906, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable12
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable13 ]
    TriggerScript = TRG_G_COMPNOT_RailTable12Script
  }
  {
    Position = (1801.701, -230.4906, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable13
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (1534.297, -215.4906, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable14
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable15 ]
  }
  {
    Position = (1801.701, -215.4906, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable10
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable14 ]
  }
  {
    Position = (1534.297, -215.4906, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable15
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable16 ]
    TriggerScript = TRG_G_COMPNOT_RailTable15Script
  }
  {
    Position = (1801.701, -215.4906, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable16
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable10 ]
  }
  {
    Position = (2281.388, -213.9871, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_06
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicNormal_03 ]
  }
  {
    Position = (2281.388, -228.9871, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_07
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicNormal_08 ]
    TriggerScript = TRG_Rail_PicnicNormal_07Script
  }
  {
    Position = (2281.388, -228.9871, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_01
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicNormal_02 ]
    TriggerScript = TRG_Rail_PicnicNormal_01Script
  }
  {
    Position = (2546.26, -228.9871, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_02
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2546.26, -228.9871, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_08
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2546.26, -213.9871, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_05
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicNormal_06 ]
  }
  {
    Position = (2281.388, -213.9871, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_03
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicNormal_04 ]
    TriggerScript = TRG_Rail_PicnicNormal_03Script
  }
  {
    Position = (2546.26, -213.9871, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicNormal_04
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicNormal_05 ]
  }
  {
    Position = (1893.658, -215.4906, 4700.341)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable03
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable04 ]
  }
  {
    Position = (1893.658, -230.4906, 4657.29)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable01
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable02 ]
    TriggerScript = TRG_G_COMPNOT_RailTable01Script
  }
  {
    Position = (1893.658, -230.4906, 4837.291)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable07
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable08 ]
    TriggerScript = TRG_G_COMPNOT_RailTable07Script
  }
  {
    Position = (2155.751, -230.4906, 4837.291)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable08
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2155.752, -230.4906, 4657.29)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable02
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2155.752, -215.4906, 4700.341)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable06
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable03 ]
  }
  {
    Position = (1893.658, -215.4906, 4794.24)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable04
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable05 ]
    TriggerScript = TRG_G_COMPNOT_RailTable04Script
  }
  {
    Position = (2155.752, -215.4906, 4794.24)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailTable05
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailTable06 ]
  }
  {
    Position = (-841.9908, -217.1404, 7071.188)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1233
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1234 ]
  }
  {
    Position = (-730.8557, -217.1404, 7109.711)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1234
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1235 ]
  }
  {
    Position = (-701.7382, -217.1404, 7114.601)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1235
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1236 ]
  }
  {
    Position = (-672.6207, -217.1404, 7119.491)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1236
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1237 ]
  }
  {
    Position = (-643.503, -217.1404, 7124.38)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1237
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1238 ]
  }
  {
    Position = (-614.3854, -217.1404, 7129.27)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1238
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1239 ]
  }
  {
    Position = (-583.0661, -217.144, 7125.271)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1239
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-320.9838, -217.144, 7129.268)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1240
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1241 ]
  }
  {
    Position = (-204.5128, -217.144, 7109.707)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1241
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1242 ]
  }
  {
    Position = (-148.9446, -217.1404, 7090.447)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1242
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1243 ]
  }
  {
    Position = (-97.73352, -217.1404, 7062.288)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1243
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1244 ]
  }
  {
    Position = (-52.43472, -217.1404, 7026.088)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1244
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1245 ]
  }
  {
    Position = (-14.42447, -217.1404, 6982.946)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1245
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1246 ]
  }
  {
    Position = (15.14221, -217.1404, 6934.173)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1246
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1247 ]
  }
  {
    Position = (35.36694, -217.1404, 6881.252)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1247
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1248 ]
  }
  {
    Position = (45.63525, -217.1404, 6825.791)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1248
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1249 ]
  }
  {
    Position = (45.63507, -217.1404, 6769.473)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1249
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1250 ]
  }
  {
    Position = (35.36688, -217.1404, 6714.011)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1250
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1251 ]
  }
  {
    Position = (15.14227, -217.1404, 6661.09)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1251
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1252 ]
  }
  {
    Position = (-14.42465, -217.1404, 6612.317)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1252
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1253 ]
  }
  {
    Position = (-52.43671, -217.144, 6569.177)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1253
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1254 ]
  }
  {
    Position = (-97.73518, -217.144, 6532.977)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1254
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1255 ]
  }
  {
    Position = (-148.9456, -217.144, 6504.818)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1255
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1256 ]
  }
  {
    Position = (-204.5127, -217.144, 6485.557)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1256
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1257 ]
  }
  {
    Position = (-262.6876, -217.1404, 6475.125)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1257
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1258 ]
  }
  {
    Position = (-321.9406, -217.1404, 6475.125)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1258
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1259 ]
  }
  {
    Position = (-380.2931, -217.1404, 6484.925)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1259
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1260 ]
  }
  {
    Position = (-435.9747, -217.1404, 6504.226)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1260
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1261 ]
  }
  {
    Position = (-628.743, -217.1404, 6610.221)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1261
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1262 ]
  }
  {
    Position = (-635.9413, -217.1404, 6614.179)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1262
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1263 ]
  }
  {
    Position = (-643.7518, -217.1404, 6616.886)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1263
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1264 ]
  }
  {
    Position = (-651.9374, -217.1404, 6618.261)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1264
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1265 ]
  }
  {
    Position = (-660.2494, -217.1404, 6618.261)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1265
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1266 ]
  }
  {
    Position = (-668.4349, -217.1404, 6616.887)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1266
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1267 ]
  }
  {
    Position = (-712.2891, -217.1404, 6610.183)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1267
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1268 ]
  }
  {
    Position = (-756.6391, -217.1404, 6610.183)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1268
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1269 ]
  }
  {
    Position = (-800.3156, -217.1404, 6617.517)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1269
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1270 ]
  }
  {
    Position = (-841.991, -217.1404, 6631.963)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1270
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1271 ]
  }
  {
    Position = (-880.3995, -217.1404, 6653.083)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1271
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1272 ]
  }
  {
    Position = (-914.3737, -217.1404, 6680.232)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1272
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1273 ]
  }
  {
    Position = (-942.8815, -217.1404, 6712.589)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1273
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1274 ]
  }
  {
    Position = (-965.0551, -217.144, 6749.169)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1274
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1275 ]
  }
  {
    Position = (-980.2235, -217.144, 6788.86)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1275
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1276 ]
  }
  {
    Position = (-987.9248, -217.144, 6830.457)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1276
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1277 ]
  }
  {
    Position = (-987.9247, -217.144, 6872.694)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1277
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1278 ]
  }
  {
    Position = (-980.2252, -217.1404, 6914.291)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1278
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1279 ]
  }
  {
    Position = (-965.0566, -217.1404, 6953.982)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1279
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1280 ]
  }
  {
    Position = (-942.8814, -217.1404, 6990.562)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1280
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2024 ]
  }
  {
    Position = (-880.3992, -217.1404, 7050.069)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1282
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1233 ]
  }
  {
    Position = (-401.4255, 15.01386, 611.553)
    Angles = (0, 0, 0)
    name = TRG_233
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-359.6697, 15.01387, 544.6976)
    Angles = (0, 0, 0)
    name = TRG_234
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_233 ]
  }
  {
    Position = (-359.6698, 15.0139, 64.69781)
    Angles = (0, 0, 0)
    name = TRG_235
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_234 ]
  }
  {
    Position = (-234.7959, 15.0139, 63.17383)
    Angles = (0, 0, 0)
    name = TRG_236
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-234.796, 15.01387, 543.1736)
    Angles = (0, 0, 0)
    name = TRG_237
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_236 ]
  }
  {
    Position = (-193.0402, 15.01386, 610.0289)
    Angles = (0, 0, 0)
    name = TRG_238
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_237 ]
  }
  {
    Position = (488.1496, 15.01387, 544.6976)
    Angles = (0, 0, 0)
    name = TRG_239
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_244 ]
  }
  {
    Position = (613.0233, 15.01387, 543.1736)
    Angles = (0, 0, 0)
    name = TRG_240
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_241 ]
  }
  {
    Position = (613.0234, 15.0139, 63.17383)
    Angles = (0, 0, 0)
    name = TRG_241
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (488.1495, 15.0139, 64.69781)
    Angles = (0, 0, 0)
    name = TRG_242
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_239 ]
  }
  {
    Position = (654.7792, 15.01386, 610.0289)
    Angles = (0, 0, 0)
    name = TRG_243
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_240 ]
  }
  {
    Position = (446.3938, 15.01386, 611.553)
    Angles = (0, 0, 0)
    name = TRG_244
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-1084.423, -205.3172, 3305.647)
    Angles = (0, -3.14159, 0)
    name = TRG_245
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_639 ]
  }
  {
    Position = (-1320, -205.3885, 3240.002)
    Angles = (0, -3.14159, 0)
    name = TRG_246
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_245 ]
  }
  {
    Position = (-1787.839, -101.0433, 2774.83)
    Angles = (0, -3.14159, 0)
    name = TRG_247
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_246 ]
  }
  {
    Position = (-2204.912, -123.3453, 2355.707)
    Angles = (0, -3.14159, 0)
    name = TRG_248
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_247 ]
  }
  {
    Position = (604.2817, 11.028, 2290.803)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    DefaultLine
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand03 ]
  }
  {
    Position = (604.2817, 11.02799, 1889.599)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (604.2816, 11.65777, 1794.331)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand02
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (604.2816, 11.02799, 1556.168)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand01
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand02 ]
  }
  {
    Position = (-364.2818, 11.02801, 2290.803)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand13
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    DefaultLine
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand12 ]
  }
  {
    Position = (-364.2818, 11.028, 1889.599)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand12
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-364.2818, 11.65778, 1794.331)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand11
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-364.2818, 11.028, 1556.168)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand10
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand11 ]
  }
  {
    Position = (599.9999, -116.8508, 3238.549)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand09
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (599.9999, -116.8509, 2837.344)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand09 ]
    TriggerScript = TRG_Rail_ZooMainHand08Script
  }
  {
    Position = (599.9999, -116.2211, 2742.077)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand06 ]
    TriggerScript = TRG_Rail_ZooMainHand07Script
  }
  {
    Position = (599.9999, -116.8509, 2503.914)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand22 TRG_Rail_ZooMainHand04 ]
  }
  {
    Position = (-360.0001, -116.8508, 3238.549)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand18
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand19 ]
  }
  {
    Position = (-360.0001, -116.8508, 2837.344)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand17
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand18 ]
    TriggerScript = TRG_Rail_ZooMainHand17Script
  }
  {
    Position = (-360.0001, -116.2211, 2742.077)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand16
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand15 ]
    TriggerScript = TRG_Rail_ZooMainHand16Script
  }
  {
    Position = (-360.0001, -116.8508, 2503.914)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand15
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand20 TRG_Rail_ZooMainHand13 ]
  }
  {
    Position = (544.5002, -231.851, 3350.675)
    Angles = (0, 0, 0)
    name = TRG_257
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2794.8, 231.7944, 76.91898)
    Angles = (0, 0, 0)
    name = TRG_93
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_94 ]
  }
  {
    Position = (-2903.179, 231.7944, 185.3006)
    Angles = (0, 0, 0)
    name = TRG_94
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_142 ]
  }
  {
    Position = (-2903.177, 231.7943, 870.1999)
    Angles = (0, 0, 0)
    name = TRG_142
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_143 ]
  }
  {
    Position = (-2794.795, 231.8098, 978.5787)
    Angles = (0, 0, 0)
    name = TRG_143
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_144 ]
  }
  {
    Position = (-2078.593, 231.8098, 978.5815)
    Angles = (0, 0, 0)
    name = TRG_144
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_145 ]
  }
  {
    Position = (-1970.214, 231.7943, 870.1999)
    Angles = (0, 0, 0)
    name = TRG_145
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_146 ]
  }
  {
    Position = (-1970.216, 231.7944, 185.3007)
    Angles = (0, 0, 0)
    name = TRG_146
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_147 ]
  }
  {
    Position = (-2078.598, 231.7944, 76.92188)
    Angles = (0, 0, 0)
    name = TRG_147
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_93 ]
  }
  {
    Position = (-2744.649, 164.3611, 894.2775)
    Angles = (0, 0, 0)
    name = TRG_265
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_269 ]
  }
  {
    Position = (-2744.654, 164.3612, 161.2208)
    Angles = (0, 0, 0)
    name = TRG_266
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_267 ]
  }
  {
    Position = (-2832.766, 164.3611, 249.336)
    Angles = (0, 0, 0)
    name = TRG_267
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_268 ]
  }
  {
    Position = (-2832.765, 164.3611, 806.1646)
    Angles = (0, 0, 0)
    name = TRG_268
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_265 ]
  }
  {
    Position = (-2128.876, 164.3611, 894.2797)
    Angles = (0, 0, 0)
    name = TRG_269
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_270 ]
  }
  {
    Position = (-2040.763, 164.3611, 806.1646)
    Angles = (0, 0, 0)
    name = TRG_270
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_271 ]
  }
  {
    Position = (-2040.765, 164.3611, 249.336)
    Angles = (0, 0, 0)
    name = TRG_271
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_272 ]
  }
  {
    Position = (-2128.88, 164.3612, 161.2231)
    Angles = (0, 0, 0)
    name = TRG_272
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_266 ]
  }
  {
    Position = (-2550.78, -122.9373, 1502.404)
    Angles = (0, 0, 0)
    name = TRG_274
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail05
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_369 ]
  }
  {
    Position = (-2550.75, -122.05, 1074.801)
    Angles = (0, 0, 0)
    name = TRG_275
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail05
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_274 ]
  }
  {
    Position = (-2592.016, -124.5704, 2329.745)
    Angles = (0, 0, 0)
    name = TRG_276
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_289 ]
  }
  {
    Position = (-2577.517, -123.1801, 2270.058)
    Angles = (0, 0, 0)
    name = TRG_277
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_276 ]
  }
  {
    Position = (-2577.546, -125.5373, 1767.373)
    Angles = (0, 0, 0)
    name = TRG_278
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryBench02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_277 ]
  }
  {
    Position = (-2334.557, -124.4223, 1500.579)
    Angles = (0, 0, 0)
    name = TRG_280
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail06
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_368 ]
  }
  {
    Position = (-2334.816, -122.4864, 1074.828)
    Angles = (0, 0, 0)
    name = TRG_281
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail06
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_280 ]
  }
  {
    Position = (-2306.161, -123.1802, 2270.057)
    Angles = (0, 0, 0)
    name = TRG_282
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_248 ]
  }
  {
    Position = (-2306.161, -122.7858, 1990.729)
    Angles = (0, 0, 0)
    name = TRG_283
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryBench01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_282 ]
  }
  {
    Position = (-2306.201, -125.5373, 1767.373)
    Angles = (0, 0, 0)
    name = TRG_284
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryBench01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_283 ]
  }
  {
    Position = (-1336.267, -202.7366, 3718.503)
    Angles = (0, -3.14159, 0)
    name = TRG_285
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-1802.041, -96.66226, 3717.462)
    Angles = (0, -3.14159, 0)
    name = TRG_286
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_285 ]
  }
  {
    Position = (-2265.826, -41.35382, 3257.621)
    Angles = (0, -3.14159, 0)
    name = TRG_287
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_286 ]
  }
  {
    Position = (-2593.843, -37.83512, 2760.002)
    Angles = (0, -3.14159, 0)
    name = TRG_288
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_287 ]
  }
  {
    Position = (-2592.016, -77.43523, 2525.387)
    Angles = (0, 0, 0)
    name = TRG_289
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_288 ]
  }
  {
    Position = (-2014.774, -197.7431, 4475.885)
    Angles = (0, 0, 0)
    name = TRG_162
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail19
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_296 ]
  }
  {
    Position = (-1893.031, -197.4576, 4475.885)
    Angles = (0, 0, 0)
    name = TRG_163
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail19
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_162 ]
  }
  {
    Position = (-4146.93, -624.837, 4897.869)
    Angles = (0, 0, 0)
    name = TRG_292
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_293 ]
  }
  {
    Position = (-3786.93, -502.2463, 4897.869)
    Angles = (0, 0, 0)
    name = TRG_293
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_294 ]
  }
  {
    Position = (-3079.106, -296.3819, 4897.869)
    Angles = (0, 0, 0)
    name = TRG_294
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_295 ]
  }
  {
    Position = (-2706.93, -257.0921, 4897.869)
    Angles = (0, 0, 0)
    name = TRG_295
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2361.972, -258.1638, 4475.885)
    Angles = (0, 0, 0)
    name = TRG_296
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail19
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-1891.257, -197.141, 4897.437)
    Angles = (0, 0, 0)
    name = TRG_297
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail16
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_298 ]
  }
  {
    Position = (-2013.031, -197.5841, 4897.437)
    Angles = (0, 0, 0)
    name = TRG_298
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail16
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_299 ]
  }
  {
    Position = (-2360.198, -257.8472, 4897.437)
    Angles = (0, 0, 0)
    name = TRG_299
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail16
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1185.183, -140.787, 4439.718)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge15
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge16 ]
  }
  {
    Position = (1378.562, -206.86, 4439.703)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge16
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-1132.913, -206.1064, 4919.031)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide01
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide02 ]
  }
  {
    Position = (-958.0026, -146.2274, 4919.057)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide02
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide03 ]
  }
  {
    Position = (-832.6818, -103.5614, 4919.278)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide04 ]
  }
  {
    Position = (-707.3608, -75.09897, 4918.967)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide05 ]
  }
  {
    Position = (-524.1882, -36.29164, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide05
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide06 ]
  }
  {
    Position = (-359.2917, -9.00703, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide07 ]
  }
  {
    Position = (-190.9847, 14.25963, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide08 ]
  }
  {
    Position = (32.69196, 31.67535, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide09 ]
  }
  {
    Position = (212.692, 31.67516, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide09
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide10 ]
  }
  {
    Position = (418.1647, 15.40852, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide10
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide11 ]
  }
  {
    Position = (586.4716, -6.67624, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide11
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide12 ]
  }
  {
    Position = (751.368, -33.83514, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide12
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide13 ]
  }
  {
    Position = (934.5409, -71.6364, 4918.967)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide13
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide14 ]
  }
  {
    Position = (1059.862, -101.6648, 4919.278)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide14
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide15 ]
  }
  {
    Position = (1185.183, -140.787, 4919.057)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide15
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Bridge_CompSide16 ]
  }
  {
    Position = (1378.562, -206.86, 4919.042)
    Angles = (0, 0, 0)
    name = TRG_Rail_Bridge_CompSide16
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-4884.645, -237.5595, 3729.421)
    Angles = (0, 0, 0)
    name = TRG_168
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_340 ]
  }
  {
    Position = (-5218.141, -237.7357, 3499.435)
    Angles = (0, 0, 0)
    name = TRG_169
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_326 ]
  }
  {
    Position = (-5555.354, -237.7357, 3496.9)
    Angles = (0, 0, 0)
    name = TRG_170
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_328 ]
  }
  {
    Position = (-5887.25, -237.5596, 3730.233)
    Angles = (0, 0, 0)
    name = TRG_171
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_329 ]
  }
  {
    Position = (-5887.4, -237.5596, 5636.07)
    Angles = (0, 0, 0)
    name = TRG_172
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_331 ]
  }
  {
    Position = (-5552.527, -237.7356, 5862.545)
    Angles = (0, 0, 0)
    name = TRG_173
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_333 ]
  }
  {
    Position = (-5217.252, -237.7356, 5861.416)
    Angles = (0, 0, 0)
    name = TRG_174
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_336 ]
  }
  {
    Position = (-4884.039, -237.5595, 5637.935)
    Angles = (0, 0, 0)
    name = TRG_175
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_337 ]
  }
  {
    Position = (-5193.399, -237.7357, 3510.598)
    Angles = (0, 0, 0)
    name = TRG_325
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_169 ]
  }
  {
    Position = (-5245.167, -237.7357, 3493.751)
    Angles = (0, 0, 0)
    name = TRG_326
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_327 ]
  }
  {
    Position = (-5535.929, -237.7357, 3493.981)
    Angles = (0, 0, 0)
    name = TRG_327
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_170 ]
  }
  {
    Position = (-5567.961, -237.7357, 3503.686)
    Angles = (0, 0, 0)
    name = TRG_328
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_330 ]
  }
  {
    Position = (-5890.473, -237.5596, 3745.547)
    Angles = (0, 0, 0)
    name = TRG_329
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_332 ]
  }
  {
    Position = (-5879.201, -237.5596, 3721.244)
    Angles = (0, 0, 0)
    name = TRG_330
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_171 ]
  }
  {
    Position = (-5877.273, -237.5596, 5647.08)
    Angles = (0, 0, 0)
    name = TRG_331
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_334 ]
  }
  {
    Position = (-5890.423, -237.5596, 5625.504)
    Angles = (0, 0, 0)
    name = TRG_332
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_172 ]
  }
  {
    Position = (-5540.6, -237.7356, 5864.166)
    Angles = (0, 0, 0)
    name = TRG_333
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_335 ]
  }
  {
    Position = (-5562.405, -237.7356, 5858.097)
    Angles = (0, 0, 0)
    name = TRG_334
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_173 ]
  }
  {
    Position = (-5230.83, -237.7356, 5863.399)
    Angles = (0, 0, 0)
    name = TRG_335
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_174 ]
  }
  {
    Position = (-5204.813, -237.7356, 5855.098)
    Angles = (0, 0, 0)
    name = TRG_336
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_338 ]
  }
  {
    Position = (-4880.882, -237.5595, 5628.635)
    Angles = (0, 0, 0)
    name = TRG_337
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_339 ]
  }
  {
    Position = (-4893.903, -237.5595, 5646.897)
    Angles = (0, 0, 0)
    name = TRG_338
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_175 ]
  }
  {
    Position = (-4880.951, -237.5595, 3743.988)
    Angles = (0, 0, 0)
    name = TRG_339
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_168 ]
  }
  {
    Position = (-4896.084, -237.5595, 3718.728)
    Angles = (0, 0, 0)
    name = TRG_340
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_325 ]
  }
  {
    Position = (-1785.508, -216.5436, 4186.19)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1696
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1702 ]
  }
  {
    Position = (-1785.508, -231.5436, 4143.139)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1697
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1700 ]
  }
  {
    Position = (-1785.508, -231.5436, 4323.14)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1698
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1699 ]
  }
  {
    Position = (-1519.745, -231.5436, 4323.14)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1699
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1519.745, -231.5436, 4143.139)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1700
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1519.745, -216.5436, 4186.19)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1701
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1696 ]
  }
  {
    Position = (-1785.508, -216.5436, 4280.089)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1702
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1703 ]
  }
  {
    Position = (-1519.745, -216.5436, 4280.089)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail1703
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail1701 ]
  }
  {
    Position = (-1514.887, -231.9051, 5156.209)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1704
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1783.209, -231.905, 5156.209)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1705
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_Rail1704 ]
  }
  {
    Position = (-1783.21, -231.905, 5336.209)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1706
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_Rail1707 ]
  }
  {
    Position = (-1514.887, -231.905, 5336.209)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1707
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1783.209, -216.905, 5199.26)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1708
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_Rail1710 ]
  }
  {
    Position = (-1514.887, -216.9051, 5199.26)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1709
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_Rail1708 ]
  }
  {
    Position = (-1783.209, -216.905, 5293.159)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1710
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_Rail1711 ]
  }
  {
    Position = (-1514.887, -216.905, 5293.159)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_Rail1711
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_Rail1709 ]
  }
  {
    Position = (-1325.192, -199.8569, 5612.157)
    Angles = (0, 0, 0)
    name = TRG_176
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_341 ]
  }
  {
    Position = (604.9425, -199.8568, 5612.317)
    Angles = (0, 0, 0)
    name = TRG_177
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap09 ]
  }
  {
    Position = (-1826.146, -199.8569, 6113.803)
    Angles = (0, 0, 0)
    name = TRG_341
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_342 ]
  }
  {
    Position = (-1825.632, -199.8568, 7407.392)
    Angles = (0, 0, 0)
    name = TRG_342
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_343 ]
  }
  {
    Position = (-1961.243, -201.8393, 7552.685)
    Angles = (0, 0, 0)
    name = TRG_343
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_344 ]
  }
  {
    Position = (-2124.935, -205.3883, 7552.684)
    Angles = (0, 0, 0)
    name = TRG_344
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_345 ]
  }
  {
    Position = (-2272.075, -205.3882, 7407.392)
    Angles = (0, 0, 0)
    name = TRG_345
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_779 ]
  }
  {
    Position = (-2271.429, -205.3883, 6117.485)
    Angles = (0, 0, 0)
    name = TRG_346
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_943 ]
  }
  {
    Position = (-1783.993, -205.3883, 5629.185)
    Angles = (0, 0, 0)
    name = TRG_347
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1105.899, -199.8569, 6113.697)
    Angles = (0, 0, 0)
    name = TRG_348
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_177 ]
  }
  {
    Position = (1105.127, -199.8568, 7012.432)
    Angles = (0, 0, 0)
    name = TRG_349
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_348 ]
  }
  {
    Position = (3466.629, -205.0481, 4724.307)
    Angles = (0, 0, 0)
    name = TRG_258
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3586.629, -205.0481, 4724.307)
    Angles = (0, 0, 0)
    name = TRG_259
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_258 ]
  }
  {
    Position = (3946.628, -174.9795, 4724.307)
    Angles = (0, 0, 0)
    name = TRG_262
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_259 ]
  }
  {
    Position = (3712.201, -184.689, 4935.664)
    Angles = (0, 0, 0)
    name = TRG_273
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_279 ]
  }
  {
    Position = (3557.76, -196.6201, 4935.664)
    Angles = (0, 0, 0)
    name = TRG_279
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_831 ]
  }
  {
    Position = (3232.201, -205.0481, 4935.664)
    Angles = (0, 0, 0)
    name = TRG_290
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3466.629, -205.0481, 5108.397)
    Angles = (0, 0, 0)
    name = TRG_291
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3586.629, -205.0481, 5108.397)
    Angles = (0, 0, 0)
    name = TRG_350
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_291 ]
  }
  {
    Position = (3946.628, -174.9795, 5108.397)
    Angles = (0, 0, 0)
    name = TRG_351
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_350 ]
  }
  {
    Position = (4229.57, -175.4778, 5391.312)
    Angles = (0, 0, 0)
    name = TRG_352
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_351 ]
  }
  {
    Position = (4622.979, -174.1777, 5389.527)
    Angles = (0, 0, 0)
    name = TRG_353
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_352 ]
  }
  {
    Position = (4903.502, -174.9795, 5107.821)
    Angles = (0, 0, 0)
    name = TRG_354
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_353 ]
  }
  {
    Position = (5023.502, -206.3025, 5107.821)
    Angles = (0, 0, 0)
    name = TRG_355
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_354 ]
  }
  {
    Position = (4228.487, -174.1777, 4443.136)
    Angles = (0, 0, 0)
    name = TRG_356
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_262 ]
  }
  {
    Position = (4622.979, -174.1778, 4443.358)
    Angles = (0, 0, 0)
    name = TRG_357
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_356 ]
  }
  {
    Position = (4903.502, -174.9795, 4725.064)
    Angles = (0, 0, 0)
    name = TRG_358
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_357 ]
  }
  {
    Position = (5023.502, -206.3025, 4725.064)
    Angles = (0, 0, 0)
    name = TRG_359
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_358 ]
  }
  {
    Position = (4109.601, -29.50734, 5047.632)
    Angles = (0, 0, 0)
    name = TRG_360
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_363 ]
  }
  {
    Position = (4289.065, -29.35611, 5244.478)
    Angles = (0, 0, 0)
    name = TRG_361
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_980 ]
  }
  {
    Position = (4561.286, -29.35611, 5244.478)
    Angles = (0, 0, 0)
    name = TRG_362
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_361 ]
  }
  {
    Position = (4109.601, -29.50734, 4785.584)
    Angles = (0, 0, 0)
    name = TRG_363
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_981 ]
  }
  {
    Position = (4289.065, -29.35611, 4587.278)
    Angles = (0, 0, 0)
    name = TRG_364
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_365 ]
  }
  {
    Position = (4561.286, -29.35611, 4587.278)
    Angles = (0, 0, 0)
    name = TRG_365
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_366 ]
  }
  {
    Position = (4753.775, -29.35611, 4779.768)
    Angles = (0, 0, 0)
    name = TRG_366
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_367 ]
  }
  {
    Position = (4753.775, -29.35611, 5051.989)
    Angles = (0, 0, 0)
    name = TRG_367
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_362 ]
  }
  {
    Position = (-2306.201, -125.5373, 1647.373)
    Angles = (0, 0, 0)
    name = TRG_368
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryBench01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_284 ]
  }
  {
    Position = (-2577.546, -125.5373, 1546.495)
    Angles = (0, 0, 0)
    name = TRG_369
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryBench02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_278 ]
  }
  {
    Position = (1605.708, -205.4144, 7158.574)
    Angles = (0, 0, 0)
    name = TRG_370
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1690.451, -201.5112, 6144.959)
    Angles = (0, 0, 0)
    name = TRG_371
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_370 ]
  }
  {
    Position = (2003.142, -201.5112, 5751.193)
    Angles = (0, 0, 0)
    name = TRG_372
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_920 ]
  }
  {
    Position = (2515.224, -201.5111, 5638.265)
    Angles = (0, 0, 0)
    name = TRG_373
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_620 ]
  }
  {
    Position = (4445.287, -201.5111, 5638.265)
    Angles = (0, 0, 0)
    name = TRG_375
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_373 ]
  }
  {
    Position = (4959.856, -201.5111, 5760.474)
    Angles = (0, 0, 0)
    name = TRG_376
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_629 ]
  }
  {
    Position = (5310.219, -201.5112, 6112.189)
    Angles = (0, 0, 0)
    name = TRG_377
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_626 ]
  }
  {
    Position = (5313.074, -206.7879, 6216.206)
    Angles = (0, 0, 0)
    name = TRG_378
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_377 ]
  }
  {
    Position = (2043.506, -334.3776, 7011.489)
    Angles = (0, 0, 0)
    name = TRG_379
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_380 ]
  }
  {
    Position = (2077.036, -334.3776, 6257.674)
    Angles = (0, 0, 0)
    name = TRG_380
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_622 ]
  }
  {
    Position = (2226.522, -334.3776, 6135.468)
    Angles = (0, 0, 0)
    name = TRG_381
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_621 ]
  }
  {
    Position = (2520, -334.3776, 6078.533)
    Angles = (0, 0, 0)
    name = TRG_382
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_631 ]
  }
  {
    Position = (4440.001, -334.3776, 6078.533)
    Angles = (0, 0, 0)
    name = TRG_383
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_623 ]
  }
  {
    Position = (4740.759, -334.3776, 6136.729)
    Angles = (0, 0, 0)
    name = TRG_384
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_624 ]
  }
  {
    Position = (4880.589, -334.3776, 6246.257)
    Angles = (0, 0, 0)
    name = TRG_385
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_386 ]
  }
  {
    Position = (4898.066, -334.3776, 6572.151)
    Angles = (0, 0, 0)
    name = TRG_386
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_918 ]
  }
  {
    Position = (2466.76, -190.9452, 1918.915)
    Angles = (0, 0, 0)
    name = TRG_388
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2434.316, -185.4263, 1985.768)
    Angles = (0, 0, 0)
    name = TRG_389
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_388 ]
  }
  {
    Position = (2435.251, -180.6057, 2028.586)
    Angles = (0, 0, 0)
    name = TRG_390
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_389 ]
  }
  {
    Position = (2433.979, -176.169, 2075.393)
    Angles = (0, 0, 0)
    name = TRG_391
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_390 ]
  }
  {
    Position = (2424.735, -167.5873, 2154.215)
    Angles = (0, 0, 0)
    name = TRG_392
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_391 ]
  }
  {
    Position = (2333.875, -156.0029, 2514.296)
    Angles = (0, 0, 0)
    name = TRG_394
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_956 ]
  }
  {
    Position = (2190.602, -157.0509, 2776.931)
    Angles = (0, 0, 0)
    name = TRG_395
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_394 ]
  }
  {
    Position = (2177.626, -190.5972, 2992.332)
    Angles = (0, 0, 0)
    name = TRG_396
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_395 ]
  }
  {
    Position = (2145.036, -218.8375, 3118.597)
    Angles = (0, 0, 0)
    name = TRG_397
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_396 ]
  }
  {
    Position = (2135.263, -228.5511, 3515.703)
    Angles = (0, 0, 0)
    name = TRG_399
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_953 ]
  }
  {
    Position = (2137.128, -228.5511, 3594.988)
    Angles = (0, 0, 0)
    name = TRG_400
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_399 ]
  }
  {
    Position = (2040.149, -228.5511, 3720.002)
    Angles = (0, 0, 0)
    name = TRG_401
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_400 ]
  }
  {
    Position = (2045.853, -228.5511, 3848.594)
    Angles = (0, 0, 0)
    name = TRG_402
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_401 ]
  }
  {
    Position = (2127.446, -228.5511, 3981.133)
    Angles = (0, 0, 0)
    name = TRG_403
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_402 ]
  }
  {
    Position = (2233.941, -228.5511, 4116.96)
    Angles = (0, 0, 0)
    name = TRG_404
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_403 ]
  }
  {
    Position = (2354.499, -228.551, 4227.25)
    Angles = (0, 0, 0)
    name = TRG_405
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_404 ]
  }
  {
    Position = (2437.055, -228.5511, 4354.659)
    Angles = (0, 0, 0)
    name = TRG_406
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_405 ]
  }
  {
    Position = (2486.233, -228.5511, 4473.386)
    Angles = (0, 0, 0)
    name = TRG_407
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_406 ]
  }
  {
    Position = (2564.464, -228.5511, 4575.338)
    Angles = (0, 0, 0)
    name = TRG_408
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_407 ]
  }
  {
    Position = (2666.417, -228.5511, 4653.569)
    Angles = (0, 0, 0)
    name = TRG_409
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_408 ]
  }
  {
    Position = (2785.143, -228.5511, 4702.747)
    Angles = (0, 0, 0)
    name = TRG_410
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_409 ]
  }
  {
    Position = (2912.552, -228.5511, 4719.521)
    Angles = (0, 0, 0)
    name = TRG_411
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_410 ]
  }
  {
    Position = (3039.961, -228.5511, 4702.748)
    Angles = (0, 0, 0)
    name = TRG_412
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_411 ]
  }
  {
    Position = (3158.688, -228.5511, 4653.569)
    Angles = (0, 0, 0)
    name = TRG_413
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_412 ]
  }
  {
    Position = (3260.641, -228.5511, 4575.339)
    Angles = (0, 0, 0)
    name = TRG_414
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_413 ]
  }
  {
    Position = (3338.871, -228.5511, 4473.386)
    Angles = (0, 0, 0)
    name = TRG_415
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_414 ]
  }
  {
    Position = (3404.082, -228.5511, 4354.66)
    Angles = (0, 0, 0)
    name = TRG_416
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_415 ]
  }
  {
    Position = (3509.584, -228.5511, 4227.25)
    Angles = (0, 0, 0)
    name = TRG_417
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_416 ]
  }
  {
    Position = (3866.869, -228.5511, 4167.382)
    Angles = (0, 0, 0)
    name = TRG_418
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_951 ]
  }
  {
    Position = (4441.903, -228.5511, 4229.37)
    Angles = (0, 0, 0)
    name = TRG_419
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_418 ]
  }
  {
    Position = (4918.487, -228.5511, 4260.028)
    Angles = (0, 0, 0)
    name = TRG_420
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_419 ]
  }
  {
    Position = (5361.758, -228.5511, 4220.785)
    Angles = (0, 0, 0)
    name = TRG_421
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_420 ]
  }
  {
    Position = (4073.235, -183.4923, 4770.521)
    Angles = (0, 0, 0)
    name = TRG_423
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (4279.833, -183.4923, 4563.923)
    Angles = (0, 0, 0)
    name = TRG_424
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_423 ]
  }
  {
    Position = (4572.007, -183.4923, 4563.923)
    Angles = (0, 0, 0)
    name = TRG_425
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_424 ]
  }
  {
    Position = (4778.605, -183.4923, 4770.521)
    Angles = (0, 0, 0)
    name = TRG_426
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_425 ]
  }
  {
    Position = (4778.605, -183.4923, 5062.695)
    Angles = (0, 0, 0)
    name = TRG_427
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_426 ]
  }
  {
    Position = (4572.007, -183.4923, 5269.293)
    Angles = (0, 0, 0)
    name = TRG_428
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_427 ]
  }
  {
    Position = (4279.833, -183.4923, 5269.293)
    Angles = (0, 0, 0)
    name = TRG_429
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_428 ]
  }
  {
    Position = (4073.235, -183.4923, 5062.695)
    Angles = (0, 0, 0)
    name = TRG_430
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_429 ]
  }
  {
    Position = (3262.457, -177.5037, 5756.025)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_480
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_481 ]
  }
  {
    Position = (3242.009, -179.491, 5799.957)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_481
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_482 ]
  }
  {
    Position = (3222.016, -179.4502, 5844.529)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_482
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_921 ]
  }
  {
    Position = (3184.981, -192.224, 5934.249)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_483
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_484 ]
  }
  {
    Position = (3168.688, -210.9152, 5980.975)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_484
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_485 ]
  }
  {
    Position = (3154.333, -234.8996, 6025.283)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_485
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_486 ]
  }
  {
    Position = (3142.215, -259.8018, 6065.46)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_486
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_488 ]
  }
  {
    Position = (3125.663, -310.7801, 6138.907)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_487
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3132.589, -286.1201, 6103.871)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_488
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_487 ]
  }
  {
    Position = (2506.487, -170.6918, 1868.937)
    Angles = (0, 0, 0)
    name = TRG_387
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail03
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2611.381, -170.6918, 1778.762)
    Angles = (0, 0, 0)
    name = TRG_489
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_387 ]
  }
  {
    Position = (2759.565, -170.7162, 1778.762)
    Angles = (0, 0, 0)
    name = TRG_490
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_489 ]
  }
  {
    Position = (5454.257, -205.4144, 3725.442)
    Angles = (0, 0, 0)
    name = TRG_422
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5454.257, -205.4144, 4157.125)
    Angles = (0, 0, 0)
    name = TRG_499
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_422 ]
  }
  {
    Position = (5669.4, -205.4144, 4157.125)
    Angles = (0, 0, 0)
    name = TRG_500
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_501 ]
  }
  {
    Position = (5669.4, -205.4144, 3725.442)
    Angles = (0, 0, 0)
    name = TRG_501
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5935.313, -205.4144, 3725.442)
    Angles = (0, 0, 0)
    name = TRG_502
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5935.313, -205.4144, 4157.125)
    Angles = (0, 0, 0)
    name = TRG_503
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_502 ]
  }
  {
    Position = (-484.3534, -116.8508, 3238.549)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand19
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3470.105, -206.8668, 5656.444)
    Angles = (0, 0, 0)
    name = TRG_178
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_970 ]
  }
  {
    Position = (3473.712, -206.8668, 5656.444)
    Angles = (0, 0, 0)
    name = TRG_505
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_507 ]
  }
  {
    Position = (3469.225, -155.7463, 6094.701)
    Angles = (0, 0, 0)
    name = TRG_506
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_178 ]
  }
  {
    Position = (3473.713, -155.7463, 6094.701)
    Angles = (0, 0, 0)
    name = TRG_507
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_509 ]
  }
  {
    Position = (3469.225, -95.80627, 6574.701)
    Angles = (0, 0, 0)
    name = TRG_508
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_506 ]
  }
  {
    Position = (3473.713, -95.80627, 6574.7)
    Angles = (0, 0, 0)
    name = TRG_509
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_511 ]
  }
  {
    Position = (3468.02, -95.8063, 7130.041)
    Angles = (0, 0, 0)
    name = TRG_510
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_508 ]
  }
  {
    Position = (3474.918, -95.8063, 7130.041)
    Angles = (0, 0, 0)
    name = TRG_511
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_961 ]
  }
  {
    Position = (4950.974, -204.3907, 3778.879)
    Angles = (0, 0, 0)
    name = TRG_519
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_683 ]
  }
  {
    Position = (4890.899, -204.8581, 3943.878)
    Angles = (0, 0, 0)
    name = TRG_520
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_519 ]
  }
  {
    Position = (4777.997, -204.8581, 4078.431)
    Angles = (0, 0, 0)
    name = TRG_521
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_520 ]
  }
  {
    Position = (4625.883, -204.8581, 4166.253)
    Angles = (0, 0, 0)
    name = TRG_522
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_521 ]
  }
  {
    Position = (4452.906, -204.8581, 4196.754)
    Angles = (0, 0, 0)
    name = TRG_523
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_522 ]
  }
  {
    Position = (4221.612, -204.8581, 4166.307)
    Angles = (0, 0, 0)
    name = TRG_524
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_523 ]
  }
  {
    Position = (3986.957, -204.8581, 4078.484)
    Angles = (0, 0, 0)
    name = TRG_525
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_524 ]
  }
  {
    Position = (3874.054, -204.8581, 3943.932)
    Angles = (0, 0, 0)
    name = TRG_526
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_525 ]
  }
  {
    Position = (3813.98, -204.8581, 3778.879)
    Angles = (0, 0, 0)
    name = TRG_527
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_526 ]
  }
  {
    Position = (22.84789, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_530
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (46.84789, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_531
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (46.84789, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_532
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_531 ]
  }
  {
    Position = (22.84789, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_533
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_530 ]
  }
  {
    Position = (192.3367, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_542
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (216.3367, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_543
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (419.7596, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_552
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (419.7596, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_553
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_552 ]
  }
  {
    Position = (216.3367, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_554
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_543 ]
  }
  {
    Position = (192.3367, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_555
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_542 ]
  }
  {
    Position = (395.7596, 11.46038, 1262.298)
    Angles = (0, 0, 0)
    name = TRG_556
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (395.7596, 11.46038, 1358.298)
    Angles = (0, 0, 0)
    name = TRG_557
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_556 ]
  }
  {
    Position = (-315.6826, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_112
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_113 ]
  }
  {
    Position = (-315.6826, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_113
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-266.1418, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_114
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_115 ]
  }
  {
    Position = (-266.1418, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_115
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-111.4108, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_116
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_117 ]
  }
  {
    Position = (-111.4107, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_117
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-61.86993, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_118
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-61.86996, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_119
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_118 ]
  }
  {
    Position = (95.98106, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_124
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_125 ]
  }
  {
    Position = (95.98109, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_125
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (145.5219, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_126
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (145.5219, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_127
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_126 ]
  }
  {
    Position = (298.2678, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_128
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_129 ]
  }
  {
    Position = (298.2679, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_129
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (347.8087, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_130
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (347.8086, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_131
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_130 ]
  }
  {
    Position = (504.7548, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_132
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_133 ]
  }
  {
    Position = (504.7548, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_133
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (554.2957, 11.65778, 1357.102)
    Angles = (0, 0, 0)
    name = TRG_134
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (554.2957, 11.028, 1264.008)
    Angles = (0, 0, 0)
    name = TRG_135
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_134 ]
  }
  {
    Position = (702.3384, 197.7689, 1319.837)
    Angles = (0, 0, 0)
    name = TRG_547
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_548 ]
    TriggerScript = TRG_547Script
  }
  {
    Position = (702.3383, 197.769, 2260.424)
    Angles = (0, 0, 0)
    name = TRG_548
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (702.1161, 77.48174, 2295.77)
    Angles = (0, 0, 0)
    name = TRG_549
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_550 ]
  }
  {
    Position = (702.1174, 77.4825, 3236.356)
    Angles = (0, 0, 0)
    name = TRG_550
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-462.1174, 224.7226, 1320.428)
    Angles = (0, 0, 0)
    name = TRG_551
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-462.1173, 224.7224, 2261.015)
    Angles = (0, 0, 0)
    name = TRG_559
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_551 ]
    TriggerScript = TRG_559Script
  }
  {
    Position = (-461.8969, 77.4825, 2295.769)
    Angles = (0, 0, 0)
    name = TRG_560
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-461.8956, 77.48174, 3267.885)
    Angles = (0, 0, 0)
    name = TRG_561
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_560 ]
  }
  {
    Position = (-461.8976, 77.76983, 3270.006)
    Angles = (0, 0, 0)
    name = TRG_562
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_561 TRG_581 ]
  }
  {
    Position = (-130.7973, 48.69184, 3269.545)
    Angles = (0, 0, 0)
    name = TRG_563
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_562 ]
  }
  {
    Position = (35.70493, 43.16811, 3269.545)
    Angles = (0, 0, 0)
    name = TRG_564
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_563 ]
  }
  {
    Position = (202.2072, 43.16811, 3269.545)
    Angles = (0, 0, 0)
    name = TRG_565
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_564 ]
  }
  {
    Position = (368.7094, 48.69184, 3269.545)
    Angles = (0, 0, 0)
    name = TRG_566
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_565 ]
  }
  {
    Position = (535.2117, 65.46835, 3269.545)
    Angles = (0, 0, 0)
    name = TRG_567
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_566 ]
  }
  {
    Position = (701.7139, 75.30619, 3269.545)
    Angles = (0, 0, 0)
    name = TRG_568
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_567 ]
  }
  {
    Position = (-495.5463, 272.8117, 3236.355)
    Angles = (0, 0, 0)
    name = TRG_576
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_583 ]
  }
  {
    Position = (-1014.359, 272.8117, 3236.355)
    Angles = (0, 0, 0)
    name = TRG_577
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_735 ]
  }
  {
    Position = (735.7681, 272.8122, 3236.356)
    Angles = (0, 0, 0)
    name = TRG_579
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1035 ]
  }
  {
    Position = (1252.838, 77.48325, 3268.33)
    Angles = (0, 0, 0)
    name = TRG_580
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_675 ]
  }
  {
    Position = (-1009.216, 77.76983, 3270.006)
    Angles = (0, 0, 0)
    name = TRG_581
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingLedge01
    DefaultLine
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1030 TRG_1029 ]
  }
  {
    Position = (735.7668, 272.8117, 2295.77)
    Angles = (0, 0, 0)
    name = TRG_582
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_579 ]
  }
  {
    Position = (-495.5475, 272.8122, 2295.77)
    Angles = (0, 0, 0)
    name = TRG_583
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop
    DefaultLine
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_592 ]
  }
  {
    Position = (6000, 47.99664, 4218.686)
    Angles = (0, 0, 0)
    name = TRG_588
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_832 ]
  }
  {
    Position = (5994.609, 51.78902, 5637.737)
    Angles = (0, 0, 0)
    name = TRG_589
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_966 ]
  }
  {
    Position = (-746.8425, 253.5736, 2359.974)
    Angles = (0, -3.14159, 0)
    name = TRG_RestartRooftops01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Rooftops-Left"
  }
  {
    Position = (-1014.361, 272.8123, 2295.769)
    Angles = (0, 0, 0)
    name = TRG_592
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_577 ]
  }
  {
    Position = (1254.582, 272.8124, 2295.769)
    Angles = (0, 0, 0)
    name = TRG_596
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_582 ]
  }
  {
    Position = (1254.58, 272.8118, 3236.355)
    Angles = (0, 0, 0)
    name = TRG_597
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_596 ]
  }
  {
    Position = (-1096.022, 55.64343, 3432.123)
    Angles = (0, 0, 0)
    name = TRG_599
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_601 ]
  }
  {
    Position = (-1135.75, 42.5919, 3530.453)
    Angles = (0, 0, 0)
    name = TRG_601
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_603 ]
  }
  {
    Position = (-1175.478, 33.31065, 3628.783)
    Angles = (0, 0, 0)
    name = TRG_603
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_605 ]
  }
  {
    Position = (-1215.206, 23.73059, 3727.113)
    Angles = (0, 0, 0)
    name = TRG_605
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-3786.93, -502.2463, 4468.363)
    Angles = (0, 0, 0)
    name = TRG_608
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_609 ]
  }
  {
    Position = (-3079.106, -296.3819, 4468.363)
    Angles = (0, 0, 0)
    name = TRG_609
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_610 ]
  }
  {
    Position = (-2706.93, -257.0921, 4468.363)
    Angles = (0, 0, 0)
    name = TRG_610
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-4146.93, -624.837, 4468.363)
    Angles = (0, 0, 0)
    name = TRG_611
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_608 ]
  }
  {
    Position = (-484.0973, 272.8117, 3236.355)
    Angles = (0, 0, 0)
    name = TRG_612
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_734 ]
  }
  {
    Position = (-180.1622, 13.8799, 4450.161)
    Angles = (0, 0, 0)
    name = TRG_613
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1032 ]
  }
  {
    Position = (740.9667, 272.8122, 3236.356)
    Angles = (0, 0, 0)
    name = TRG_614
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_597 ]
  }
  {
    Position = (421.2905, 13.69113, 4448.708)
    Angles = (0, 0, 0)
    name = TRG_615
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-0.00002, 186.0444, 803.5272)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance04
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance16 ]
  }
  {
    Position = (-419.5194, 186.0443, 803.5273)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance05
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance04 ]
  }
  {
    Position = (-383.9864, 167.7625, 681.3862)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance07
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance05 ]
  }
  {
    Position = (-0.00002, 167.7626, 491.8307)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance03
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (240, 167.7625, 491.8307)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance08
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance15 ]
  }
  {
    Position = (240, 186.0443, 803.5272)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance09
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance13 ]
  }
  {
    Position = (668.2999, 186.0443, 803.5272)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance13
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance12 ]
  }
  {
    Position = (632.7669, 167.7625, 681.3862)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance12
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance11 ]
  }
  {
    Position = (499.5667, 167.7625, 480.0002)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance11
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-259.5668, 167.7625, 480.0002)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance14
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance07 ]
  }
  {
    Position = (2635.166, 110.7118, 1800.001)
    Angles = (0, 0, 0)
    name = TRG_148
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_149 ]
  }
  {
    Position = (3479.999, 110.8702, 1800.001)
    Angles = (0, 0, 0)
    name = TRG_149
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_150 ]
  }
  {
    Position = (3959.999, 110.9494, 1320)
    Angles = (0, 0, 0)
    name = TRG_150
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_151 ]
  }
  {
    Position = (3959.999, 110.9494, 359.9993)
    Angles = (0, 0, 0)
    name = TRG_151
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_152 ]
  }
  {
    Position = (3479.999, 110.8702, -120.0007)
    Angles = (0, 0, 0)
    name = TRG_152
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_153 ]
  }
  {
    Position = (2519.999, 110.7118, -120.0002)
    Angles = (0, 0, 0)
    name = TRG_153
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_154 ]
  }
  {
    Position = (2039.999, 110.6326, 360.0002)
    Angles = (0, 0, 0)
    name = TRG_154
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_155 ]
  }
  {
    Position = (2039.999, 110.6326, 840.0005)
    Angles = (0, 0, 0)
    name = TRG_155
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_640 ]
    TriggerScript = TRG_155Script
  }
  {
    Position = (2720.063, 240.9899, 722.5471)
    Angles = (0, 0, 0)
    name = TRG_166
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_167 ]
  }
  {
    Position = (2720.063, 240.9899, 954.4533)
    Angles = (0, 0, 0)
    name = TRG_167
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_431 ]
  }
  {
    Position = (2884.046, 240.9899, 1118.436)
    Angles = (0, 0, 0)
    name = TRG_431
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_432 ]
  }
  {
    Position = (3115.952, 240.9899, 1118.436)
    Angles = (0, 0, 0)
    name = TRG_432
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_433 ]
  }
  {
    Position = (3279.934, 240.9899, 954.4533)
    Angles = (0, 0, 0)
    name = TRG_433
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_434 ]
  }
  {
    Position = (3279.934, 240.9899, 722.5471)
    Angles = (0, 0, 0)
    name = TRG_434
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_435 ]
  }
  {
    Position = (3115.952, 240.9899, 558.5648)
    Angles = (0, 0, 0)
    name = TRG_435
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_436 ]
  }
  {
    Position = (2884.046, 240.9899, 558.5647)
    Angles = (0, 0, 0)
    name = TRG_436
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_166 ]
  }
  {
    Position = (2658.099, 120.9118, 8.37274)
    Angles = (0, 0, 0)
    name = TRG_437
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_438 ]
  }
  {
    Position = (2171.82, 120.9118, 494.6513)
    Angles = (0, 0, 0)
    name = TRG_438
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_439 ]
  }
  {
    Position = (2171.82, 120.9118, 1182.353)
    Angles = (0, 0, 0)
    name = TRG_439
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_440 ]
  }
  {
    Position = (2658.099, 120.9118, 1668.632)
    Angles = (0, 0, 0)
    name = TRG_440
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_441 ]
  }
  {
    Position = (3345.8, 120.9118, 1668.632)
    Angles = (0, 0, 0)
    name = TRG_441
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_442 ]
  }
  {
    Position = (3832.079, 120.9118, 1182.353)
    Angles = (0, 0, 0)
    name = TRG_442
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_443 ]
  }
  {
    Position = (3832.079, 120.9118, 494.6513)
    Angles = (0, 0, 0)
    name = TRG_443
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_444 ]
  }
  {
    Position = (3345.8, 120.9118, 8.3728)
    Angles = (0, 0, 0)
    name = TRG_444
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_437 ]
  }
  {
    Position = (1907.882, -198.7813, 1080)
    Angles = (0, 0, 0)
    name = TRG_616
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_72 ]
  }
  {
    Position = (1965.285, -198.7813, 1010.16)
    Angles = (0, 0, 0)
    name = TRG_617
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_616 ]
  }
  {
    Position = (1829.803, -201.5112, 5891.482)
    Angles = (0, 0, 0)
    name = TRG_619
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_919 ]
  }
  {
    Position = (2270.365, -205.4143, 5688.256)
    Angles = (0, 0, 0)
    name = TRG_620
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_372 ]
  }
  {
    Position = (2365.218, -334.3776, 6098.344)
    Angles = (0, 0, 0)
    name = TRG_621
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_382 ]
  }
  {
    Position = (2129.094, -334.3776, 6186.008)
    Angles = (0, 0, 0)
    name = TRG_622
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_381 ]
  }
  {
    Position = (4614.729, -334.3776, 6087.364)
    Angles = (0, 0, 0)
    name = TRG_623
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_384 ]
  }
  {
    Position = (4834.157, -334.3776, 6184.783)
    Angles = (0, 0, 0)
    name = TRG_624
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_385 ]
  }
  {
    Position = (5138.362, -201.5112, 5912.157)
    Angles = (0, 0, 0)
    name = TRG_626
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_376 ]
  }
  {
    Position = (5309.529, -206.7879, 6262.316)
    Angles = (0, 0, 0)
    name = TRG_627
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_378 ]
  }
  {
    Position = (4756.331, -201.5111, 5680.949)
    Angles = (0, 0, 0)
    name = TRG_629
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_375 ]
  }
  {
    Position = (411.2133, -216.1902, 2975.871)
    Angles = (0, -1.5708, -0.05236)
    name = trg_Proset4_Rail16
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench03
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail14 ]
  }
  {
    Position = (451.7119, -182.6362, 2977.63)
    Angles = (0, -1.5708, -0.05236)
    name = trg_Proset4_Rail15
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench03
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail13 ]
  }
  {
    Position = (451.7119, -170.0756, 2737.958)
    Angles = (0, -1.5708, -0.05236)
    name = trg_Proset4_Rail13
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (411.2133, -203.6295, 2736.2)
    Angles = (0, -1.5708, -0.05236)
    name = trg_Proset4_Rail14
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-215.4299, -169.2549, 2740.071)
    Angles = (0, 1.5708, 0.06109)
    name = trg_Proset4_Rail10
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench04
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail12 ]
  }
  {
    Position = (-215.4299, -183.9065, 2979.623)
    Angles = (0, 1.5708, 0.06109)
    name = trg_Proset4_Rail12
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench04
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-174.9313, -217.4439, 2977.572)
    Angles = (0, 1.5708, 0.06109)
    name = trg_Proset4_Rail11
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench04
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-174.9312, -202.7922, 2738.019)
    Angles = (0, 1.5708, 0.06109)
    name = trg_Proset4_Rail09
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench04
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail11 ]
  }
  {
    Position = (451.7119, -23.1209, 1830.878)
    Angles = (0, -1.5708, -0.08727)
    name = trg_Proset4_Rail03
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench02
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail01 ]
  }
  {
    Position = (451.7119, -0.11792, 1591.983)
    Angles = (0, -1.5708, -0.08727)
    name = trg_Proset4_Rail01
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (411.2133, -33.56324, 1588.763)
    Angles = (0, -1.5708, -0.08727)
    name = trg_Proset4_Rail02
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (411.2133, -56.56622, 1827.658)
    Angles = (0, -1.5708, -0.08727)
    name = trg_Proset4_Rail04
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench02
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail02 ]
  }
  {
    Position = (-215.4299, -0.11792, 1591.814)
    Angles = (0, 1.5708, 0.09599)
    name = trg_Proset4_Rail06
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail08 ]
  }
  {
    Position = (-215.4299, -23.1209, 1830.71)
    Angles = (0, 1.5708, 0.09599)
    name = trg_Proset4_Rail08
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-174.9313, -56.56622, 1827.489)
    Angles = (0, 1.5708, 0.09599)
    name = trg_Proset4_Rail07
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-174.9312, -33.56324, 1588.594)
    Angles = (0, 1.5708, 0.09599)
    name = trg_Proset4_Rail05
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset4_Bench01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail07 ]
  }
  {
    Position = (3420.778, -334.3776, 6078.533)
    Angles = (0, 0, 0)
    name = TRG_631
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_911 ]
  }
  {
    Position = (3519.076, -334.3776, 6078.533)
    Angles = (0, 0, 0)
    name = TRG_632
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_383 ]
  }
  {
    Position = (63.65984, 5.61741, -1003.641)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail27
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail29 ]
  }
  {
    Position = (157.5592, 5.61742, -1003.641)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail26
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail27 ]
  }
  {
    Position = (200.6098, -9.38259, -1003.641)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail24
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail25 ]
  }
  {
    Position = (20.60976, -9.38258, -1003.641)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail30
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail31 ]
  }
  {
    Position = (200.61, -9.38261, -736.767)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail25
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (157.5599, 5.6174, -736.767)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail28
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail26 ]
  }
  {
    Position = (20.60992, -9.3826, -736.7672)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail31
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (63.66, 5.6174, -736.7671)
    Angles = (0, 1.5708, 0)
    name = trg_Proset4_Rail29
    Class = RailNode
    type = Wood
    TrickObject Cluster = Entrance_Table01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset4_Rail28 ]
  }
  {
    Position = (-914.1873, -217.1404, 7022.741)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail2024
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1282 ]
  }
  {
    Position = (1725.309, -230.748, 4061.06)
    Angles = (0, 2.1293, 0)
    name = trg_proset3_Rail_CompNot_01
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench06
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset3_Rail_CompNot_02 ]
  }
  {
    Position = (1850.709, -230.748, 3856.426)
    Angles = (0, 2.1293, 0)
    name = trg_proset3_Rail_CompNot_02
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench06
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (1813.265, -197.1479, 3833.481)
    Angles = (0, 2.1293, 0)
    name = trg_proset3_Rail_CompNot_03
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench06
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (1687.865, -197.1479, 4038.115)
    Angles = (0, 2.1293, 0)
    name = trg_proset3_Rail_CompNot_04
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench06
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset3_Rail_CompNot_03 ]
  }
  {
    Position = (1526.465, -230.748, 3687.446)
    Angles = (0, -1.01229, 0)
    name = trg_proset3_Rail_CompNot_05
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench05
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (1401.065, -230.748, 3892.079)
    Angles = (0, -1.01229, 0)
    name = trg_proset3_Rail_CompNot_06
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench05
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset3_Rail_CompNot_05 ]
  }
  {
    Position = (1438.509, -197.1479, 3915.025)
    Angles = (0, -1.01229, 0)
    name = trg_proset3_Rail_CompNot_07
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench05
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset3_Rail_CompNot_08 ]
  }
  {
    Position = (1563.908, -197.1479, 3710.391)
    Angles = (0, -1.01229, 0)
    name = trg_proset3_Rail_CompNot_08
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset3_Bench05
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5871.507, -183.1698, 3719.89)
    Angles = (0, 0, 0)
    name = TRGP_Teleport01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_Teleport01Script
  }
  {
    Position = (-2032.586, -230.6646, 6571.556)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail05
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench02
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset2_Rail07 ]
  }
  {
    Position = (-2032.586, -230.6646, 6811.556)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail07
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-2073.085, -197.0646, 6571.556)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail06
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench02
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset2_Rail08 ]
  }
  {
    Position = (-2073.085, -197.0646, 6811.556)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail08
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-2032.586, -230.6646, 6463.489)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail03
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-2073.085, -197.0646, 6463.489)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail04
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-2032.586, -230.6646, 6223.489)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail01
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench03
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset2_Rail03 ]
  }
  {
    Position = (-2073.085, -197.0646, 6223.489)
    Angles = (0, 1.5708, 0)
    name = trg_proset2_Rail02
    Class = RailNode
    type = Wood
    TrickObject Cluster = proset2_Bench03
    TerrainType = TERRAIN_WOOD
    Links = [ trg_proset2_Rail04 ]
  }
  {
    Position = (2520.001, -249.171, 7271.498)
    Angles = (0, 0, 0)
    name = TRG_56
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_646 ]
  }
  {
    Position = (3327.387, -249.171, 7271.498)
    Angles = (0, 0, 0)
    name = TRG_57
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_949 ]
  }
  {
    Position = (1978.174, -255.0432, 7329)
    Angles = (0, 0, 0)
    name = TRG_58
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_374 ]
  }
  {
    Position = (1849.029, -256.945, 7343.714)
    Angles = (0, 0, 0)
    name = TRG_374
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_445 ]
  }
  {
    Position = (1795.99, -256.945, 7342.789)
    Angles = (0, 0, 0)
    name = TRG_445
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_446 ]
  }
  {
    Position = (1744.999, -256.945, 7328.167)
    Angles = (0, 0, 0)
    name = TRG_446
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_447 ]
  }
  {
    Position = (1699.53, -256.945, 7300.846)
    Angles = (0, 0, 0)
    name = TRG_447
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_448 ]
  }
  {
    Position = (1662.681, -256.945, 7262.688)
    Angles = (0, 0, 0)
    name = TRG_448
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_449 ]
  }
  {
    Position = (1636.963, -256.945, 7216.292)
    Angles = (0, 0, 0)
    name = TRG_449
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_450 ]
  }
  {
    Position = (1625.239, -255.9883, 7164.695)
    Angles = (0, 0, 0)
    name = TRG_450
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_634 ]
  }
  {
    Position = (1630.624, -255.9883, 7153.499)
    Angles = (0, 0, 0)
    name = TRG_634
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3609.188, -249.171, 7271.498)
    Angles = (0, 0, 0)
    name = TRG_453
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_454 ]
  }
  {
    Position = (4440.001, -249.171, 7271.498)
    Angles = (0, 0, 0)
    name = TRG_454
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_647 ]
  }
  {
    Position = (4982.032, -337.2465, 7327.196)
    Angles = (0, 0, 0)
    name = TRG_455
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_635 ]
  }
  {
    Position = (4981.827, -255.0432, 7329)
    Angles = (0, 0, 0)
    name = TRG_456
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_457 ]
  }
  {
    Position = (5110.973, -256.945, 7343.714)
    Angles = (0, 0, 0)
    name = TRG_457
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_458 ]
  }
  {
    Position = (5164.011, -256.945, 7342.789)
    Angles = (0, 0, 0)
    name = TRG_458
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_459 ]
  }
  {
    Position = (5215.002, -256.945, 7328.167)
    Angles = (0, 0, 0)
    name = TRG_459
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_460 ]
  }
  {
    Position = (5260.472, -256.945, 7300.846)
    Angles = (0, 0, 0)
    name = TRG_460
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_461 ]
  }
  {
    Position = (5297.32, -256.945, 7262.688)
    Angles = (0, 0, 0)
    name = TRG_461
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_462 ]
  }
  {
    Position = (5323.038, -256.945, 7216.292)
    Angles = (0, 0, 0)
    name = TRG_462
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_463 ]
  }
  {
    Position = (5335.871, -256.945, 7164.822)
    Angles = (0, 0, 0)
    name = TRG_463
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_636 ]
  }
  {
    Position = (4996.972, -337.2465, 7323.345)
    Angles = (0, 0, 0)
    name = TRG_635
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (5330.889, -256.945, 7045.736)
    Angles = (0, 0, 0)
    name = TRG_636
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_637 ]
  }
  {
    Position = (5323.196, -256.945, 7035.912)
    Angles = (0, 0, 0)
    name = TRG_637
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-4541.409, -666.3391, 4696.347)
    Angles = (0, 1.5708, 0)
    name = TRG_Restart02
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Aquarium01"
  }
  {
    Position = (-1064.197, -205.3172, 3316.073)
    Angles = (0, -3.14159, 0)
    name = TRG_639
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1810.819, 58.11404, 1508.026)
    Angles = (0, 0, 0)
    name = TRG_640
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_641 ]
  }
  {
    Position = (1810.819, 58.11404, 1523.916)
    Angles = (0, 0, 0)
    name = TRG_641
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_642 ]
  }
  {
    Position = (1687.155, 94.24757, 2191.942)
    Angles = (0, 0, 0)
    name = TRG_642
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_643 ]
  }
  {
    Position = (1687.155, 94.24759, 2207.832)
    Angles = (0, 0, 0)
    name = TRG_643
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_644 ]
  }
  {
    Position = (1563.49, 82.1535, 2875.857)
    Angles = (0, 0, 0)
    name = TRG_644
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_645 ]
  }
  {
    Position = (1563.49, 82.1535, 2891.748)
    Angles = (0, 0, 0)
    name = TRG_645
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_676 ]
  }
  {
    Position = (-164.5294, -117.3441, 7186.446)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2045
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2046 ]
  }
  {
    Position = (-247.6326, -120.577, 7157.481)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2046
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2047 ]
  }
  {
    Position = (-268.9866, -120.577, 7153.767)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2047
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2048 ]
  }
  {
    Position = (-290.7777, -120.577, 7150.131)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2048
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2049 ]
  }
  {
    Position = (-312.37, -120.577, 7146.468)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2049
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2050 ]
  }
  {
    Position = (-333.9732, -120.577, 7142.815)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2050
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2051 ]
  }
  {
    Position = (-357.1775, -120.5797, 7142.815)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2051
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2052 ]
  }
  {
    Position = (-552.2915, -118.4848, 7142.537)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2052
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2053 ]
  }
  {
    Position = (-639.4034, -114.6745, 7156.855)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2053
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2054 ]
  }
  {
    Position = (-681.0906, -112.854, 7171.362)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2054
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2055 ]
  }
  {
    Position = (-719.5742, -111.1786, 7192.914)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2055
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2056 ]
  }
  {
    Position = (-753.6624, -109.6967, 7221.063)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2056
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2121 ]
  }
  {
    Position = (-681.0905, -112.8566, 7656.802)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2068
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2069 ]
  }
  {
    Position = (-639.4035, -114.6745, 7673.219)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2069
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2070 ]
  }
  {
    Position = (-595.8002, -116.577, 7681.414)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2070
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2071 ]
  }
  {
    Position = (-551.6223, -118.5115, 7681.162)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2071
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2072 ]
  }
  {
    Position = (-508.2236, -120.4166, 7672.506)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2072
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2073 ]
  }
  {
    Position = (-466.7333, -120.577, 7655.989)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2073
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2074 ]
  }
  {
    Position = (-323.6118, -120.577, 7565.264)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2074
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2075 ]
  }
  {
    Position = (-318.1945, -120.577, 7561.831)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2075
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2076 ]
  }
  {
    Position = (-312.3173, -120.577, 7559.483)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2076
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2077 ]
  }
  {
    Position = (-306.1587, -120.577, 7558.292)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2077
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2078 ]
  }
  {
    Position = (-299.9062, -120.577, 7558.292)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2078
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2079 ]
  }
  {
    Position = (-293.7495, -120.577, 7559.483)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2079
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2080 ]
  }
  {
    Position = (-261.3822, -120.577, 7565.754)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2080
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2081 ]
  }
  {
    Position = (-228.5487, -120.577, 7565.754)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2081
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2082 ]
  }
  {
    Position = (-195.7739, -118.9799, 7559.594)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2082
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2083 ]
  }
  {
    Position = (-164.5292, -117.3441, 7547.332)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2083
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2084 ]
  }
  {
    Position = (-135.6617, -115.8365, 7529.346)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2084
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2085 ]
  }
  {
    Position = (-110.0657, -114.5029, 7506.219)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2085
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2086 ]
  }
  {
    Position = (-88.54138, -113.3839, 7478.71)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2086
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2087 ]
  }
  {
    Position = (-71.76819, -112.5162, 7447.734)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2087
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2088 ]
  }
  {
    Position = (-60.27832, -111.9208, 7414.318)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2088
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2089 ]
  }
  {
    Position = (-54.43965, -111.6185, 7379.563)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2089
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2090 ]
  }
  {
    Position = (-54.43965, -111.6185, 7344.602)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2090
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2091 ]
  }
  {
    Position = (-60.27766, -111.9181, 7310.543)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2091
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2092 ]
  }
  {
    Position = (-71.76744, -112.5135, 7278.435)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2092
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2093 ]
  }
  {
    Position = (-88.54152, -113.3839, 7249.225)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2093
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2095 ]
  }
  {
    Position = (-135.662, -115.8365, 7202.632)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2094
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2045 ]
  }
  {
    Position = (-110.2064, -114.5102, 7223.873)
    Angles = (0, -3.14159, 0.04833)
    name = TRG_Sk3Ed_Rail2095
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2094 ]
  }
  {
    Position = (-345.9542, -217.144, 7126.359)
    Angles = (0, 0, 0)
    name = TRG_Sk3Ed_Rail2096
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail1240 ]
  }
  {
    Position = (4623.34, -302.6748, 6239.694)
    Angles = (0, -0.09599, 0)
    name = TRG_464
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_465 ]
  }
  {
    Position = (4665.642, -275.5497, 6226.274)
    Angles = (0, -0.09599, 0)
    name = TRG_465
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_466 ]
  }
  {
    Position = (4711.141, -254.966, 6212.388)
    Angles = (0, -0.09599, 0)
    name = TRG_466
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_467 ]
  }
  {
    Position = (4758.919, -241.2839, 6198.311)
    Angles = (0, -0.09599, 0)
    name = TRG_467
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_468 ]
  }
  {
    Position = (4808.02, -234.7248, 6184.322)
    Angles = (0, -0.09599, 0)
    name = TRG_468
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_469 ]
  }
  {
    Position = (4857.467, -235.3684, 6170.696)
    Angles = (0, -0.09599, 0)
    name = TRG_469
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_470 ]
  }
  {
    Position = (4902.429, -235.7617, 6158.415)
    Angles = (0, 0, 0)
    name = TRG_470
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_471 ]
  }
  {
    Position = (4947.676, -239.1416, 6146.666)
    Angles = (0, -0.09599, 0)
    name = TRG_471
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_472 ]
  }
  {
    Position = (4994.739, -246.147, 6135.229)
    Angles = (0, -0.09599, 0)
    name = TRG_472
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_473 ]
  }
  {
    Position = (5043.076, -251.8486, 6124.253)
    Angles = (0, -0.09599, 0)
    name = TRG_473
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2278.015, -242.2753, 7286.08)
    Angles = (0, 0, 0)
    name = TRG_646
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_971 ]
  }
  {
    Position = (4664.302, -249.171, 7290.6)
    Angles = (0, 0, 0)
    name = TRG_647
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_648 ]
  }
  {
    Position = (4807.317, -295.143, 7304.226)
    Angles = (0, 0, 0)
    name = TRG_648
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_455 ]
  }
  {
    Position = (-2694.819, 2.1934, 4927.055)
    Angles = (0, 0, 0)
    name = TRG_179
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_180 ]
  }
  {
    Position = (-2694.819, 2.1934, 5579.236)
    Angles = (0, 0, 0)
    name = TRG_180
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_181 ]
  }
  {
    Position = (-2693.684, 2.1934, 5605.678)
    Angles = (0, 0, 0)
    name = TRG_181
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_182 ]
  }
  {
    Position = (-2670.767, 2.1934, 5624.317)
    Angles = (0, 0, 0)
    name = TRG_182
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_183 ]
  }
  {
    Position = (-2395.127, 2.1934, 5624.317)
    Angles = (0, 0, 0)
    name = TRG_183
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_184 ]
  }
  {
    Position = (-2374.134, 2.1934, 5603.326)
    Angles = (0, 0, 0)
    name = TRG_184
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_185 ]
  }
  {
    Position = (-2373.644, 2.1934, 5579.088)
    Angles = (0, 0, 0)
    name = TRG_185
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_186 ]
  }
  {
    Position = (-2373.644, 2.1934, 4926.907)
    Angles = (0, 0, 0)
    name = TRG_186
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2715.548, 2.1934, 4906.062)
    Angles = (0, 0, 0)
    name = TRG_649
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_179 ]
  }
  {
    Position = (-2739.786, 2.1934, 4905.573)
    Angles = (0, 0, 0)
    name = TRG_650
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_649 ]
  }
  {
    Position = (-3372.78, 2.1934, 4905.572)
    Angles = (0, 0, 0)
    name = TRG_651
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_650 ]
  }
  {
    Position = (-2739.786, 2.1934, 4475.189)
    Angles = (0, 0, 0)
    name = TRG_653
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_654 ]
  }
  {
    Position = (-2715.548, 2.1934, 4474.7)
    Angles = (0, 0, 0)
    name = TRG_654
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_655 ]
  }
  {
    Position = (-2694.819, 2.1934, 4453.707)
    Angles = (0, 0, 0)
    name = TRG_655
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_656 ]
  }
  {
    Position = (-2694.819, 2.1934, 3782.473)
    Angles = (0, 0, 0)
    name = TRG_656
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_657 ]
  }
  {
    Position = (-2693.684, 2.1934, 3756.03)
    Angles = (0, 0, 0)
    name = TRG_657
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_658 ]
  }
  {
    Position = (-2670.767, 2.1934, 3737.392)
    Angles = (0, 0, 0)
    name = TRG_658
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_659 ]
  }
  {
    Position = (-2395.127, 2.1934, 3737.392)
    Angles = (0, 0, 0)
    name = TRG_659
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_660 ]
  }
  {
    Position = (-2374.134, 2.1934, 3758.383)
    Angles = (0, 0, 0)
    name = TRG_660
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_661 ]
  }
  {
    Position = (-2373.644, 2.1934, 3782.621)
    Angles = (0, 0, 0)
    name = TRG_661
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_662 ]
  }
  {
    Position = (-2373.644, 2.1934, 4434.802)
    Angles = (0, 0, 0)
    name = TRG_662
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-3707.199, -56.86988, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_191
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_474 ]
  }
  {
    Position = (-3769.688, -57.53919, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_216
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_191 ]
  }
  {
    Position = (-3856.811, -54.06485, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_217
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_216 ]
  }
  {
    Position = (-3924.762, -52.20293, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_218
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_217 ]
  }
  {
    Position = (-3981.478, -53.4031, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_219
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_218 ]
  }
  {
    Position = (-4037.494, -60.61832, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_220
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_219 ]
  }
  {
    Position = (-4063.806, -64.16785, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_221
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_220 ]
  }
  {
    Position = (-4089.36, -71.04834, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_222
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_221 ]
  }
  {
    Position = (-3375.338, 2.19342, 4475.201)
    Angles = (0, 0, 0)
    name = TRG_187
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_653 ]
  }
  {
    Position = (-3647.557, -75.57021, 4640.685)
    Angles = (0, 0, 0)
    name = TRG_474
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_187 ]
  }
  {
    Position = (-3769.688, -57.53919, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_663
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_670 ]
  }
  {
    Position = (-3856.811, -54.06485, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_664
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_663 ]
  }
  {
    Position = (-3924.762, -52.20293, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_665
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_664 ]
  }
  {
    Position = (-3981.478, -53.4031, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_666
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_665 ]
  }
  {
    Position = (-4037.494, -60.61832, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_667
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_666 ]
  }
  {
    Position = (-4063.806, -64.16785, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_668
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_667 ]
  }
  {
    Position = (-4089.36, -71.04834, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_669
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_668 ]
  }
  {
    Position = (-3707.199, -56.86988, 4678.846)
    Angles = (0, 0, 0)
    name = TRG_670
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_671 ]
  }
  {
    Position = (-3647.557, -75.57021, 4717.007)
    Angles = (0, 0, 0)
    name = TRG_671
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_651 ]
  }
  {
    Position = (-4099.648, 2.19342, 4897.137)
    Angles = (0, 0, 0)
    name = TRG_188
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_672 ]
  }
  {
    Position = (-4142.938, 2.19344, 4897.944)
    Angles = (0, 0, 0)
    name = TRG_189
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_188 ]
  }
  {
    Position = (-4163.93, 2.19345, 4918.937)
    Angles = (0, 0, 0)
    name = TRG_190
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_189 ]
  }
  {
    Position = (-4163.93, 2.19338, 5590.183)
    Angles = (0, 0, 0)
    name = TRG_475
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_190 ]
  }
  {
    Position = (-4099.648, 2.19342, 4475.201)
    Angles = (0, 0, 0)
    name = TRG_476
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_674 ]
  }
  {
    Position = (-4142.938, 2.19341, 4474.712)
    Angles = (0, 0, 0)
    name = TRG_477
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_476 ]
  }
  {
    Position = (-4163.929, 2.1934, 4453.719)
    Angles = (0, 0, 0)
    name = TRG_478
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_477 ]
  }
  {
    Position = (-4163.929, 2.19336, 3782.473)
    Angles = (0, 0, 0)
    name = TRG_479
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_478 ]
  }
  {
    Position = (-3888.699, -75.57021, 4711.253)
    Angles = (0, 0, 0)
    name = TRG_672
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-3886.65, -75.57021, 4651.656)
    Angles = (0, 0, 0)
    name = TRG_674
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2609.286, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2097
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2608.089, -227.8421, 5496.488)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2098
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2852.188, -227.9165, 5496.303)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2099
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2098 ]
  }
  {
    Position = (2852.188, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2100
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2097 ]
  }
  {
    Position = (2958.38, -227.8846, 5496.117)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2101
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3206.152, -227.9165, 5496.303)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2102
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2101 ]
  }
  {
    Position = (3206.152, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2103
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2104 ]
  }
  {
    Position = (2957.249, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2104
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3309.091, -227.9165, 5496.303)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2105
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3555.574, -227.8429, 5496.303)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2106
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2105 ]
  }
  {
    Position = (3555.574, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2107
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2108 ]
  }
  {
    Position = (3309.091, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2108
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3909.591, -227.9165, 5496.303)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2109
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2112 ]
  }
  {
    Position = (3909.591, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2110
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Sk3Ed_Rail2111 ]
  }
  {
    Position = (3665.498, -199.4098, 5457.576)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2111
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3665.498, -227.9165, 5496.303)
    Angles = (0, -3.14159, 0)
    name = TRG_Sk3Ed_Rail2112
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (1239.856, 77.48325, 3270.006)
    Angles = (0, 0, 0)
    name = TRG_675
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_568 ]
  }
  {
    Position = (1424.094, 52.4927, 3210.326)
    Angles = (0, 0, 0)
    name = TRG_676
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_580 ]
  }
  {
    Position = (2827.824, -137.847, 5656.044)
    Angles = (0, 0, 0)
    name = TRG_539
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign06
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2962.279, -137.847, 5656.044)
    Angles = (0, 0, 0)
    name = TRG_540
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign06
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_539 ]
  }
  {
    Position = (4027.467, -137.847, 5656.044)
    Angles = (0, 0, 0)
    name = TRG_681
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_682 ]
  }
  {
    Position = (3893.012, -137.847, 5656.044)
    Angles = (0, 0, 0)
    name = TRG_682
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (4944.975, -204.3907, 3728.537)
    Angles = (0, 0, 0)
    name = TRG_683
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3820.007, -204.8581, 3709.716)
    Angles = (0, 0, 0)
    name = TRG_684
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_527 ]
  }
  {
    Position = (2499.721, 238.4701, 630.4724)
    Angles = (0, 0, 0)
    name = TRG_685
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_686 ]
  }
  {
    Position = (2499.721, 238.4701, 1046.532)
    Angles = (0, 0, 0)
    name = TRG_686
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_687 ]
  }
  {
    Position = (2793.92, 238.4701, 1340.73)
    Angles = (0, 0, 0)
    name = TRG_687
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_688 ]
  }
  {
    Position = (3209.979, 238.4701, 1340.73)
    Angles = (0, 0, 0)
    name = TRG_688
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_689 ]
  }
  {
    Position = (3504.178, 238.4701, 1046.532)
    Angles = (0, 0, 0)
    name = TRG_689
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_690 ]
  }
  {
    Position = (3504.178, 238.4701, 630.4724)
    Angles = (0, 0, 0)
    name = TRG_690
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_691 ]
  }
  {
    Position = (3209.979, 238.4701, 336.2739)
    Angles = (0, 0, 0)
    name = TRG_691
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_692 ]
  }
  {
    Position = (2793.92, 238.4701, 336.2739)
    Angles = (0, 0, 0)
    name = TRG_692
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_685 ]
  }
  {
    Position = (-784.8194, -6.56644, 7585.071)
    Angles = (0, 0, 0)
    name = TRG_156
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_694 ]
  }
  {
    Position = (-756.3389, 3.51862, 7617.427)
    Angles = (0, 0, 0)
    name = TRG_157
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_156 ]
  }
  {
    Position = (-722.3972, 11.53578, 7644.577)
    Angles = (0, 0, 0)
    name = TRG_158
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_157 ]
  }
  {
    Position = (-684.0256, 9.86044, 7665.696)
    Angles = (0, 0, 0)
    name = TRG_159
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_158 ]
  }
  {
    Position = (-642.3899, -0.50456, 7680.143)
    Angles = (0, 0, 0)
    name = TRG_160
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_159 ]
  }
  {
    Position = (-611.4289, -0.50456, 7670.549)
    Angles = (0, 0, 0)
    name = TRG_693
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_160 ]
  }
  {
    Position = (-790.0176, -6.56644, 7570.683)
    Angles = (0, 0, 0)
    name = TRG_694
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-758.5663, -22.30066, 7217.953)
    Angles = (0, 0, 0)
    name = TRG_161
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_696 ]
  }
  {
    Position = (-787.0469, -2.60801, 7250.31)
    Angles = (0, 0, 0)
    name = TRG_164
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_161 ]
  }
  {
    Position = (-809.2007, 2.0719, 7286.889)
    Angles = (0, 0, 0)
    name = TRG_165
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_164 ]
  }
  {
    Position = (-824.3548, -0.97911, 7326.58)
    Angles = (0, 0, 0)
    name = TRG_541
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_165 ]
  }
  {
    Position = (-832.0489, -23.49099, 7368.176)
    Angles = (0, 0, 0)
    name = TRG_544
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_541 ]
  }
  {
    Position = (-824.0562, -23.49099, 7395.784)
    Angles = (0, 0, 0)
    name = TRG_695
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_544 ]
  }
  {
    Position = (4259.511, -18.67765, 4973.664)
    Angles = (0, -3.14159, 0)
    name = Trg_Proset1_restartnode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Snack Bar"
  }
  {
    Position = (499.5666, 263.7623, 483.0001)
    Angles = (0, 0, 0)
    name = TRG_593
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (239.9999, 263.7621, 483.0001)
    Angles = (0, 0, 0)
    name = TRG_594
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_593 ]
  }
  {
    Position = (-0.00011, 263.7624, 483.0001)
    Angles = (0, 0, 0)
    name = TRG_595
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-259.5668, 263.7622, 483.0001)
    Angles = (0, 0, 0)
    name = TRG_600
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_595 ]
  }
  {
    Position = (-720.1946, -23.976, 7196.834)
    Angles = (0, 0, 0)
    name = TRG_696
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-352.0275, 183.2376, 1132.177)
    Angles = (0, 0, 0)
    name = TRG_602
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_945 ]
  }
  {
    Position = (-352.0275, 183.2376, 1529.284)
    Angles = (0, 0, 0)
    name = TRG_604
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_606 ]
  }
  {
    Position = (591.6304, 183.2376, 1529.284)
    Angles = (0, 0, 0)
    name = TRG_606
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_946 ]
  }
  {
    Position = (591.6304, 183.2376, 1132.177)
    Angles = (0, 0, 0)
    name = TRG_625
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_602 ]
  }
  {
    Position = (1195.352, 150.7958, 7325.98)
    Angles = (0, 0, 0)
    name = TRG_731
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_732 ]
  }
  {
    Position = (1347.668, 193.5329, 7325.98)
    Angles = (0, 0, 0)
    name = TRG_732
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_733 ]
  }
  {
    Position = (1524.647, 212.3699, 7325.98)
    Angles = (0, 0, 0)
    name = TRG_733
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-1008.045, 272.8117, 3236.355)
    Angles = (0, 0, 0)
    name = TRG_734
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = BuildingTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_577 ]
  }
  {
    Position = (-1048.775, 236.9672, 3333.793)
    Angles = (0, 0, 0)
    name = TRG_735
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    DefaultLine
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_736 ]
  }
  {
    Position = (-1093.815, 192.7356, 3433.015)
    Angles = (0, 0, 0)
    name = TRG_736
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_737 ]
  }
  {
    Position = (-1133.543, 153.9607, 3531.345)
    Angles = (0, 0, 0)
    name = TRG_737
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_738 ]
  }
  {
    Position = (-1173.271, 116.3755, 3629.675)
    Angles = (0, 0, 0)
    name = TRG_738
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_739 ]
  }
  {
    Position = (-1212.999, 81.06637, 3728.005)
    Angles = (0, 0, 0)
    name = TRG_739
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_740 ]
  }
  {
    Position = (-1254.934, 43.63784, 3825.443)
    Angles = (0, 0, 0)
    name = TRG_740
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_741 ]
  }
  {
    Position = (-1300.883, 4.18956, 3938.031)
    Angles = (0, 0, 0)
    name = TRG_741
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (1005.295, 253.5736, 2359.974)
    Angles = (0, -3.14159, 0)
    name = TRG_RestartRooftops02
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Rooftops-Right"
  }
  {
    Position = (6803.594, 180.1555, 4198.535)
    Angles = (0, 0, 0)
    name = TRG_590
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (6803.594, 180.1555, 4682.367)
    Angles = (0, 0, 0)
    name = TRG_742
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_590 ]
    TriggerScript = TRG_742Script
  }
  {
    Position = (6803.594, 180.1555, 5640.062)
    Angles = (0, 0, 0)
    name = TRG_743
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_909 ]
    TriggerScript = TRG_743Script
  }
  {
    Position = (6803.594, 180.1555, 5163.303)
    Angles = (0, 0, 0)
    name = TRG_744
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2323.202, 53.34706, 4946.83)
    Angles = (0, 0, 0)
    name = TRG_745
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_746 ]
    TriggerScript = TRG_745Script
  }
  {
    Position = (-2323.201, 18.19087, 5125.419)
    Angles = (0, 0, 0)
    name = TRG_746
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2323.201, 173.347, 5170.282)
    Angles = (0, 0, 0)
    name = TRG_747
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_748 ]
    TriggerScript = TRG_747Script
  }
  {
    Position = (-2323.201, 138.1909, 5377.697)
    Angles = (0, 0, 0)
    name = TRG_748
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2323.201, 316.4731, 5456.251)
    Angles = (0, 0, 0)
    name = TRG_749
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_750 ]
    TriggerScript = TRG_749Script
  }
  {
    Position = (-2323.201, 258.1909, 5724.91)
    Angles = (0, 0, 0)
    name = TRG_750
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2323.202, 34.97728, 4434.876)
    Angles = (0, 0, 0)
    name = TRG_751
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2323.202, 18.19084, 4268.909)
    Angles = (0, 0, 0)
    name = TRG_752
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_751 ]
    TriggerScript = TRG_752Script
  }
  {
    Position = (-2323.202, 150.6823, 4258.955)
    Angles = (0, 0, 0)
    name = TRG_753
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2323.202, 138.1909, 4102.297)
    Angles = (0, 0, 0)
    name = TRG_754
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_753 ]
    TriggerScript = TRG_754Script
  }
  {
    Position = (-2323.202, 293.347, 4075.717)
    Angles = (0, 0, 0)
    name = TRG_755
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2323.202, 258.1909, 3883.94)
    Angles = (0, 0, 0)
    name = TRG_756
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_755 ]
    TriggerScript = TRG_756Script
  }
  {
    Position = (5596.346, 150.7958, 5970.592)
    Angles = (0, -0.83776, 0)
    name = TRG_757
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_758 ]
  }
  {
    Position = (5675.302, 193.5329, 5884.836)
    Angles = (0, -0.83776, 0)
    name = TRG_758
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_759 ]
  }
  {
    Position = (5753.73, 212.3699, 5791.185)
    Angles = (0, -0.83776, 0)
    name = TRG_759
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_965 ]
  }
  {
    Position = (1112.367, -199.8568, 7170.978)
    Angles = (0, 0, 0)
    name = TRG_760
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_349 ]
  }
  {
    Position = (4432.213, 11.65509, 3392.792)
    Angles = (0, 0, 0)
    name = TRG_33
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffeQP01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_512 ]
  }
  {
    Position = (4326.528, 11.65509, 3392.792)
    Angles = (0, 0, 0)
    name = TRG_34
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffeQP02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (4998.641, 11.65509, 3392.792)
    Angles = (0, 0, 0)
    name = TRG_512
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffeQP01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3760.101, 11.65509, 3392.792)
    Angles = (0, 0, 0)
    name = TRG_513
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffeQP02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_34 ]
  }
  {
    Position = (5398.325, -228.5511, 4222.33)
    Angles = (0, 0, 0)
    name = TRG_761
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_421 ]
  }
  {
    Position = (735.784, 272.7101, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_763
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (535.2117, 254.7604, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_764
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_763 ]
  }
  {
    Position = (368.7094, 243.9489, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_765
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_764 ]
  }
  {
    Position = (202.2072, 238.4251, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_766
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_765 ]
  }
  {
    Position = (35.70493, 238.4251, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_767
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_766 ]
  }
  {
    Position = (-130.7973, 243.9489, 2703.495)
    Angles = (0, 0, 0)
    name = TRG_768
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-297.2996, 252.2827, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_769
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_767 ]
  }
  {
    Position = (-495.4548, 272.607, 2946.962)
    Angles = (0, 0, 0)
    name = TRG_770
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_769 ]
  }
  {
    Position = (202.2072, 238.4251, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_771
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_774 ]
  }
  {
    Position = (735.784, 272.7101, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_772
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (535.2117, 254.7604, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_773
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_772 ]
  }
  {
    Position = (368.7094, 243.9489, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_774
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_773 ]
  }
  {
    Position = (35.70493, 238.4251, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_775
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_771 ]
  }
  {
    Position = (-130.7973, 243.9489, 2458.347)
    Angles = (0, 0, 0)
    name = TRG_776
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-297.2996, 252.2827, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_777
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_775 ]
  }
  {
    Position = (-495.4548, 272.607, 2790.082)
    Angles = (0, 0, 0)
    name = TRG_778
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_777 ]
  }
  {
    Position = (4710.914, -252.1071, 7300.249)
    Angles = (0, 0, 0)
    name = Zoo_VertPolys
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (2249.087, -252.1071, 7300.249)
    Angles = (0, 0, 0)
    name = Zoo_VertPolys01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-2272.075, -205.3882, 6870.976)
    Angles = (0, 0, 0)
    name = TRG_779
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_780 ]
  }
  {
    Position = (-2272.075, -185.8494, 6783.722)
    Angles = (0, 0, 0)
    name = TRG_780
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2272.075, -185.8494, 6630.976)
    Angles = (0, 0, 0)
    name = TRG_781
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_782 ]
  }
  {
    Position = (-2272.075, -205.3883, 6569.494)
    Angles = (0, 0, 0)
    name = TRG_782
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_346 ]
  }
  {
    Position = (-2022.496, -186.534, 7639.172)
    Angles = (0.06109, -0.19199, 0)
    name = TRG_514
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1987.476, -158.7942, 7673.786)
    Angles = (0.06109, -0.19199, 0)
    name = TRG_515
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_514 ]
  }
  {
    Position = (-1952.336, -128.7425, 7706.118)
    Angles = (0.06109, -0.19199, 0)
    name = TRG_516
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_515 ]
  }
  {
    Position = (-1911.348, -103.6784, 7731.085)
    Angles = (0.06109, -0.19199, 0)
    name = TRG_517
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_516 ]
  }
  {
    Position = (-1876.933, -71.10194, 7763.069)
    Angles = (0.06109, -0.19199, 0)
    name = TRG_518
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_517 ]
  }
  {
    Position = (-1840.766, -44.11404, 7797.063)
    Angles = (0.06109, -0.19199, 0)
    name = TRG_528
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_518 ]
  }
  {
    Position = (-2327.625, -53.43013, 7491.86)
    Angles = (0, 0.59341, 0)
    name = Trg_Proset2_restartnode
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "On a rock"
    restart_types = [ Player1 ]
  }
  {
    Position = (-4273.373, -679.4678, 3556.394)
    Angles = (0, 0, 0)
    name = TRG_30
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_31 ]
  }
  {
    Position = (-4273.391, -668.1912, 3436.33)
    Angles = (0, 0, 0)
    name = TRG_31
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_37 ]
  }
  {
    Position = (-4273.391, -636.5587, 3256.33)
    Angles = (0, 0, 0)
    name = TRG_37
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_38 ]
  }
  {
    Position = (-4273.391, -583.4811, 3016.33)
    Angles = (0, 0, 0)
    name = TRG_38
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_529 ]
  }
  {
    Position = (-4273.391, -535.4811, 2896.274)
    Angles = (0, 0, 0)
    name = TRG_529
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_762 ]
  }
  {
    Position = (-4277.378, -535.4811, 2865.992)
    Angles = (0, 0, 0)
    name = TRG_762
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_784 ]
  }
  {
    Position = (-4289.066, -535.4811, 2837.774)
    Angles = (0, 0, 0)
    name = TRG_784
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_785 ]
  }
  {
    Position = (-4307.66, -535.4811, 2813.542)
    Angles = (0, 0, 0)
    name = TRG_785
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_786 ]
  }
  {
    Position = (-4331.892, -535.4811, 2794.949)
    Angles = (0, 0, 0)
    name = TRG_786
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_787 ]
  }
  {
    Position = (-4360.109, -535.4811, 2783.261)
    Angles = (0, 0, 0)
    name = TRG_787
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_788 ]
  }
  {
    Position = (-4390.391, -535.4811, 2779.274)
    Angles = (0, 0, 0)
    name = TRG_788
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_789 ]
  }
  {
    Position = (-4623.311, -535.4812, 2779.276)
    Angles = (0, 0, 0)
    name = TRG_789
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_790 ]
  }
  {
    Position = (-4653.592, -535.4812, 2783.263)
    Angles = (0, 0, 0)
    name = TRG_790
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_791 ]
  }
  {
    Position = (-4681.81, -535.4812, 2794.951)
    Angles = (0, 0, 0)
    name = TRG_791
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_792 ]
  }
  {
    Position = (-4706.042, -535.4812, 2813.544)
    Angles = (0, 0, 0)
    name = TRG_792
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_793 ]
  }
  {
    Position = (-4724.635, -535.4812, 2837.776)
    Angles = (0, 0, 0)
    name = TRG_793
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_794 ]
  }
  {
    Position = (-4736.324, -535.4812, 2865.994)
    Angles = (0, 0, 0)
    name = TRG_794
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_795 ]
  }
  {
    Position = (-4740.311, -535.4812, 2896.276)
    Angles = (0, 0, 0)
    name = TRG_795
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_796 ]
  }
  {
    Position = (-4740.311, -583.4812, 3016.332)
    Angles = (0, 0, 0)
    name = TRG_796
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_797 ]
  }
  {
    Position = (-4740.311, -636.5587, 3256.332)
    Angles = (0, 0, 0)
    name = TRG_797
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_799 ]
  }
  {
    Position = (-4740.329, -679.4679, 3587.636)
    Angles = (0, 0, 0)
    name = TRG_798
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-4740.311, -668.1913, 3436.332)
    Angles = (0, 0, 0)
    name = TRG_799
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_798 ]
  }
  {
    Position = (-1500.624, -133.2401, 7993.662)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_800
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_804 ]
  }
  {
    Position = (-1732.792, -55.24224, 7888.816)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_801
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_806 ]
  }
  {
    Position = (-1684.55, -73.02234, 7912.052)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_802
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_801 ]
  }
  {
    Position = (-1638.225, -96.88033, 7926.761)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_803
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_802 ]
  }
  {
    Position = (-1575.454, -112.5972, 7956.298)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_804
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_803 ]
  }
  {
    Position = (-1468.97, -137.7728, 7996.703)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_805
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_800 ]
  }
  {
    Position = (-1779.349, -35.82465, 7863.334)
    Angles = (-0.49015, -0.6838, 0.85473)
    name = TRG_806
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1319.317, -197.1423, 8037.394)
    Angles = (0, 0, 0)
    name = TRG_783
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1076 ]
  }
  {
    Position = (599.8025, -197.3074, 8035.465)
    Angles = (0, 0, 0)
    name = TRG_807
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1075 ]
  }
  {
    Position = (841.1819, -124.1852, 7822.423)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_808
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_812 ]
  }
  {
    Position = (872.4254, -125.9143, 7780.68)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_809
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_808 ]
  }
  {
    Position = (738.539, -125.1232, 7954.123)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_810
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_814 ]
  }
  {
    Position = (775.4134, -123.537, 7911.449)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_811
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_810 ]
  }
  {
    Position = (804.254, -128.304, 7865.874)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_812
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_811 ]
  }
  {
    Position = (890.8209, -113.159, 7709.896)
    Angles = (-0.21166, -1.84652, 0.53384)
    name = TRG_813
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_809 ]
  }
  {
    Position = (685.9393, -124.5603, 8014.006)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_814
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_822 ]
  }
  {
    Position = (952.8425, -238.1183, 7537.838)
    Angles = (0, 0, 0)
    name = TRG_815
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1073 ]
  }
  {
    Position = (660.9341, -124.5603, 8022.764)
    Angles = (-0.21166, -1.78543, 0.53384)
    name = TRG_822
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-498.0395, -93.27505, 3271.747)
    Angles = (0, 0, 0)
    name = TRG_816
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = FountainQP
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-1015.828, -93.27506, 3271.747)
    Angles = (0, 0, 0)
    name = TRG_817
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = FountainQP
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_816 ]
  }
  {
    Position = (-363.7972, 145.5904, 4892.69)
    Angles = (0, 0, 0)
    name = trg_g_comp_Rail27
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_Rail28 ]
  }
  {
    Position = (-87.74402, 189.7863, 4892.69)
    Angles = (0, 0, 0)
    name = trg_g_comp_Rail28
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_Rail29 ]
  }
  {
    Position = (312.0572, 189.7863, 4892.69)
    Angles = (0, 0, 0)
    name = trg_g_comp_Rail29
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_Rail30 ]
  }
  {
    Position = (588.1104, 145.5904, 4892.69)
    Angles = (0, 0, 0)
    name = trg_g_comp_Rail30
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (3352.08, -205.0481, 4935.664)
    Angles = (0, 0, 0)
    name = TRG_831
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_290 ]
  }
  {
    Position = (5997.981, 47.99664, 4203.92)
    Angles = (0, 0, 0)
    name = TRG_832
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2321.312, 97.73746, 4263.256)
    Angles = (0, 0, 0)
    name = TRG_545
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2330.485, 154.6392, 4399.895)
    Angles = (0, 0, 0)
    name = TRG_833
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_545 ]
  }
  {
    Position = (-2328.985, 172.9564, 4455.003)
    Angles = (0, 0, 0)
    name = TRG_834
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_833 ]
  }
  {
    Position = (-2330.485, 177.8749, 4507.866)
    Angles = (0, 0, 0)
    name = TRG_835
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_834 ]
  }
  {
    Position = (-2328.985, 179.1749, 4684.087)
    Angles = (0, 0, 0)
    name = TRG_836
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_835 ]
  }
  {
    Position = (-2330.485, 177.8749, 4851.866)
    Angles = (0, 0, 0)
    name = TRG_837
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_836 ]
  }
  {
    Position = (-2330.485, 171.7007, 4904.393)
    Angles = (0, 0, 0)
    name = TRG_838
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_837 ]
  }
  {
    Position = (-2328.985, 155.8647, 4960.271)
    Angles = (0, 0, 0)
    name = TRG_839
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_838 ]
  }
  {
    Position = (-2318.143, 83.39407, 5148.285)
    Angles = (0, 0, 0)
    name = TRG_840
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_839 ]
    TriggerScript = TRG_840Script
  }
  {
    Position = (-2454.203, -68.99104, 344.7408)
    Angles = (0, 0, 0)
    name = TRG_855
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_Spine
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-2454.201, -68.99101, 710.7584)
    Angles = (0, 0, 0)
    name = TRG_856
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_Spine
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_855 ]
  }
  {
    Position = (-2444.858, 164.9756, 839.0681)
    Angles = (0, 0, 0)
    name = TRG_857
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2444.86, 164.9756, 216.4324)
    Angles = (0, 0, 0)
    name = TRG_858
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_857 ]
  }
  {
    Position = (39.13869, -239.9586, 3240.002)
    Angles = (0, -2.36492, 0)
    name = TRG_RestartFountain
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "Fountain"
    restart_types = [ Player1 ]
  }
  {
    Position = (3247.5, -170.7182, 1789.411)
    Angles = (0, 0, 0)
    name = InvisoRailCollide01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-685.5239, -45.8508, 6600.579)
    Angles = (0, 0, 0)
    name = TRG_859
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-743.8329, -45.8508, 6600.579)
    Angles = (0, 0, 0)
    name = TRG_860
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_859 ]
  }
  {
    Position = (-801.6395, -45.8508, 6602.541)
    Angles = (0, 0, 0)
    name = TRG_861
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_860 ]
  }
  {
    Position = (-815.657, -45.8508, 6612.292)
    Angles = (0, 0, 0)
    name = TRG_862
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_861 ]
  }
  {
    Position = (-115.2064, -45.27872, 6512.979)
    Angles = (0, 0, 0)
    name = TRG_863
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_866 ]
  }
  {
    Position = (-167.8557, -45.27872, 6486.996)
    Angles = (0, 0, 0)
    name = TRG_864
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_863 ]
  }
  {
    Position = (-226.5843, -45.27872, 6478.361)
    Angles = (0, 0, 0)
    name = TRG_865
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_864 ]
  }
  {
    Position = (-109.632, -45.27872, 6524.327)
    Angles = (0, 0, 0)
    name = TRG_866
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-239.5634, -45.27872, 6482.251)
    Angles = (0, 0, 0)
    name = TRG_867
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_865 ]
  }
  {
    Position = (-782.2977, -108.4532, 7255.163)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2121
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2122 ]
  }
  {
    Position = (-804.5906, -107.4859, 7294.347)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2122
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2123 ]
  }
  {
    Position = (-819.8483, -106.8243, 7337.532)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2123
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2124 ]
  }
  {
    Position = (-827.5972, -106.4884, 7383.437)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2124
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2125 ]
  }
  {
    Position = (-827.5971, -106.4884, 7430.625)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2125
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2126 ]
  }
  {
    Position = (-819.8481, -106.8243, 7477.562)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2126
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2127 ]
  }
  {
    Position = (-804.5905, -107.4859, 7522.684)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2127
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2128 ]
  }
  {
    Position = (-782.2976, -108.4532, 7564.479)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2128
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2129 ]
  }
  {
    Position = (-753.662, -109.6994, 7601.545)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2129
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2130 ]
  }
  {
    Position = (-719.5738, -111.1813, 7632.656)
    Angles = (0, -3.14159, -0.04028)
    name = TRG_Sk3Ed_Rail2130
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_Sk3Ed_Rail2068 ]
  }
  {
    Position = (-4870.08, -237.5595, 3729.421)
    Angles = (0, 0, 0)
    name = TRG_868
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_891 ]
  }
  {
    Position = (-5218.141, -237.7357, 3499.435)
    Angles = (0, 0, 0)
    name = TRG_869
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_877 ]
  }
  {
    Position = (-5555.354, -237.7357, 3496.9)
    Angles = (0, 0, 0)
    name = TRG_870
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_879 ]
  }
  {
    Position = (-5887.25, -237.5596, 3730.233)
    Angles = (0, 0, 0)
    name = TRG_871
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_880 ]
  }
  {
    Position = (-5887.4, -237.5596, 5636.07)
    Angles = (0, 0, 0)
    name = TRG_872
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_882 ]
  }
  {
    Position = (-5552.527, -237.7356, 5862.545)
    Angles = (0, 0, 0)
    name = TRG_873
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_884 ]
  }
  {
    Position = (-5217.252, -237.7356, 5861.416)
    Angles = (0, 0, 0)
    name = TRG_874
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_887 ]
  }
  {
    Position = (-4869.474, -237.5595, 5637.935)
    Angles = (0, 0, 0)
    name = TRG_875
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_888 ]
  }
  {
    Position = (-5193.399, -237.7357, 3510.598)
    Angles = (0, 0, 0)
    name = TRG_876
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_869 ]
  }
  {
    Position = (-5245.167, -237.7357, 3493.751)
    Angles = (0, 0, 0)
    name = TRG_877
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_878 ]
  }
  {
    Position = (-5535.929, -237.7357, 3493.981)
    Angles = (0, 0, 0)
    name = TRG_878
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_870 ]
  }
  {
    Position = (-5567.961, -237.7357, 3503.686)
    Angles = (0, 0, 0)
    name = TRG_879
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_881 ]
  }
  {
    Position = (-5890.473, -237.5596, 3745.547)
    Angles = (0, 0, 0)
    name = TRG_880
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_883 ]
  }
  {
    Position = (-5879.201, -237.5596, 3721.244)
    Angles = (0, 0, 0)
    name = TRG_881
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_871 ]
  }
  {
    Position = (-5877.273, -237.5596, 5647.08)
    Angles = (0, 0, 0)
    name = TRG_882
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_885 ]
  }
  {
    Position = (-5890.423, -237.5596, 5625.504)
    Angles = (0, 0, 0)
    name = TRG_883
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_872 ]
  }
  {
    Position = (-5540.6, -237.7356, 5864.166)
    Angles = (0, 0, 0)
    name = TRG_884
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_886 ]
  }
  {
    Position = (-5562.405, -237.7356, 5858.097)
    Angles = (0, 0, 0)
    name = TRG_885
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_873 ]
  }
  {
    Position = (-5230.83, -237.7356, 5863.399)
    Angles = (0, 0, 0)
    name = TRG_886
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_874 ]
  }
  {
    Position = (-5204.813, -237.7356, 5855.098)
    Angles = (0, 0, 0)
    name = TRG_887
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_889 ]
  }
  {
    Position = (-4866.318, -237.5595, 5628.635)
    Angles = (0, 0, 0)
    name = TRG_888
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_890 ]
  }
  {
    Position = (-4879.338, -237.5595, 5646.897)
    Angles = (0, 0, 0)
    name = TRG_889
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_875 ]
  }
  {
    Position = (-4866.386, -237.5595, 3743.988)
    Angles = (0, 0, 0)
    name = TRG_890
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_868 ]
  }
  {
    Position = (-4881.52, -237.5595, 3718.728)
    Angles = (0, 0, 0)
    name = TRG_891
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_876 ]
  }
  {
    Position = (-2445.986, 348.3419, 590.3766)
    Angles = (0, 0, 0)
    name = Zoo_BirdNet
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-3218.416, -175.9583, 527.7507)
    Angles = (0, 0, 0)
    name = Zoo_AviaryWall
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1014.464, -125.699, 4957.177)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl04
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl05 ]
  }
  {
    Position = (1047.181, -125.4652, 5036.118)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl02
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl03 ]
  }
  {
    Position = (1047.243, -124.3963, 5475.365)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl01
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl32 ]
  }
  {
    Position = (1018.007, -123.3273, 5557.726)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl29
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl01 ]
  }
  {
    Position = (934.4573, -122.2584, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl28
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl29 ]
  }
  {
    Position = (394.3965, -121.2129, 5596.429)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl27
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl28 ]
  }
  {
    Position = (259.0199, -80.20004, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl26
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl27 ]
  }
  {
    Position = (121.4987, -65.6994, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl25
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl26 ]
  }
  {
    Position = (-19.53052, -80.20004, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl24
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl25 ]
  }
  {
    Position = (-167.2129, -122.2584, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl23
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl24 ]
  }
  {
    Position = (-707.2737, -123.3039, 5596.975)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl22
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl23 ]
  }
  {
    Position = (-790.8234, -124.3728, 5557.999)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl21
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl22 ]
  }
  {
    Position = (-820.0591, -125.4418, 5475.638)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl20
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl21 ]
  }
  {
    Position = (-819.9972, -126.5107, 5036.391)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl19
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl30 ]
  }
  {
    Position = (-787.0242, -125.699, 4955.457)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl17
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl18 ]
  }
  {
    Position = (839.8372, -52.00175, 4917.878)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl06
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl07 ]
  }
  {
    Position = (751.368, -36.29164, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl07
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl08 ]
  }
  {
    Position = (586.4714, -10.30704, 4919.569)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl08
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl09 ]
  }
  {
    Position = (-190.9847, 14.25963, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl12
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl13 ]
  }
  {
    Position = (-359.2917, -9.00703, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl13
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl14 ]
  }
  {
    Position = (-524.1882, -36.29164, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl14
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl15 ]
  }
  {
    Position = (-600.162, -50.95279, 4917.878)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl15
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl16 ]
  }
  {
    Position = (1003.915, -125.699, 4950.082)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl05
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl06 ]
  }
  {
    Position = (1023.672, -125.699, 4968.787)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl03
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl04 ]
  }
  {
    Position = (-796.1954, -125.699, 4968.218)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl18
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl19 ]
  }
  {
    Position = (-769.7692, -125.699, 4948.682)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl16
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl17 ]
  }
  {
    Position = (84.79269, -255.6634, 5041.451)
    Angles = (0, -3.14159, 0)
    name = Trg_G_COMP_restartnode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Competition"
  }
  {
    Position = (-2260.517, -75.21684, 2710.334)
    Angles = (0, 2.29511, 0)
    name = TRG_RestartAviary02
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Aviary Front"
  }
  {
    Position = (3907.684, -329.4665, 6956.164)
    Angles = (0, 0, 0)
    name = TRG_Restart05
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Elephant Pit"
  }
  {
    Position = (3648.996, -254.4416, 5306.835)
    Angles = (0, -1.5708, 0)
    name = TRG_Ped_Trainer01
    Class = Pedestrian
    type = Ped_ETrainer
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_etrainer\ped_etrainer.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Ped_Trainer01Script
  }
  {
    Position = (6021.641, -254.4416, 4884.326)
    Angles = (0, -1.5708, 0)
    name = TRG_G_HighCombo2_Pro
    Class = Pedestrian
    type = Ped_LionTamer
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_LT
    model = "levels\zoo\ped_liontamer\ped_liontamer.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
  }
  {
    Position = (24.81042, 0, -1614.433)
    Angles = (0, -3.14159, 0)
    name = Trg_Proset3_restartnode
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "P1: Restart"
    restart_types = [ Player1 ]
  }
  {
    Position = (-2122.444, 360.5617, 1704.788)
    Angles = (0, 0, 0)
    name = TRG_304
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_305 ]
  }
  {
    Position = (-2122.444, 360.5617, 2224.155)
    Angles = (0, 0, 0)
    name = TRG_305
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-1840.839, 95.39844, 2224.155)
    Angles = (0, 0, 0)
    name = TRG_893
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Wire03
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2762.711, 360.5617, 2224.155)
    Angles = (0, 0, 0)
    name = TRG_894
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_895 ]
  }
  {
    Position = (-2762.711, 360.5617, 1704.788)
    Angles = (0, 0, 0)
    name = TRG_895
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_304 ]
  }
  {
    Position = (-2755.476, 360.5617, 2245.03)
    Angles = (0, 0, 0)
    name = TRG_896
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_894 ]
  }
  {
    Position = (-2756.115, 360.5617, 2224.155)
    Angles = (0, 0, 0)
    name = TRG_897
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_305 ]
  }
  {
    Position = (87.71909, -62.20266, 1591.861)
    Angles = (0, 0, 0)
    name = TRG_G_HS_Pro
    Class = Pedestrian
    type = PedPro_Hawk
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_hawk_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Hawk
  }
  {
    Position = (147.2338, -49.62176, 1464.773)
    Angles = (0, -3.14159, 0)
    name = TRG_G_HS_RestartNode
    Class = Restart
    type = UserDefined
    CreatedAtStart
    RestartName = "Gen: HighScore"
    restart_types = [ Horse ]
  }
  {
    Position = (4400.145, -18.86009, 5119.603)
    Angles = (0, 0, 0)
    name = TRG_G_PS_RestartNode
    Class = Restart
    type = Horse
    CreatedAtStart
    RestartName = "Gen: ProScore"
    restart_types = [ Horse ]
  }
  {
    Position = (4576.907, -18.86009, 5020.039)
    Angles = (0, -1.5708, 0)
    name = TRG_G_PS_Pro
    Class = Pedestrian
    type = PedPro_Hawk
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_hawk_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Hawk
  }
  {
    Position = (2848.31, -227.0412, 1612.329)
    Angles = (0, 0.16581, 0)
    name = TRG_G_COMBO_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: COMBO"
  }
  {
    Position = (2160.704, -212.6868, 1946.15)
    Angles = (0, -3.14159, 0)
    name = TRG_G_COMBO_Pro
    Class = Pedestrian
    type = Ped_Kid
    SkeletonName = human
    AnimName = animload_human
    profile = Ped_Kid_a
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_G_COMBO_ProScript
  }
  {
    Position = (2994.161, -153.7583, -98.51392)
    Angles = (0, 0, 0)
    name = TRG_Goal_COMBO_B
    Class = GameObject
    type = Combo_B
    model = "gameobjects\combo\goal_combo_b\goal_combo_b.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_COMBO_BScript
  }
  {
    Position = (3957.931, -152.3489, 855.5251)
    Angles = (0, 0, 0)
    name = TRG_Goal_COMBO_M
    Class = GameObject
    type = Combo_M
    model = "gameobjects\combo\goal_combo_m\goal_combo_m.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_COMBO_MScript
  }
  {
    Position = (3220.358, -152.2643, 1769.126)
    Angles = (0, 0, 0)
    name = TRG_Goal_COMBO_O
    Class = GameObject
    type = Combo_O
    model = "gameobjects\combo\goal_combo_o\goal_combo_o.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_COMBO_OScript
  }
  {
    Position = (2065.78, -150.6171, 952.4844)
    Angles = (0, 0, 0)
    name = TRG_Goal_COMBO_O2
    Class = GameObject
    type = Combo_O
    model = "gameobjects\combo\goal_combo_o\goal_combo_o.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_COMBO_O2Script
  }
  {
    Position = (-2445.993, 285.2449, 392.5642)
    Angles = (0, 0, 0)
    name = Zoo_AviaryCage
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2445.874, 282.9317, 37.07776)
    Angles = (0, 0, 0)
    name = AVIARY_Cage02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2300.3, -86.95023, 2827.247)
    Angles = (0, 2.6529, 0)
    name = TRG_G_SKATE_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: SKATE"
  }
  {
    Position = (-2235.739, -93.99286, 2854.602)
    Angles = (0, 0, 0)
    name = TRG_G_SKATE_Pro
    Class = Pedestrian
    type = Ped_ZooSeller
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zooseller\ped_zooseller.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_G_SKATE_ProScript
  }
  {
    Position = (625.5962, -159.8518, 6160.388)
    Angles = (0, 0, 0)
    name = TRG_Goal_Letter_A
    Class = GameObject
    type = Letter_A
    model = "gameobjects\skate\letter_a\letter_a.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Letter_AScript
  }
  {
    Position = (2165.102, 210.0744, 1388.727)
    Angles = (0, 0, 0)
    name = TRG_Goal_Letter_E
    Class = GameObject
    type = Letter_E
    model = "gameobjects\skate\letter_e\letter_e.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Letter_EScript
  }
  {
    Position = (-421.4317, 13.24, 7613.694)
    Angles = (0, 0, 0)
    name = TRG_Goal_Letter_K
    Class = GameObject
    type = Letter_K
    model = "gameobjects\skate\letter_k\letter_k.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Letter_KScript
  }
  {
    Position = (1602.929, 26.3062, 2268.869)
    Angles = (0, 0, 0)
    name = TRG_Goal_Letter_T
    Class = GameObject
    type = Letter_T
    model = "gameobjects\skate\letter_t\letter_t.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Letter_TScript
  }
  {
    Position = (-1576.639, -98.29942, 3915.128)
    Angles = (0, 0, 0)
    name = TRG_Goal_Letter_S
    Class = GameObject
    type = Letter_S
    model = "gameobjects\skate\letter_s\letter_s.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Letter_SScript
  }
  {
    Position = (1036.658, 237.4366, 2866.304)
    Angles = (0, -3.14159, 0)
    name = TRG_G_HighCombo_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: HighCombo"
  }
  {
    Position = (999.1677, 237.4366, 2943.828)
    Angles = (0, 0, 0)
    name = TRG_G_HighCombo_Pro
    Class = Pedestrian
    type = PedPro_Burnquist
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_burnquist_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    pro_name = Burnquist
    TriggerScript = TRG_G_HighCombo_ProScript
  }
  {
    Position = (-294.7595, 314.1805, 2795.103)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap1
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRGP_Zoo_BannerGap02 ]
    TriggerScript = TRGP_Zoo_BannerGap1Script
  }
  {
    Position = (534.4513, 314.1805, 2795.103)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap1 ]
    TriggerScript = TRGP_Zoo_BannerGap02Script
  }
  {
    Position = (-754.0229, 236.7913, 2786.081)
    Angles = (0, 1.58825, 0)
    name = TRG_G_GAP_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: GAP"
  }
  {
    Position = (-697.0979, 236.7913, 3018.46)
    Angles = (0, 0, 0)
    name = TRG_G_GAP_Pro
    Class = Pedestrian
    type = PedPro_Margera
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_margera_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Margera
  }
  {
    Position = (534.4513, 314.1805, 2956.171)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap04 ]
    TriggerScript = TRGP_Zoo_BannerGap03Script
  }
  {
    Position = (-294.7595, 314.1805, 2956.171)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap03 ]
    TriggerScript = TRGP_Zoo_BannerGap04Script
  }
  {
    Position = (534.4513, 312.6056, 3105.351)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap06 ]
    TriggerScript = TRGP_Zoo_BannerGap05Script
  }
  {
    Position = (-294.7595, 312.6056, 3105.351)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap06
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap05 ]
    TriggerScript = TRGP_Zoo_BannerGap06Script
  }
  {
    Position = (534.4513, 112.4672, 3254.571)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap07
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap08 ]
    TriggerScript = TRGP_Zoo_BannerGap07Script
  }
  {
    Position = (-294.7595, 112.4672, 3254.571)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_Zoo_BannerGap08
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_Zoo_BannerGap07 ]
    TriggerScript = TRGP_Zoo_BannerGap08Script
  }
  {
    Position = (-495.4548, 272.607, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_898
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_904 ]
  }
  {
    Position = (735.784, 272.7101, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_899
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (535.2117, 254.7604, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_900
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_899 ]
  }
  {
    Position = (368.7094, 243.9489, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_901
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_900 ]
  }
  {
    Position = (202.2072, 238.4251, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_902
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_901 ]
  }
  {
    Position = (35.70493, 238.4251, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_903
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_902 ]
  }
  {
    Position = (-297.2996, 252.2827, 3113.536)
    Angles = (0, 0, 0)
    name = TRG_904
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_903 ]
  }
  {
    Position = (-2443.551, 191.3694, 1288.002)
    Angles = (0, 0, 0)
    name = zoo_AviaryDoorFrame
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1682.387, -50.48206, 4515.696)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailSpine03
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1682.387, -50.52452, 4831.848)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailSpine04
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_RailSpine03 ]
  }
  {
    Position = (-1375.984, -255.1783, 4362.806)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator01
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator01Script
  }
  {
    Position = (1663.854, -255.8195, 4390.901)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator02
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator02Script
  }
  {
    Position = (1562.804, -255.6339, 4390.901)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator03
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator03Script
  }
  {
    Position = (-1262.084, -255.5761, 4374.049)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator04
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator04Script
  }
  {
    Position = (-411.9389, -68.22018, 4478.261)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator05
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator05Script
  }
  {
    Position = (-525.8387, -86.79, 4467.018)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator06
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator06Script
  }
  {
    Position = (696.7706, -75.14592, 4467.018)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator07
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator07Script
  }
  {
    Position = (480.356, -44.27469, 4467.018)
    Angles = (0, -3.14159, 0)
    name = trg_g_comp_Spectator08
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = trg_g_comp_Spectator08Script
  }
  {
    Position = (-2226.72, 364.8867, 1985.395)
    Angles = (0, -1.5708, 0)
    name = TRG_G_SS_RestartNode
    Class = Restart
    type = Horse
    CreatedAtStart
    RestartName = "Gen: SickScore"
    restart_types = [ Horse ]
  }
  {
    Position = (-2433.666, 360.6155, 2198.351)
    Angles = (0, 0, 0)
    name = TRG_G_SS_Pro
    Class = Pedestrian
    type = PedPro_Hawk
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_hawk_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Hawk
  }
  {
    Position = (2404.725, -224.315, 387.9919)
    Angles = (0, -3.14159, 0)
    name = TRG_G_RACE_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: RACE"
  }
  {
    Position = (2349.265, -224.315, 353.877)
    Angles = (0, -3.14159, 0)
    name = TRG_G_RACE_Pro
    Class = Pedestrian
    type = Ped_ZooKeeper
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zookeeper\ped_zookeeper.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_G_RACE_ProScript
  }
  {
    Position = (-61.6189, 169.3868, 1314.858)
    Angles = (0, -1.9984, 0)
    name = TRG_G_PROLINE_RestartNode
    Class = Restart
    type = Horse
    CreatedAtStart
    RestartName = "Gen: PROLINE"
    restart_types = [ Horse ]
  }
  {
    Position = (-61.16211, 166.7181, 1423.99)
    Angles = (0, 0, 0)
    name = TRG_G_PROLINE_Pro
    Class = Pedestrian
    type = Ped_Kid
    SkeletonName = human
    AnimName = animload_human
    profile = Ped_Kid_a
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_G_PROLINE_ProScript
  }
  {
    Position = (4115.529, -9.99819, 4907.202)
    Angles = (0, 0, 0)
    name = TRG_Goal_Proline_B
    Class = GameObject
    type = Combo_B
    model = "gameobjects\combo\goal_combo_b\goal_combo_b.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Proline_BScript
  }
  {
    Position = (-457.7468, 246.7426, 1777.29)
    Angles = (0, 0, 0)
    name = TRG_Goal_Proline_C
    Class = GameObject
    type = Combo_C
    model = "gameobjects\combo\goal_combo_c\goal_combo_c.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Proline_CScript
  }
  {
    Position = (1228.202, -125.7476, 4919.822)
    Angles = (0, 0, 0)
    name = TRG_Goal_Proline_M
    Class = GameObject
    type = Combo_M
    model = "gameobjects\combo\goal_combo_m\goal_combo_m.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Proline_MScript
  }
  {
    Position = (-495.5503, 295.6208, 3234.786)
    Angles = (0, 0, 0)
    name = TRG_Goal_Proline_O
    Class = GameObject
    type = Combo_O
    model = "gameobjects\combo\goal_combo_o\goal_combo_o.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Proline_OScript
  }
  {
    Position = (-2466.399, -314.6895, 4690.369)
    Angles = (0, -1.5708, 0)
    name = TRG_G_COLLECT_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: HighScore"
  }
  {
    Position = (-2598.384, -314.6895, 4662.209)
    Angles = (0, 1.5708, 0)
    name = TRG_G_COLLECT_Pro
    Class = Pedestrian
    type = Ped_ZooKeeper
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zookeeper\ped_zookeeper.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_G_COLLECT_ProScript
  }
  {
    Position = (-2435.155, -68.99104, 344.7408)
    Angles = (0, 0, 0)
    name = TRG_905
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_Spine
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-2435.153, -68.99101, 710.7584)
    Angles = (0, 0, 0)
    name = TRG_906
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_Spine
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_905 ]
  }
  {
    Position = (-2301.106, 57.53828, 4702.529)
    Angles = (0, 0, 0)
    name = TRGP_GapStart_Aqua01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapStart_Aqua01Script
  }
  {
    Position = (-231.5849, -34.07701, -360.0859)
    Angles = (0, 1.5708, 0)
    name = TRG_G_TS_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: TrickSpot"
  }
  {
    Position = (-283.2504, -34.07701, -304.4854)
    Angles = (0, 1.5708, 0)
    name = TRG_G_TS_PhotoGuy
    Class = Pedestrian
    type = Ped_ZooEmployee
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = Ped_ZooEmployee_b
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_G_TS_PhotoGuyScript
  }
  {
    Position = (-2439.151, 184.6219, 528.3923)
    Angles = (0, 0, 0)
    name = AVIARY_InnerCage
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2301.106, 57.53828, 4702.529)
    Angles = (0, 0, 0)
    name = TRGP_GapEnd_Aqua02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_Aqua02Script
  }
  {
    Position = (-2267.016, 349.5792, 4459.17)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStartWW01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartWW02 ]
    TriggerScript = TRGP_GapStartWW01Script
  }
  {
    Position = (-2267.016, 349.5792, 4911.466)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStartWW02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartWW01 ]
    TriggerScript = TRGP_GapStartWW02Script
  }
  {
    Position = (113.5901, 182.8613, 4439.216)
    Angles = (0, 0, 0)
    name = TRGP_GapStartBridge
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridge01 ]
    TriggerScript = TRGP_GapStartBridgeScript
  }
  {
    Position = (113.5901, 182.8613, 4919.256)
    Angles = (0, 0, 0)
    name = TRGP_GapStartBridge01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridge ]
    TriggerScript = TRGP_GapStartBridge01Script
  }
  {
    Position = (-4879.792, -201.5833, 5672.911)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStartShark01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEndShark01 ]
    TriggerScript = TRGP_GapStartShark01Script
  }
  {
    Position = (-4879.792, -201.5833, 3670.336)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapEndShark01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEndShark01Script
  }
  {
    Position = (-4879.792, -201.5833, 3670.336)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStartShark03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEndShark04 ]
    TriggerScript = TRGP_GapStartShark03Script
  }
  {
    Position = (-4879.792, -201.5833, 5672.911)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapEndShark04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEndShark04Script
  }
  {
    Position = (120.94, -284.8018, 3945.201)
    Angles = (0, -1.61887, 0)
    name = TRGP_GapStartFountain
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEndFountain01 ]
    TriggerScript = TRGP_GapStartFountainScript
  }
  {
    Position = (120.94, -284.8018, 3945.201)
    Angles = (0, -1.61887, 0)
    name = TRGP_GapEndFountain01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEndFountain01Script
  }
  {
    Position = (115.9337, 238.1515, 815.0616)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_Roof01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Roof02 ]
    TriggerScript = TRGP_GapStart_Roof01Script
  }
  {
    Position = (115.9337, 238.1515, 1142.43)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_Roof02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Roof01 ]
    TriggerScript = TRGP_GapStart_Roof02Script
  }
  {
    Position = (231.1384, 238.1515, 595.538)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_Roof03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Roof04 ]
    TriggerScript = TRGP_GapStart_Roof03Script
  }
  {
    Position = (7.78592, 238.1515, 595.538)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_Roof04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Roof03 ]
    TriggerScript = TRGP_GapStart_Roof04Script
  }
  {
    Position = (686.1269, -67.96581, 2365.347)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapEnd_Bank02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_Bank02Script
  }
  {
    Position = (699.4305, 61.59467, 2270.922)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapStart_Bank02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_Bank02 ]
    TriggerScript = TRGP_GapStart_Bank02Script
  }
  {
    Position = (-535.8842, 61.59467, 2270.922)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapStart_Bank01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_Bank01 ]
    TriggerScript = TRGP_GapStart_Bank01Script
  }
  {
    Position = (-525.3708, -67.96581, 2365.347)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapEnd_Bank01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_Bank01Script
  }
  {
    Position = (-435.6405, 72.09117, 1207.837)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_Planter02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Planter01 ]
    TriggerScript = TRGP_GapStart_Planter02Script
  }
  {
    Position = (-555.0941, 72.09116, -1317.145)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_Planter01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Planter02 ]
    TriggerScript = TRGP_GapStart_Planter01Script
  }
  {
    Position = (738.0753, 72.09117, 1200.083)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_Planter03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Planter04 ]
    TriggerScript = TRGP_GapStart_Planter03Script
  }
  {
    Position = (775.1847, 72.09116, -1322.224)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_Planter04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_Planter03 ]
    TriggerScript = TRGP_GapStart_Planter04Script
  }
  {
    Position = (-4777.748, -227.3694, 4660.087)
    Angles = (0, 0, 0)
    name = TRGP_MiniGameHeight01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_MiniGameHeight01Script
  }
  {
    Position = (-755.2133, 727.6479, 1967.784)
    Angles = (0, 0, 0)
    name = InvisoCollision01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (412.2966, -107.4118, 4371.406)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_GapEnd_Bridge01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridge02 ]
    TriggerScript = TRGP_GapEnd_Bridge01Script
  }
  {
    Position = (-182.0881, -107.4118, 4371.406)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_GapStartBridge02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_Bridge01 ]
    TriggerScript = TRGP_GapStartBridge02Script
  }
  {
    Position = (-1009.851, -162.1336, 4670.845)
    Angles = (0, 0, 0)
    name = TRGP_GapStartBridgeRail01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridgeRail02 ]
    TriggerScript = TRGP_GapStartBridgeRail01Script
  }
  {
    Position = (1163.48, -162.1336, 4670.845)
    Angles = (0, 0, 0)
    name = TRGP_GapStartBridgeRail02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridgeRail01 ]
    TriggerScript = TRGP_GapStartBridgeRail02Script
  }
  {
    Position = (4399.404, -127.9024, 4225.201)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_SnackBar01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_SnackBar02 ]
    TriggerScript = TRGP_GapStart_SnackBar01Script
  }
  {
    Position = (4416.325, 84.79882, 4574.947)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapEnd_SnackBar02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_SnackBar02Script
  }
  {
    Position = (2033.675, -334.3776, 7040.061)
    Angles = (0, 0, 0)
    name = TRG_907
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_379 ]
  }
  {
    Position = (6803.605, 187.4778, 5331.359)
    Angles = (0, 0, 0)
    name = TRG_909
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_744 ]
  }
  {
    Position = (6817.368, -11.54897, 4923.454)
    Angles = (0, 0, 0)
    name = TRGP_GapStart_LionLip
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapStart_LionLipScript
  }
  {
    Position = (1109.35, -162.1336, 4670.845)
    Angles = (0, 0, 0)
    name = TRGP_GapStartBridgeManual
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridgeManual01 ]
    TriggerScript = TRGP_GapStartBridgeManualScript
  }
  {
    Position = (-966.1218, -162.1336, 4670.845)
    Angles = (0, 0, 0)
    name = TRGP_GapStartBridgeManual01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStartBridgeManual ]
    TriggerScript = TRGP_GapStartBridgeManual01Script
  }
  {
    Position = (-1803.552, -13.46625, 7830.526)
    Angles = (1.5708, -0.58469, 0)
    name = TRGP_GapStart_Backwoods
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapStart_BackwoodsScript
  }
  {
    Position = (913.4009, -151.0676, 7501.405)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapStart_Backwoods01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapStart_Backwoods01Script
  }
  {
    Position = (-2273.116, -131.7431, 6624.882)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_PopRock
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRGP_GapStart_PopRock01 ]
    TriggerScript = TRGP_GapStart_PopRockScript
  }
  {
    Position = (-2273.116, -131.7431, 6795.069)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_PopRock01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_PopRock ]
    TriggerScript = TRGP_GapStart_PopRock01Script
  }
  {
    Position = (-2457.25, -15.11407, 1222.83)
    Angles = (1.5708, 0, 0)
    name = TRGP_StartGap_BirdHouse01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_StartGap_BirdHouse02 ]
    TriggerScript = TRGP_StartGap_BirdHouse01Script
  }
  {
    Position = (-1424.746, -91.0178, 3427.136)
    Angles = (1.5708, -0.95993, 0)
    name = TRGP_StartGap_BirdHouse02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_StartGap_BirdHouse01 ]
    TriggerScript = TRGP_StartGap_BirdHouse02Script
  }
  {
    Position = (3928.445, -116.616, 1083.08)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_MonkeyQP
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_MonkeyQP01 ]
    TriggerScript = TRGP_GapStart_MonkeyQPScript
  }
  {
    Position = (3928.445, -116.616, 596.3721)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_MonkeyQP01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_MonkeyQP ]
    TriggerScript = TRGP_GapStart_MonkeyQP01Script
  }
  {
    Position = (2757.651, -116.616, 1755.259)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_MonkeyQP02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_MonkeyQP03 ]
    TriggerScript = TRGP_GapStart_MonkeyQP02Script
  }
  {
    Position = (3244.359, -116.616, 1755.259)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_MonkeyQP03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_MonkeyQP02 ]
    TriggerScript = TRGP_GapStart_MonkeyQP03Script
  }
  {
    Position = (2757.651, -116.616, -69.32462)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_MonkeyQP04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_MonkeyQP05 ]
    TriggerScript = TRGP_GapStart_MonkeyQP04Script
  }
  {
    Position = (3244.359, -116.616, -69.32462)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_MonkeyQP05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_MonkeyQP04 ]
    TriggerScript = TRGP_GapStart_MonkeyQP05Script
  }
  {
    Position = (-406.9619, -98.60863, 7166.317)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_StartGap_HippoPool
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_EndGap_HippoPool02 ]
    TriggerScript = TRGP_StartGap_HippoPoolScript
  }
  {
    Position = (-443.1485, -98.60863, 7166.317)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_EndGap_HippoPool02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_EndGap_HippoPool02Script
  }
  {
    Position = (-397.1265, -98.60863, 7166.317)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_EndGap_HippoPool01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_EndGap_HippoPool01Script
  }
  {
    Position = (-433.313, -98.60863, 7166.317)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_StartGap_HippoPool02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_EndGap_HippoPool01 ]
    TriggerScript = TRGP_StartGap_HippoPool02Script
  }
  {
    Position = (95.44312, 488.4303, 3305.873)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_BridgeRoof
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_BridgeRoof01 ]
    TriggerScript = TRGP_GapStart_BridgeRoofScript
  }
  {
    Position = (95.44312, 237.7671, 4404.229)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_BridgeRoof01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_BridgeRoof ]
    TriggerScript = TRGP_GapStart_BridgeRoof01Script
  }
  {
    Position = (2459.507, -99.91594, 1974.283)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_LongPlanter
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_LongPlanter01 ]
    TriggerScript = TRGP_GapStart_LongPlanterScript
  }
  {
    Position = (2300.758, -134.4596, 4179.878)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_LongPlanter01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_LongPlanter ]
    TriggerScript = TRGP_GapStart_LongPlanter01Script
  }
  {
    Position = (4163.293, -142.3802, 4695.375)
    Angles = (1.5708, -2.34747, 0)
    name = TRGP_GapStart_SnackBar
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_SnackBar02 ]
    TriggerScript = TRGP_GapStart_SnackBarScript
  }
  {
    Position = (4163.293, -142.3802, 5158.647)
    Angles = (1.5708, -0.85521, 0)
    name = TRGP_GapStart_SnackBar02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_SnackBar ]
    TriggerScript = TRGP_GapStart_SnackBar02Script
  }
  {
    Position = (-2301.106, -27.1111, 4702.529)
    Angles = (0, 0, 0)
    name = TRGP_GapStart_Wave01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapStart_Wave01Script
  }
  {
    Position = (2400.33, -152.7111, 4286.23)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapStart_Ape
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_Ape01 ]
    TriggerScript = TRGP_GapStart_ApeScript
  }
  {
    Position = (3484.57, -152.7111, 4286.23)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapEnd_Ape01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_Ape01Script
  }
  {
    Position = (2400.33, -152.7111, 4280.248)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapEnd_Gorilla
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_GorillaScript
  }
  {
    Position = (3484.57, -152.7111, 4280.248)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_GapStart_Gorilla
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_Gorilla ]
    TriggerScript = TRGP_GapStart_GorillaScript
  }
  {
    Position = (4429.24, 185.0071, 3423.081)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_LongNeck
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_LongNeck01 ]
    TriggerScript = TRGP_GapStart_LongNeckScript
  }
  {
    Position = (4330.136, 185.0071, 3423.081)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_GapStart_LongNeck01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_LongNeck ]
    TriggerScript = TRGP_GapStart_LongNeck01Script
  }
  {
    Position = (626.5293, -134.4596, 3453.757)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_LongPlanter02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_LongPlanter03 ]
    TriggerScript = TRGP_GapStart_LongPlanter02Script
  }
  {
    Position = (1925.435, -114.4282, 1138.955)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_LongPlanter03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapStart_LongPlanter02 ]
    TriggerScript = TRGP_GapStart_LongPlanter03Script
  }
  {
    Position = (1619.049, 416.6602, 7322.138)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_GapStart_Moat01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_Moat02 ]
    TriggerScript = TRGP_GapStart_Moat01Script
  }
  {
    Position = (1730.03, 416.6602, 7322.138)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_GapEnd_Moat02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_Moat02Script
  }
  {
    Position = (3390.14, -254.4416, 5272.012)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_Elephant01
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_Ped_StampedeNav01 ]
    TriggerScript = TRG_Ped_Elephant01Script
  }
  {
    Position = (3338.649, -254.4416, 5229.987)
    Angles = (0, 1.5708, 0)
    name = TRG_Ped_Elephant02
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_Ped_StampedeNav05 ]
    TriggerScript = TRG_Ped_Elephant02Script
  }
  {
    Position = (3394.859, -254.4416, 5158.778)
    Angles = (0, 1.82387, 0)
    name = TRG_Ped_Elephant03
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_Ped_StampedeNav03 ]
    TriggerScript = TRG_Ped_Elephant03Script
  }
  {
    Position = (3509.112, -334.3776, 6074.446)
    Angles = (0, 0, 0)
    name = TRG_910
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_632 ]
  }
  {
    Position = (3431.606, -334.3776, 6075.029)
    Angles = (0, 0, 0)
    name = TRG_911
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench03
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2073.804, -203.3601, 1922.548)
    Angles = (0, 3.13287, 0)
    name = TRG_RestartNode_MonkeyHouse
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Monkey House"
  }
  {
    Position = (2281.388, -251.2625, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_01
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_07 ]
  }
  {
    Position = (2281.388, -254.3734, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_02
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_20 ]
    TriggerScript = TRG_Rail_PicnicDamage_02Script
  }
  {
    Position = (2281.388, -254.3734, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_03
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_17 ]
    TriggerScript = TRG_Rail_PicnicDamage_03Script
  }
  {
    Position = (2546.26, -255.1711, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_04
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2546.26, -255.1711, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_05
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2546.26, -250.8106, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_06
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_11 ]
  }
  {
    Position = (2281.388, -251.2625, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_07
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_18 ]
    TriggerScript = TRG_Rail_PicnicDamage_07Script
  }
  {
    Position = (2546.26, -250.8106, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_08
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_06 ]
  }
  {
    Position = (2479.418, -251.2716, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_09
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_04 ]
  }
  {
    Position = (2479.418, -242.3617, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_10
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_08 ]
  }
  {
    Position = (2479.418, -242.3617, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_11
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_15 ]
  }
  {
    Position = (2479.418, -251.2717, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_12
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_05 ]
  }
  {
    Position = (2414.284, -224.4049, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_13
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_09 ]
  }
  {
    Position = (2414.284, -208.5625, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_14
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_10 ]
  }
  {
    Position = (2414.284, -208.5626, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_15
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_19 ]
  }
  {
    Position = (2414.284, -224.405, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_16
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_12 ]
  }
  {
    Position = (2349.017, -250.6994, 5097.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_17
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_13 ]
  }
  {
    Position = (2349.017, -242.7701, 5054.426)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_18
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_14 ]
  }
  {
    Position = (2349.017, -242.7701, 4960.527)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_19
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_01 ]
  }
  {
    Position = (2349.017, -250.6994, 4917.477)
    Angles = (0, 0, 0)
    name = TRG_Rail_PicnicDamage_20
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_Rail_PicnicDamage_16 ]
  }
  {
    Position = (2473.411, -314.4053, 5819.612)
    Angles = (0, 0, 0)
    name = Zoo_PitLights01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1672.627, -314.4053, 6658.599)
    Angles = (0, 0.08727, 0)
    name = Zoo_PitLights02
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (2283.597, -362.108, 6113.7)
    Angles = (0, 0, 0)
    name = Zoo_PitLights03
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (2052.758, -362.108, 6658.829)
    Angles = (0, 0, 0)
    name = Zoo_PitLights04
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1826.434, -314.4053, 7339.077)
    Angles = (0, 0, 0)
    name = Zoo_PitLights05
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (3464.005, -362.108, 5873.917)
    Angles = (0, -1.5708, 0)
    name = Zoo_PitLights06
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (3540.544, -135.4111, 7383.552)
    Angles = (0, 0, 0)
    name = TreeTrunk06
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3417.658, -249.171, 7223.675)
    Angles = (0, 0, 0)
    name = TRG_912
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_57 ]
  }
  {
    Position = (3461.325, -249.1708, 7143.364)
    Angles = (0, 0, 0)
    name = TRG_913
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_912 ]
  }
  {
    Position = (3456.98, -249.1708, 7126.292)
    Angles = (0, 0, 0)
    name = TRG_914
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_913 ]
  }
  {
    Position = (3518.917, -249.171, 7223.675)
    Angles = (0, 0, 0)
    name = TRG_915
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_453 ]
  }
  {
    Position = (3485.445, -249.171, 7126.267)
    Angles = (0, 0, 0)
    name = TRG_916
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_917 ]
  }
  {
    Position = (3480.976, -249.171, 7141.905)
    Angles = (0, 0, 0)
    name = TRG_917
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_915 ]
  }
  {
    Position = (-488.9346, -296.7343, 5820.373)
    Angles = (0, -0.92502, 0)
    name = TRG_Hippo02
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Hippo02Script
  }
  {
    Position = (162.4716, -293.1197, 6123.145)
    Angles = (0, -0.49742, 0)
    name = TRG_Hippo03
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_HippoWaypoint ]
    TriggerScript = TRG_Hippo03Script
  }
  {
    Position = (2499.866, -338.7472, 6469.394)
    Angles = (0, 1.5708, 0)
    name = TRG_RhinoStanding01
    Class = Pedestrian
    type = Anl_Rhino
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    TriggerScript = TRG_RhinoStanding01Script
  }
  {
    Position = (3145.903, -335.8801, 6469.394)
    Angles = (0, -1.5708, 0)
    name = TRG_RhinoStanding02
    Class = Pedestrian
    type = Anl_Rhino
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    TriggerScript = TRG_RhinoStanding02Script
  }
  {
    Position = (52.18576, -293.1197, 5926.167)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint01 ]
  }
  {
    Position = (-422.0562, -293.1197, 5962.988)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint10 ]
  }
  {
    Position = (-1255.07, -293.1197, 6098.92)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint03 ]
  }
  {
    Position = (-1435.052, -293.1197, 6041.669)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint04 ]
  }
  {
    Position = (-1166.692, -293.1197, 5742.059)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint05 ]
  }
  {
    Position = (-492.1791, -293.1197, 5926.427)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint06 ]
  }
  {
    Position = (20.88156, -293.1197, 5738.042)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint08 ]
  }
  {
    Position = (533.4471, -293.1197, 5946.722)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint09 ]
  }
  {
    Position = (373.2568, -293.1197, 5767.693)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint07 ]
  }
  {
    Position = (316.7012, -293.1197, 5988.672)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint ]
  }
  {
    Position = (2134.193, -396.2479, 7232.361)
    Angles = (-0.33161, 1.5708, 0)
    name = TRG_Rhino02
    Class = Pedestrian
    type = Anl_Rhino
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    SuspendDistance = 0
    TriggerScript = TRG_Rhino02Script
  }
  {
    Position = (2711.729, -348.7829, 7224.735)
    Angles = (0, 0, 0)
    name = InvisoVertPolys
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4904.306, -334.3776, 6590.568)
    Angles = (0, 0, 0)
    name = TRG_918
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (514.7024, -296.7343, 6283.037)
    Angles = (0, 0.94248, 0)
    name = TRG_Hippo_01
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Hippo_01Script
  }
  {
    Position = (1747.958, -201.5112, 6005.002)
    Angles = (0, 0, 0)
    name = TRG_919
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_371 ]
  }
  {
    Position = (1911.774, -201.5112, 5817.055)
    Angles = (0, 0, 0)
    name = TRG_920
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_619 ]
  }
  {
    Position = (-274.731, -48.04556, 4683.456)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Penguin01
    Class = Pedestrian
    type = Anl_Penguin
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 300
    Links = [ TRG_G_COLLECT_Waypoint15 ]
    TriggerScript = TRG_G_COLLECT_Penguin01Script
  }
  {
    Position = (-2334.959, -105.3122, 2673.666)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Penguin02
    Class = Pedestrian
    type = Anl_Penguin
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 300
    Links = [ TRG_G_COLLECT_Waypoint17 ]
    TriggerScript = TRG_G_COLLECT_Penguin02Script
  }
  {
    Position = (-2011.188, -255.8782, 7188.343)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Penguin03
    Class = Pedestrian
    type = Anl_Penguin
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 300
    Links = [ TRG_G_COLLECT_Waypoint08 ]
    TriggerScript = TRG_G_COLLECT_Penguin03Script
  }
  {
    Position = (-2524.682, -364.1691, 5318.662)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Penguin04
    Class = Pedestrian
    type = Anl_Penguin
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 300
    Links = [ TRG_G_COLLECT_Waypoint26 ]
    TriggerScript = TRG_G_COLLECT_Penguin04Script
  }
  {
    Position = (-4571.146, -679.3553, 5320.515)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Penguin05
    Class = Pedestrian
    type = Anl_Penguin
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 300
    Links = [ TRG_G_COLLECT_Waypoint33 ]
    TriggerScript = TRG_G_COLLECT_Penguin05Script
  }
  {
    Position = (-2153.89, -255.8782, 7273.381)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint02 ]
  }
  {
    Position = (-2218.118, -255.8782, 7183.367)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint03 ]
  }
  {
    Position = (-2107.44, -255.8782, 7084.296)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint04 ]
  }
  {
    Position = (-2010.649, -255.8782, 7150.896)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint05 ]
  }
  {
    Position = (-1891.021, -255.8782, 7116.388)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint06 ]
  }
  {
    Position = (-1845.097, -255.8782, 7224.472)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint07 ]
  }
  {
    Position = (-1925.749, -255.8782, 7277.169)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint08 ]
  }
  {
    Position = (-2020.097, -255.8782, 7226.058)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint01 ]
  }
  {
    Position = (-486.8649, -48.92049, 4675.088)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint10 ]
  }
  {
    Position = (-376.1866, -48.92049, 4576.017)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint11 ]
  }
  {
    Position = (-279.3955, -48.92049, 4642.617)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint12 ]
  }
  {
    Position = (-159.7681, -48.92049, 4608.109)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint13 ]
  }
  {
    Position = (-113.8438, -48.92049, 4716.193)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint14 ]
  }
  {
    Position = (-194.496, -48.92049, 4768.89)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint15 ]
  }
  {
    Position = (-288.8441, -48.92049, 4717.779)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint16 ]
  }
  {
    Position = (-422.6366, -48.92049, 4765.103)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint09 ]
  }
  {
    Position = (-2281.886, -102.2785, 2713.178)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint18 ]
  }
  {
    Position = (-2415.679, -102.2785, 2760.502)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint19 ]
  }
  {
    Position = (-2479.907, -102.2785, 2670.488)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint20 ]
  }
  {
    Position = (-2369.229, -102.2785, 2571.416)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint21 ]
  }
  {
    Position = (-2272.438, -102.2785, 2638.016)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint22 ]
  }
  {
    Position = (-2152.81, -102.2785, 2603.508)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint23 ]
  }
  {
    Position = (-2106.886, -102.2785, 2711.592)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint24 ]
  }
  {
    Position = (-2187.538, -102.2785, 2764.289)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint24
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint17 ]
  }
  {
    Position = (-2458.117, -355.1951, 5340.398)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint25
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint26 ]
  }
  {
    Position = (-2485.267, -355.1951, 5428.995)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint26
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint27 ]
  }
  {
    Position = (-2602.635, -355.1951, 5457.262)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint27
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint28 ]
  }
  {
    Position = (-2666.864, -355.1951, 5367.249)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint28
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint29 ]
  }
  {
    Position = (-2610.62, -355.1951, 5261.56)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint29
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint30 ]
  }
  {
    Position = (-2530.388, -355.1951, 5176.87)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint30
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint31 ]
  }
  {
    Position = (-2423.389, -355.1951, 5179.617)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint31
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint32 ]
  }
  {
    Position = (-2377.465, -355.1951, 5287.701)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint32
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint25 ]
  }
  {
    Position = (-4498.251, -672.3306, 5341.798)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint33
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint34 ]
  }
  {
    Position = (-4632.043, -672.3306, 5389.121)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint34
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint35 ]
  }
  {
    Position = (-4696.271, -672.3306, 5299.107)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint35
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint36 ]
  }
  {
    Position = (-4585.593, -672.3306, 5200.036)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint36
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint37 ]
  }
  {
    Position = (-4488.802, -672.3306, 5266.636)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint37
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint38 ]
  }
  {
    Position = (-4369.175, -672.3306, 5232.128)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint38
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint39 ]
  }
  {
    Position = (-4323.25, -672.3306, 5340.212)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint39
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint40 ]
  }
  {
    Position = (-4403.903, -672.3306, 5392.909)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT_Waypoint40
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_G_COLLECT_Waypoint33 ]
  }
  {
    Position = (-4529.542, -670.5212, 4051.263)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_waddle_01
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 10000
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_PenguinNav15 ]
    TriggerScript = TRG_penguin_waddle_01Script
  }
  {
    Position = (-4311.488, -535.3554, 2775.528)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_02
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_penguin_02Script
  }
  {
    Position = (-4617.246, -679.4086, 3236.932)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_03
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Links = [ TRG_PenguinNav01 ]
    TriggerScript = TRG_penguin_03Script
  }
  {
    Position = (-4509.738, -679.4086, 3377.779)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_04
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_penguin_04Script
  }
  {
    Position = (-4659.178, -679.4086, 3670.26)
    Angles = (0, 0.67195, 0)
    name = TRG_penguin_05
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_penguin_05Script
  }
  {
    Position = (-4597.905, -679.4086, 3223.561)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav02 ]
  }
  {
    Position = (-4582.899, -679.4086, 3145.503)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav03 ]
  }
  {
    Position = (-4494.309, -679.4086, 3117.722)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav04 ]
  }
  {
    Position = (-4417.586, -679.4086, 3166.531)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav05 ]
  }
  {
    Position = (-4390.991, -679.4086, 3241.78)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav06 ]
  }
  {
    Position = (-4473.352, -679.4086, 3313.86)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav07 ]
  }
  {
    Position = (-4548.268, -679.4086, 3288.672)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav01 ]
  }
  {
    Position = (-4468.831, -535.2089, 2671.917)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav09 ]
  }
  {
    Position = (-4257.208, -535.2089, 2729.486)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav10 ]
  }
  {
    Position = (-4206.678, -533.8798, 2893.647)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav10
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Penguin_Slide
    Links = [ TRG_PenguinNav11 ]
  }
  {
    Position = (-4210.642, -623.5228, 3256.965)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav12 ]
  }
  {
    Position = (-4226.647, -669.3369, 3564.419)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav13 ]
  }
  {
    Position = (-4277.442, -670.8427, 3708.87)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav14 ]
  }
  {
    Position = (-4340.927, -670.8427, 3889.777)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav14
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Penguin_Waddle
    Links = [ TRG_PenguinNav15 ]
  }
  {
    Position = (-4508.578, -670.8427, 4010.95)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav16 ]
  }
  {
    Position = (-4609.603, -670.8427, 3950.845)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav17 ]
  }
  {
    Position = (-4680.29, -669.3369, 3832.455)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav18 ]
  }
  {
    Position = (-4752.183, -669.3369, 3690.854)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav19 ]
  }
  {
    Position = (-4826.827, -598.021, 2991.638)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav20 ]
  }
  {
    Position = (-4789.03, -535.2089, 2813.195)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav21 ]
  }
  {
    Position = (-4720.116, -535.2089, 2716.114)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav08 ]
  }
  {
    Position = (-4617.246, -679.4086, 2985.563)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_06
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Links = [ TRG_PenguinNav22 ]
    TriggerScript = TRG_penguin_06Script
  }
  {
    Position = (-4597.905, -679.4086, 2972.192)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav28 ]
  }
  {
    Position = (-4582.899, -679.4086, 2894.133)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav22 ]
  }
  {
    Position = (-4494.309, -679.4086, 2866.353)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav24
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav23 ]
  }
  {
    Position = (-4417.586, -679.4086, 2915.161)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav25
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav24 ]
  }
  {
    Position = (-4390.991, -679.4086, 2990.411)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav26
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav25 ]
  }
  {
    Position = (-4473.352, -679.4086, 3062.491)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav27
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav26 ]
  }
  {
    Position = (-4548.268, -679.4086, 3037.302)
    Angles = (0, -3.14159, 0)
    name = TRG_PenguinNav28
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PenguinNav27 ]
  }
  {
    Position = (4248.219, -335.3365, 6356.164)
    Angles = (0, 0, 0)
    name = TRG_Elephant01
    Class = Pedestrian
    type = Anl_Elephant
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Elephant
    AnimName = animload_anl_elephant
    model = "animals\anl_elephant\anl_elephant.skin"
    SuspendDistance = 10000
    lod_dist1 = 175
    lod_dist2 = 176
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    Links = [ TRG_Elephant_Nav03 ]
    TriggerScript = TRG_Elephant01Script
  }
  {
    Position = (4798.612, -374.2001, 7249.687)
    Angles = (-0.43633, -1.5708, 0)
    name = TRG_Elephant02
    Class = Pedestrian
    type = Anl_Elephant
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Elephant
    AnimName = animload_anl_elephant
    model = "animals\anl_elephant\anl_elephant.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    SuspendDistance = 0
    TriggerScript = TRG_Elephant02Script
  }
  {
    Position = (-495.7464, -350.0316, 5817.999)
    Angles = (0, 0, 0)
    name = Zoo_HippoCollision
    Class = LevelGeometry
    type = 0
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = none
    TriggerScript = Zoo_HippoCollisionScript
  }
  {
    Position = (4742.481, -29.51262, 4785.584)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion01
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion02 ]
  }
  {
    Position = (4941.127, -22.57252, 4774.534)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion02
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion03 ]
  }
  {
    Position = (5107.953, -18.80739, 4756.813)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion04 ]
  }
  {
    Position = (5274.958, -10.93005, 4745.605)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion05 ]
  }
  {
    Position = (5469.638, 0.01048, 4730.056)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion05
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion06 ]
  }
  {
    Position = (5636.864, 12.97567, 4716.677)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion07 ]
  }
  {
    Position = (5804.258, 29.74803, 4698.958)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion08 ]
  }
  {
    Position = (6005.892, 49.68433, 4683.409)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (4742.481, -29.51262, 5047.632)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion09
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion10 ]
  }
  {
    Position = (4941.127, -22.57252, 5064.825)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion10
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion11 ]
  }
  {
    Position = (5107.953, -18.8074, 5079.688)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion11
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion12 ]
  }
  {
    Position = (5274.958, -10.93006, 5094.552)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion12
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion13 ]
  }
  {
    Position = (5469.638, 0.01047, 5109.416)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion13
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion14 ]
  }
  {
    Position = (5636.864, 12.97565, 5124.279)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion14
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion15 ]
  }
  {
    Position = (5804.258, 29.74802, 5139.143)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion15
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion16 ]
  }
  {
    Position = (6005.892, 49.68435, 5154.007)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion16
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (3606.807, -254.4416, 5227.071)
    Angles = (0, -1.5708, 0)
    name = TRG_Elephant_Stampede
    Class = Pedestrian
    type = Anl_Elephant
    AbsentInNetGames
    SkeletonName = Elephant
    AnimName = animload_anl_elephant
    model = "animals\anl_elephant\anl_elephant.skin"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    Links = [ TRG_Elephant_Nav01 ]
    TriggerScript = TRG_Elephant_StampedeScript
  }
  {
    Position = (2673.096, -254.4416, 5141.56)
    Angles = (0, -1.5708, 0)
    name = TRG_Elephant_Nav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav02 ]
  }
  {
    Position = (1318.274, -254.4416, 4737.674)
    Angles = (0, -1.5708, 0)
    name = TRG_Elephant_Nav02
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (5510.383, 43.43846, 4353.193)
    Angles = (0, 0, 0)
    name = TRG_RailFlag01
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailFlag02 ]
  }
  {
    Position = (5510.383, 14.38524, 4252.684)
    Angles = (0, 0, 0)
    name = TRG_RailFlag02
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailFlag03 ]
  }
  {
    Position = (5510.383, -14.35856, 4152.174)
    Angles = (0, 0, 0)
    name = TRG_RailFlag03
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5675.789, -14.35856, 4152.174)
    Angles = (0, 0, 0)
    name = TRG_RailFlag04
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5675.789, 14.38524, 4252.684)
    Angles = (0, 0, 0)
    name = TRG_RailFlag05
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailFlag04 ]
  }
  {
    Position = (5675.789, 43.43846, 4353.193)
    Angles = (0, 0, 0)
    name = TRG_RailFlag06
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailFlag05 ]
  }
  {
    Position = (5817.451, -14.35856, 4152.174)
    Angles = (0, 0, 0)
    name = TRG_RailFlag07
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (5817.451, 14.38524, 4252.684)
    Angles = (0, 0, 0)
    name = TRG_RailFlag08
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailFlag07 ]
  }
  {
    Position = (5817.451, 43.43846, 4353.193)
    Angles = (0, 0, 0)
    name = TRG_RailFlag09
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailFlag08 ]
  }
  {
    Position = (3202.878, -181.9435, 5886.841)
    Angles = (0.091, 0.72932, -0.08164)
    name = TRG_921
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_483 ]
  }
  {
    Position = (2444.835, -286.1201, 6121.552)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_922
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_929 ]
  }
  {
    Position = (2346.632, -179.491, 5813.83)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_923
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_924 ]
  }
  {
    Position = (2357.905, -179.4502, 5861.363)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_924
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_931 ]
  }
  {
    Position = (2383.141, -192.224, 5955.087)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_925
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_926 ]
  }
  {
    Position = (2398.66, -210.9152, 6002.077)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_926
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_927 ]
  }
  {
    Position = (2414.245, -234.8996, 6045.967)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_927
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_928 ]
  }
  {
    Position = (2429.089, -259.8018, 6085.219)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_928
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_922 ]
  }
  {
    Position = (2460.669, -310.7801, 6153.563)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_929
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2336.111, -177.5037, 5766.528)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_930
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_923 ]
  }
  {
    Position = (2368.48, -181.9435, 5906.581)
    Angles = (0.091, 0.07482, -0.08164)
    name = TRG_931
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_925 ]
  }
  {
    Position = (98.94025, -116.5407, 4448.708)
    Angles = (0, 0, 0)
    name = Zoo_BridgeRail01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (98.94012, -116.5407, 4928.047)
    Angles = (0, 0, 0)
    name = Zoo_BridgeRail02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4877.636, -228.7627, 5931.798)
    Angles = (0, 0, 0)
    name = ZElephRhino_Handrail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    CollisionMode = Geometry
  }
  {
    Position = (-2124.76, -259.2013, 4905.995)
    Angles = (0, 0, 0)
    name = Zoo_Handrail16
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail16
  }
  {
    Position = (-2124.76, -259.2013, 4467.34)
    Angles = (0, 0, 0)
    name = Zoo_Handrail19
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail19
  }
  {
    Position = (3047.846, -151.8203, 947.6476)
    Angles = (0, 0, 0)
    name = HJ_Rock02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3134.063, -58.21811, 782.4998)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyHouse01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3593.787, -199.2206, 1432.089)
    Angles = (0, 0, 0)
    name = MONKEY_Rail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail01
    CollisionMode = Geometry
  }
  {
    Position = (3594.754, -199.5994, 247.8206)
    Angles = (0, 0, 0)
    name = MONKEY_Rail02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail02
    CollisionMode = Geometry
  }
  {
    Position = (3030.042, -182.0281, 853.5149)
    Angles = (0, 0, 0)
    name = MONKEY_House04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3036.093, -206.8864, 849.074)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyHouse02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3050.553, -58.17841, 838.5548)
    Angles = (0, 0, 0)
    name = MONKEY_House02a
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3020.039, -77.93274, 847.4627)
    Angles = (0, 0, 0)
    name = MONKEY_House03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2999.999, 41.62428, 840.0002)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyHouse02a03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3221.864, 162.6235, 835.4258)
    Angles = (0, 0, 0)
    name = Zoo_monkeyBush26
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3021.335, -191.9375, 937.1488)
    Angles = (0, 0, 0)
    name = PlantShadows01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3001.942, 156.6115, 838.5023)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyRoof02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    CollisionMode = Geometry
  }
  {
    Position = (2999.999, 61.03954, 840.0001)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyCenter01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyCenter01
    CollisionMode = Geometry
  }
  {
    Position = (-1672.787, -147.5541, 2780.93)
    Angles = (0, -3.14159, 0)
    name = Zoo_Handrail22
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AviaryRail01
  }
  {
    Position = (-2567.134, -149.0937, 1421.087)
    Angles = (0, 0, 0)
    name = Zoo_AviaryRail05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AviaryRail05
  }
  {
    Position = (-2317.489, -149.3118, 1421.1)
    Angles = (0, 0, 0)
    name = Zoo_AviaryRail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AviaryRail06
  }
  {
    Position = (-1968.158, -145.4857, 3217.689)
    Angles = (0, -3.14159, 0)
    name = Zoo_Handrail23
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AviaryRail02
  }
  {
    Position = (5700.243, 123.5978, 3739.256)
    Angles = (0, 0, 0)
    name = TRG_Goal_Proline_O2
    Class = GameObject
    type = Combo_O
    model = "gameobjects\combo\goal_combo_o\goal_combo_o.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_Proline_O2Script
  }
  {
    Position = (-2440.938, -176.4944, 1879.184)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2999.999, -192.1534, 840)
    Angles = (0, 0, 0)
    name = MONKEY_QPCenter01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = MONKEY_QPCenter01
  }
  {
    Position = (3000.926, -198.5113, 1750.726)
    Angles = (0, -3.14159, 0)
    name = MONKEY_QP03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    CollisionMode = Geometry
  }
  {
    Position = (3478.617, -227.1585, 359.9999)
    Angles = (0, 0, 0)
    name = MONKEY_PitFloor01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3927.564, -212.8063, 839.8396)
    Angles = (0, 0, 0)
    name = MONKEY_QP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    CollisionMode = Geometry
  }
  {
    Position = (2999.999, -192.1534, 840)
    Angles = (0, 0, 0)
    name = Zoo_MKInnerFloor
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (2983.573, 17.95511, 1158.843)
    Angles = (0, 0, 0)
    name = TRG_Goal_COMBO_C
    Class = GameObject
    type = Combo_C
    model = "gameobjects\combo\goal_combo_c\goal_combo_c.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Goal_COMBO_CScript
  }
  {
    Position = (1530.759, -158.9446, 2647.678)
    Angles = (0, 0, 0)
    name = TRG_932
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_81 ]
  }
  {
    Position = (1538.749, -159.1216, 2454.637)
    Angles = (0, 0, 0)
    name = TRG_933
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (1522.2, -139.9869, 2476.581)
    Angles = (0, 0, 0)
    name = TRG_934
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_935 ]
  }
  {
    Position = (1522.2, -139.9869, 2615.601)
    Angles = (0, 0, 0)
    name = TRG_935
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (1526.795, -77.68565, 2471.001)
    Angles = (0, 0, 0)
    name = TRG_936
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_937 ]
  }
  {
    Position = (1526.795, -77.68565, 2621.181)
    Angles = (0, 0, 0)
    name = TRG_937
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (1475.821, -180.7001, 2542.4)
    Angles = (0, 1.5708, 0)
    name = TRG_Ped_Vendor01
    Class = Pedestrian
    type = Ped_ZooSeller
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zooseller\ped_zooseller.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Vendor01Script
  }
  {
    Position = (-1961.131, -213.7247, 5803.411)
    Angles = (0, 0.7854, 0)
    name = TRG_938
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_939 ]
  }
  {
    Position = (-2059.433, -213.7247, 5901.712)
    Angles = (0, 0.7854, 0)
    name = TRG_939
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-1953.937, -152.8379, 5802.714)
    Angles = (0, 0.7854, 0)
    name = TRG_940
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_941 ]
  }
  {
    Position = (-2060.13, -152.8379, 5908.907)
    Angles = (0, 0.7854, 0)
    name = TRG_941
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-1953.698, -205.3883, 5798.89)
    Angles = (0, 0, 0)
    name = TRG_942
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_347 ]
  }
  {
    Position = (-2063.566, -205.3883, 5908.757)
    Angles = (0, 0, 0)
    name = TRG_943
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2052.353, -256.0394, 5810.585)
    Angles = (0, 2.3562, 0)
    name = TRG_Ped_Vendor02
    Class = Pedestrian
    type = Ped_ZooSeller
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zooseller\ped_zooseller.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Vendor02Script
  }
  {
    Position = (213.2448, -132.4502, 2125.934)
    Angles = (0, 0, 0)
    name = TRG_Ped_Vendor03
    Class = Pedestrian
    type = Ped_From_Profile
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Vendor03Script
  }
  {
    Position = (-779.7766, 92.03268, 3272.592)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_01
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_01Script
  }
  {
    Position = (428.2107, 193.3027, 821.0693)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_02
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_02Script
  }
  {
    Position = (-352.0275, 166.8355, 1407.139)
    Angles = (0, 0, 0)
    name = TRG_944
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_604 ]
  }
  {
    Position = (-352.0275, 166.8355, 1257.17)
    Angles = (0, 0, 0)
    name = TRG_945
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_944 ]
  }
  {
    Position = (591.6304, 166.8355, 1407.139)
    Angles = (0, 0, 0)
    name = TRG_946
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_947 ]
  }
  {
    Position = (591.6304, 166.8355, 1257.17)
    Angles = (0, 0, 0)
    name = TRG_947
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_625 ]
  }
  {
    Position = (2811.787, -249.171, 7271.498)
    Angles = (0, 0, 0)
    name = TRG_948
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_56 ]
  }
  {
    Position = (2923.212, -249.171, 7271.498)
    Angles = (0, 0, 0)
    name = TRG_949
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3703.323, -228.5511, 4179.006)
    Angles = (0, 0, 0)
    name = TRG_950
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_417 ]
  }
  {
    Position = (3849.73, -225.0303, 4171.032)
    Angles = (0, 0, 0)
    name = TRG_951
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3721.522, -225.8115, 4182.088)
    Angles = (0, 0, 0)
    name = TRG_952
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_950 ]
  }
  {
    Position = (2823.191, -257.3068, 4583.914)
    Angles = (0, -3.14159, 0)
    name = TRG_Gorilla
    Class = Pedestrian
    type = Anl_Gorilla
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_GorillaNav01 ]
    TriggerScript = TRG_GorillaScript
  }
  {
    Position = (5116.564, -230.7541, 6836.342)
    Angles = (0, 0, 0)
    name = InvisoFullpipeSmoother
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5113.872, -216.3286, 6838.199)
    Angles = (0, 0, 0)
    name = zoo_ElephantSupport
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3606.804, -254.436, 5227.068)
    Angles = (0, -1.5708, 0)
    name = TRG_Elephant_Standing
    Class = Pedestrian
    type = Anl_Elephant
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Elephant
    AnimName = animload_anl_elephant
    model = "animals\anl_elephant\anl_elephant.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    TriggerScript = TRG_Elephant_StandingScript
  }
  {
    Position = (3606.804, -254.436, 5227.068)
    Angles = (0, 0, 0)
    name = TRGP_ElephantStampede
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    TriggerScript = TRGP_ElephantStampedeScript
  }
  {
    Position = (32.69196, 31.67535, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl11
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl12 ]
  }
  {
    Position = (212.692, 31.67516, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl10
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl11 ]
  }
  {
    Position = (418.1647, 14.25961, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl09
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl10 ]
  }
  {
    Position = (-5192.346, -378.9757, 6518.875)
    Angles = (0, -2.44346, 0)
    name = TRG_MG_Height
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
  }
  {
    Position = (2124.053, -229.6433, 3182.134)
    Angles = (0, -1.5708, 0)
    name = TRG_Sk3Ed_Rail2131
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2130.79, -228.5511, 3498.004)
    Angles = (0, 0, 0)
    name = TRG_953
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2140.715, -218.8375, 3126.279)
    Angles = (0, 0, 0)
    name = TRG_954
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_397 ]
  }
  {
    Position = (2418.96, -167.5873, 2168.17)
    Angles = (0, 0, 0)
    name = TRG_955
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_392 ]
  }
  {
    Position = (2336.856, -156.0029, 2500.323)
    Angles = (0, 0, 0)
    name = TRG_956
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2499.866, -338.7472, 6469.394)
    Angles = (0, 1.5708, 0)
    name = TRG_RhinoCharging01
    Class = Pedestrian
    type = Anl_Rhino
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    SuspendDistance = 0
    Links = [ TRG_RhinoNav01 ]
    TriggerScript = TRG_RhinoCharging01Script
  }
  {
    Position = (3145.903, -335.8801, 6469.394)
    Angles = (0, -1.5708, 0)
    name = TRG_RhinoCharging02
    Class = Pedestrian
    type = Anl_Rhino
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    SuspendDistance = 0
    Links = [ TRG_RhinoNav02 ]
    TriggerScript = TRG_RhinoCharging02Script
  }
  {
    Position = (2777.959, -338.7472, 6473.818)
    Angles = (0, 1.5708, 0)
    name = TRG_RhinoNav01
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (2860.705, -336.7965, 6465.071)
    Angles = (0, -1.5708, 0)
    name = TRG_RhinoNav02
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (59.0665, 0, -1614.433)
    Angles = (0, -3.14159, 0)
    name = Trg_Proset4_restartnode
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "P1: Restart"
    restart_types = [ Player1 ]
  }
  {
    Position = (239.9999, 167.7625, 681.3861)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance15
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance09 ]
  }
  {
    Position = (-0.00003, 167.7626, 681.3862)
    Angles = (0, 0, 0)
    name = TRG_RailEntrance16
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_RailEntrance03 ]
  }
  {
    Position = (4246.716, -335.3365, 6208.666)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav04 ]
  }
  {
    Position = (4463.828, -335.3365, 6313.046)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav05 ]
  }
  {
    Position = (4578.419, -335.3365, 6662.245)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav06 ]
  }
  {
    Position = (4451.532, -335.3365, 6898.228)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav07 ]
  }
  {
    Position = (4147.702, -335.3365, 6944.622)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav08 ]
  }
  {
    Position = (3855.801, -335.3365, 6833.537)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav09 ]
  }
  {
    Position = (3718.873, -335.3365, 6548.311)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav10 ]
  }
  {
    Position = (3898.795, -335.3365, 6297.896)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Nav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Elephant_Nav03 ]
  }
  {
    Position = (3095.491, -98.43114, 4297.252)
    Angles = (0, -3.14159, 0)
    name = TRG_Gorilla01
    Class = Pedestrian
    type = Anl_Gorilla
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Gorilla01Script
  }
  {
    Position = (2853.791, -257.3068, 4569.787)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav02 ]
  }
  {
    Position = (2984.998, -257.3068, 4531.913)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav03 ]
  }
  {
    Position = (3007.643, -257.3068, 4451.113)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav04 ]
  }
  {
    Position = (2956.238, -257.3068, 4392.185)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav05 ]
  }
  {
    Position = (2826.752, -257.3068, 4367.637)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav06 ]
  }
  {
    Position = (2718.754, -257.3068, 4348.938)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav07 ]
  }
  {
    Position = (2633.013, -257.3068, 4374.455)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav08 ]
  }
  {
    Position = (2611.483, -257.3068, 4430.274)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav09 ]
  }
  {
    Position = (2714.194, -257.3068, 4527.368)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav01 ]
  }
  {
    Position = (-1502.585, 102.4328, 2661.13)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_03
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_03Script
  }
  {
    Position = (-450.5573, -90.42232, 7138.856)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_04
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_04Script
  }
  {
    Position = (2578.936, -254.4416, 5316.106)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_StampedeNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_StampedeNav02 ]
  }
  {
    Position = (2426.779, -254.4416, 5542.691)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_StampedeNav02
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (3113.792, -254.4416, 4909.173)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_StampedeNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_StampedeNav04 ]
  }
  {
    Position = (3075.119, -254.4416, 4766.527)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_StampedeNav04
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (2974.853, -254.4416, 5077.666)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_StampedeNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_StampedeNav06 ]
  }
  {
    Position = (2863.714, -254.4416, 4775.418)
    Angles = (0, 1.36136, 0)
    name = TRG_Ped_StampedeNav06
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (-631.2592, -261.2273, 6010.284)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge01
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge02 ]
  }
  {
    Position = (-631.2592, -261.2273, 5854.965)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge02
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge03 ]
  }
  {
    Position = (-631.2592, -261.2273, 5691.104)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge03
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge09 ]
  }
  {
    Position = (-310.2592, -261.2273, 6010.284)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge04
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge05 ]
  }
  {
    Position = (-310.2592, -261.2273, 5854.965)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge05
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge06 ]
  }
  {
    Position = (-310.2592, -261.2273, 5691.104)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge06
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge10 ]
  }
  {
    Position = (-130.472, -296.7343, 5940.34)
    Angles = (0, -0.92502, 0)
    name = TRG_Hippo06
    Class = Pedestrian
    type = Anl_Hippo
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Hippo06Script
  }
  {
    Position = (-3291.918, 195.1663, 2219.334)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine08
    Class = RailNode
    type = Wood
    TrickObject Cluster = Proset5_Spine01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset5_RailSpine01 ]
  }
  {
    Position = (-3291.918, 195.1663, 1720.756)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine01
    Class = RailNode
    type = Wood
    TrickObject Cluster = Proset5_Spine01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1244.223, 104.7432, 1937.299)
    Angles = (0, -1.5708, 0)
    name = Trg_Proset5_restartnode
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "Proset5"
    restart_types = [ Player1 ]
  }
  {
    Position = (3470.711, -145.106, 7550.04)
    Angles = (0, 0, 0)
    name = Zoo_HighPitRail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    CollisionMode = Geometry
  }
  {
    Position = (3428.521, -94.5063, 7232.205)
    Angles = (0, 0, 0)
    name = TRG_957
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_510 ]
  }
  {
    Position = (3328.039, -94.50631, 7284.854)
    Angles = (0, 0, 0)
    name = TRG_958
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_957 ]
  }
  {
    Position = (3157.88, -94.50632, 7285.595)
    Angles = (0, 0, 0)
    name = TRG_959
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_958 ]
  }
  {
    Position = (3141.116, -94.50632, 7282.577)
    Angles = (0, 0, 0)
    name = TRG_960
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_959 ]
  }
  {
    Position = (3470.711, -145.106, 7550.04)
    Angles = (0, 0, 0)
    name = Zoo_HighPitRail02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    CollisionMode = Geometry
  }
  {
    Position = (3512.901, -94.5063, 7232.205)
    Angles = (0, 0, 0)
    name = TRG_961
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_962 ]
  }
  {
    Position = (3613.383, -94.50631, 7279.684)
    Angles = (0, 0, 0)
    name = TRG_962
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_963 ]
  }
  {
    Position = (3783.543, -94.50632, 7280.424)
    Angles = (0, 0, 0)
    name = TRG_963
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_964 ]
  }
  {
    Position = (3794.3, -94.50632, 7278.466)
    Angles = (0, 0, 0)
    name = TRG_964
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2920.512, -329.4665, 6956.164)
    Angles = (0, 0, 0)
    name = TRG_Restart06
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Rhino Pit"
  }
  {
    Position = (5987.881, 56.32413, 5646.201)
    Angles = (0, 0, 0)
    name = TRG_965
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_589 ]
  }
  {
    Position = (5999.945, 47.99664, 5627.556)
    Angles = (0, 0, 0)
    name = TRG_966
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_588 ]
  }
  {
    Position = (-620.9434, 630.4678, 1960.983)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar01
    Class = RailNode
    type = Metal
    CreatedAtStart
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar02 ]
    TriggerScript = TRG_RailGrindBar01Script
  }
  {
    Position = (-620.9434, 630.4677, 1771.841)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar02
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    TriggerScript = TRG_RailGrindBar02Script
  }
  {
    Position = (-620.9434, 630.8676, 2178.285)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar09
    Class = RailNode
    type = Metal
    CreatedAtStart
    LipOverride
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar10 ]
    TriggerScript = TRG_RailGrindBar09Script
  }
  {
    Position = (-620.9434, 630.8675, 1986.948)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar10
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2018.974, -186.4945, 872.433)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyQP05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyQP05
  }
  {
    Position = (1793.456, 110.6326, 840.0005)
    Angles = (0, 0, 0)
    name = TRG_967
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyHouse
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2037.807, 110.6326, 840.0005)
    Angles = (0, 0, 0)
    name = TRG_968
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_967 ]
  }
  {
    Position = (108.4121, -216.4841, 3949.83)
    Angles = (-0.09599, -1.5708, 0)
    name = TRG_Seal01
    Class = Pedestrian
    type = Anl_Seal
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = seal
    AnimName = animload_anl_seal
    model = "animals\anl_seal\anl_seal.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_seal_shadow\anl_seal_shadow.mdl"
    TriggerScript = TRG_Seal01Script
  }
  {
    Position = (-189.5813, -239.1637, 3921.969)
    Angles = (0, -1.5708, 0)
    name = TRG_Seal02
    Class = Pedestrian
    type = Anl_Seal
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = seal
    AnimName = animload_anl_seal
    model = "animals\anl_seal\anl_seal.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_SealNav01 ]
    TriggerScript = TRG_Seal02Script
  }
  {
    Position = (-147.3248, -239.1637, 3923.622)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav02 ]
  }
  {
    Position = (-89.84151, -239.1637, 3828.99)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav03 ]
  }
  {
    Position = (122.2307, -239.1637, 3802.771)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav04 ]
  }
  {
    Position = (322.937, -239.1637, 3826.749)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav05 ]
  }
  {
    Position = (392.4715, -239.1637, 3927.318)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav06 ]
  }
  {
    Position = (337.9365, -239.1637, 4034.698)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav07 ]
  }
  {
    Position = (152.4945, -239.1637, 4104.295)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav08 ]
  }
  {
    Position = (-59.01204, -239.1637, 4064.983)
    Angles = (0, -1.5708, 0)
    name = TRG_SealNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SealNav01 ]
  }
  {
    Position = (4.98163, -227.3268, 3924.677)
    Angles = (-0.09599, -2.48075, 0)
    name = TRG_Seal03
    Class = Pedestrian
    type = Anl_Seal
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = seal
    AnimName = animload_anl_seal
    model = "animals\anl_seal\anl_seal.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_seal_shadow\anl_seal_shadow.mdl"
    TriggerScript = TRG_Seal03Script
  }
  {
    Position = (6088.187, -255.9884, 5028.639)
    Angles = (0, 0.10472, 0)
    name = TRG_Lion01
    Class = Pedestrian
    type = Anl_Lion
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = lion
    AnimName = animload_anl_lion
    model = "animals\anl_lion\anl_lion.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_lion_shadow\anl_lion_shadow.mdl"
    Links = [ TRG_LionNav01 ]
    TriggerScript = TRG_Lion01Script
  }
  {
    Position = (6098.332, -255.9884, 4925.631)
    Angles = (0, 0, 0)
    name = TRG_LionNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav02 ]
  }
  {
    Position = (6134.092, -255.9884, 4559.604)
    Angles = (0, 0, 0)
    name = TRG_LionNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav03 ]
  }
  {
    Position = (6256.178, -255.9884, 4510.142)
    Angles = (0, 0, 0)
    name = TRG_LionNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav04 ]
  }
  {
    Position = (6372.601, -255.9884, 4571.475)
    Angles = (0, 0, 0)
    name = TRG_LionNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav05 ]
  }
  {
    Position = (6395.897, -255.9884, 4921.316)
    Angles = (0, 0, 0)
    name = TRG_LionNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav06 ]
  }
  {
    Position = (6387.078, -255.9884, 5224.757)
    Angles = (0, 0, 0)
    name = TRG_LionNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav07 ]
  }
  {
    Position = (6289.69, -255.9884, 5323.236)
    Angles = (0, 0, 0)
    name = TRG_LionNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav08 ]
  }
  {
    Position = (6156.974, -255.9884, 5223.374)
    Angles = (0, 0, 0)
    name = TRG_LionNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav01 ]
  }
  {
    Position = (6150.605, -255.9884, 4925.873)
    Angles = (0, 0, 0)
    name = TRG_LionNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav16 ]
  }
  {
    Position = (6170.781, -255.9884, 4699.935)
    Angles = (0, 0, 0)
    name = TRG_LionNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav09 ]
  }
  {
    Position = (6243.506, -255.9884, 4655.731)
    Angles = (0, 0, 0)
    name = TRG_LionNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav10 ]
  }
  {
    Position = (6315.843, -255.9884, 4690.077)
    Angles = (0, 0, 0)
    name = TRG_LionNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav11 ]
  }
  {
    Position = (6348.098, -255.9884, 4902.13)
    Angles = (0, 0, 0)
    name = TRG_LionNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav12 ]
  }
  {
    Position = (6340.583, -255.9884, 5110.739)
    Angles = (0, 0, 0)
    name = TRG_LionNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav13 ]
  }
  {
    Position = (6279.716, -255.9884, 5171.335)
    Angles = (0, 0, 0)
    name = TRG_LionNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav14 ]
  }
  {
    Position = (6210.272, -255.9884, 5156.106)
    Angles = (0, 0, 0)
    name = TRG_LionNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav15 ]
  }
  {
    Position = (6377.571, -255.9884, 4976.896)
    Angles = (0, -0.38397, 0)
    name = TRG_Lion02
    Class = Pedestrian
    type = Anl_Lion
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = lion
    AnimName = animload_anl_lion
    model = "animals\anl_lion\anl_lion.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_lion_shadow\anl_lion_shadow.mdl"
    Links = [ TRG_LionNav13 ]
    TriggerScript = TRG_Lion02Script
  }
  {
    Position = (2746.765, -191.9968, 868.4904)
    Angles = (0, -1.09956, 0)
    name = TRG_meerkat_01
    Class = Pedestrian
    type = Anl_Meerkat
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = meerkat
    AnimName = animload_anl_meerkat
    model = "animals\anl_meerkat\anl_meerkat.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_meerkat_01Script
  }
  {
    Position = (3181.793, -191.9968, 970.8491)
    Angles = (0, -1.03847, 0)
    name = TRG_meerkat_03
    Class = Pedestrian
    type = Anl_Meerkat
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = meerkat
    AnimName = animload_anl_meerkat
    model = "animals\anl_meerkat\anl_meerkat.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_meerkat_03Script
  }
  {
    Position = (3201.219, -191.9968, 967.9226)
    Angles = (0, 0.84649, 0)
    name = TRG_meerkat_04
    Class = Pedestrian
    type = Anl_Meerkat
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = meerkat
    AnimName = animload_anl_meerkat
    model = "animals\anl_meerkat\anl_meerkat.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_meerkat_04Script
  }
  {
    Position = (3159.693, -191.9968, 666.2457)
    Angles = (0, -1.03847, 0)
    name = TRG_meerkat_06
    Class = Pedestrian
    type = Anl_Meerkat
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = meerkat
    AnimName = animload_anl_meerkat
    model = "animals\anl_meerkat\anl_meerkat.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_meerkat_06Script
  }
  {
    Position = (2887.713, -191.9968, 616.4633)
    Angles = (0, -1.03847, 0)
    name = TRG_meerkat_09
    Class = Pedestrian
    type = Anl_Meerkat
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = meerkat
    AnimName = animload_anl_meerkat
    model = "animals\anl_meerkat\anl_meerkat.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_meerkat_09Script
  }
  {
    Position = (2924.933, -191.9968, 593.2656)
    Angles = (0, 0.84649, 0)
    name = TRG_meerkat_10
    Class = Pedestrian
    type = Anl_Meerkat
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = meerkat
    AnimName = animload_anl_meerkat
    model = "animals\anl_meerkat\anl_meerkat.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_meerkat_10Script
  }
  {
    Position = (3473.712, -205.6689, 5645.06)
    Angles = (0, 0, 0)
    name = TRG_969
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_505 ]
  }
  {
    Position = (3470.105, -205.6689, 5645.06)
    Angles = (0, 0, 0)
    name = TRG_970
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2699.238, -175.8234, 976.1081)
    Angles = (0, 0, 0)
    name = TRG_G_TETRIS_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: SKATE-Tris"
  }
  {
    Position = (-2641.03, -175.8234, 940.5286)
    Angles = (0, -1.85005, 0)
    name = TRG_G_TETRIS_Pro
    Class = Pedestrian
    type = PedPro_Margera
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_margera_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Margera
  }
  {
    Position = (3076.353, -191.1058, 7293.93)
    Angles = (0, 0, 0)
    name = Zoo_PitWall01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    CollisionMode = Geometry
  }
  {
    Position = (2651.071, -191.1058, 7293.931)
    Angles = (0, 0, 0)
    name = Zoo_PitWall02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    CollisionMode = Geometry
  }
  {
    Position = (2192.563, -275.744, 6998.475)
    Angles = (0, 0, 0)
    name = Zoo_PitWall03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    CollisionMode = Geometry
  }
  {
    Position = (3755.813, -191.1058, 7293.93)
    Angles = (0, 0, 0)
    name = Zoo_PitWall05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    CollisionMode = Geometry
  }
  {
    Position = (4170.345, -191.1058, 7293.93)
    Angles = (0, 0, 0)
    name = Zoo_PitWall04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    CollisionMode = Geometry
  }
  {
    Position = (3425.789, -306.4693, 5875.991)
    Angles = (0, 0, 0)
    name = ZEleph_TrenchCenter02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    CollisionMode = Geometry
  }
  {
    Position = (3516.083, -306.4693, 5875.991)
    Angles = (0, 0, 0)
    name = ZEleph_TrenchCenter01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_TrenchCenter01
    CollisionMode = Geometry
  }
  {
    Position = (2709.826, 108.5047, 7446.686)
    Angles = (0, 0, 0)
    name = zoo_hj_build02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart06 ]
    TriggerScript = zoo_hj_build02Script
  }
  {
    Position = (-714.1877, 384.2445, 1632.097)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav11 ]
  }
  {
    Position = (-582.981, 384.2445, 1594.224)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav12 ]
  }
  {
    Position = (-520.1848, 384.2445, 1500.71)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav13 ]
  }
  {
    Position = (-572.4426, 384.2445, 1436.089)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav14 ]
  }
  {
    Position = (-725.2615, 384.2445, 1407.501)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav15 ]
  }
  {
    Position = (-850.9714, 384.2445, 1373.567)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav16 ]
  }
  {
    Position = (-949.6003, 384.2445, 1422.333)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav17 ]
  }
  {
    Position = (-956.4954, 384.2445, 1492.584)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav18 ]
  }
  {
    Position = (-853.7844, 384.2445, 1589.678)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav10 ]
  }
  {
    Position = (-744.7874, 384.2445, 1646.224)
    Angles = (0, -3.14159, 0)
    name = TRG_CatchGorillaLoose
    Class = Pedestrian
    type = Anl_Gorilla
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 0
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_GorillaNav10 ]
    TriggerScript = TRG_CatchGorillaLooseScript
  }
  {
    Position = (-872.1299, 384.2445, 1534.155)
    Angles = (0, -1.88496, 0)
    name = TRG_CatchGorillaPODLeft
    Class = Pedestrian
    type = Anl_Gorilla
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 0
    lod_dist1 = 300
    lod_dist2 = 400
    TriggerScript = TRG_CatchGorillaPODLeftScript
  }
  {
    Position = (-859.8521, 384.2445, 1427.211)
    Angles = (0, -1.88496, 0)
    name = TRG_CatchGorillaPODRight
    Class = Pedestrian
    type = Anl_Gorilla
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 0
    lod_dist1 = 300
    lod_dist2 = 400
    TriggerScript = TRG_CatchGorillaPODRightScript
  }
  {
    Position = (-714.1738, -32.22476, 1566.815)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav20 ]
  }
  {
    Position = (-609.4899, -32.22476, 1541.667)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav21 ]
  }
  {
    Position = (-560.9262, -32.22476, 1489.409)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav22 ]
  }
  {
    Position = (-590.4865, -32.22476, 1416.497)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav23 ]
  }
  {
    Position = (-677.2407, -32.22476, 1402.164)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav24 ]
  }
  {
    Position = (-790.4551, -32.22476, 1411.626)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav24
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav25 ]
  }
  {
    Position = (-839.8165, -32.22476, 1437.114)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav25
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav26 ]
  }
  {
    Position = (-845.9677, -32.22476, 1490.752)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav26
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav27 ]
  }
  {
    Position = (-797.3496, -32.22476, 1541.065)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaNav27
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GorillaNav19 ]
  }
  {
    Position = (-744.7734, -32.22476, 1580.942)
    Angles = (0, -3.14159, 0)
    name = TRG_GorillaCaught
    Class = Pedestrian
    type = Anl_Gorilla
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_GorillaNav19 ]
    TriggerScript = TRG_GorillaCaughtScript
  }
  {
    Position = (4125.271, -177.5051, 728.6093)
    Angles = (0, -1.91114, 0)
    name = TRG_monkey_01
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_01Script
  }
  {
    Position = (3919.845, -117.0406, 1644.388)
    Angles = (0, -0.84649, 0)
    name = TRG_monkey_02
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_02Script
  }
  {
    Position = (3706.474, -154.3965, -104.0604)
    Angles = (0, -2.34747, 0)
    name = TRG_monkey_03
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_03Script
  }
  {
    Position = (2384.722, -153.7341, -134.8444)
    Angles = (0, 2.15548, 0)
    name = TRG_monkey_04
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_04Script
  }
  {
    Position = (1997.695, -105.2396, 284.1286)
    Angles = (0, 2.15548, 0)
    name = TRG_monkey_05
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_05Script
  }
  {
    Position = (3567.035, -223.947, 1823.352)
    Angles = (0, -0.84649, 0)
    name = TRG_monkey_06
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_MonkeyNav01 ]
    TriggerScript = TRG_monkey_06Script
  }
  {
    Position = (3673.979, -223.947, 1804.963)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav02 ]
  }
  {
    Position = (3796.209, -223.947, 1693.82)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav03 ]
  }
  {
    Position = (4123.466, -223.947, 1406.972)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav04 ]
  }
  {
    Position = (4169.408, -223.947, 1429.772)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav05 ]
  }
  {
    Position = (4111.457, -223.947, 1515.713)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav06 ]
  }
  {
    Position = (3842.242, -223.947, 1777.84)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav07 ]
  }
  {
    Position = (3693.691, -223.947, 1832.446)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav01 ]
  }
  {
    Position = (4258.28, -223.947, 1250.365)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav09 ]
  }
  {
    Position = (4240.992, -223.947, 962.3884)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav10 ]
  }
  {
    Position = (4231.756, -223.947, 406.8624)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav11 ]
  }
  {
    Position = (4321.744, -223.947, 307.1215)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav12 ]
  }
  {
    Position = (4443.071, -223.947, 421.694)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav13 ]
  }
  {
    Position = (4459.557, -223.947, 1210.01)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav14 ]
  }
  {
    Position = (4364.263, -223.947, 1330.908)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav08 ]
  }
  {
    Position = (4239.765, -223.947, 1344.494)
    Angles = (0, -0.84649, 0)
    name = TRG_monkey_07
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_MonkeyNav08 ]
    TriggerScript = TRG_monkey_07Script
  }
  {
    Position = (2777.102, -223.947, -498.8346)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav16 ]
  }
  {
    Position = (3374.782, -223.947, -480.9015)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav17 ]
  }
  {
    Position = (3467.316, -223.947, -437.9976)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav18 ]
  }
  {
    Position = (3443.387, -223.947, -355.2664)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav19 ]
  }
  {
    Position = (3048.215, -223.947, -301.7307)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav20 ]
  }
  {
    Position = (2664.776, -223.947, -333.6364)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav21 ]
  }
  {
    Position = (2540.278, -223.947, -320.0505)
    Angles = (0, -0.84649, 0)
    name = TRG_monkey_08
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_MonkeyNav21 ]
    TriggerScript = TRG_monkey_08Script
  }
  {
    Position = (2558.794, -223.947, -414.1793)
    Angles = (0, -0.84649, 0)
    name = TRG_MonkeyNav21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_MonkeyNav15 ]
  }
  {
    Position = (2907.074, -156.537, -271.1493)
    Angles = (0, -2.9147, 0)
    name = TRG_monkey_09
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_09Script
  }
  {
    Position = (3086.998, -137.3157, 1968.998)
    Angles = (0, -0.23562, 0)
    name = TRG_monkey_10
    Class = Pedestrian
    type = Anl_Monkey
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_monkey_10Script
  }
  {
    Position = (2260.55, -242.2753, 7286.08)
    Angles = (0, 0, 0)
    name = TRG_971
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench07
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (1992.327, -255.0432, 7323.868)
    Angles = (0, 0, 0)
    name = TRG_972
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_58 ]
  }
  {
    Position = (-2447.615, -2190.429, 3065.27)
    Angles = (0, -0.67195, 0)
    name = Zoo_HippoLovinTree01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-100.457, -2052.64, 5051.258)
    Angles = (0, -0.67195, 0)
    name = Zoo_HippoLovinTree02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (348.0215, -2360.802, 4162.923)
    Angles = (-0.13963, -1.59698, 0)
    name = TRG_Hippo07
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Hippo07Script
  }
  {
    Position = (401.7305, -2306.173, 4146.026)
    Angles = (-0.81141, -1.35567, -0.0163)
    name = TRG_Hippo08
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Hippo08Script
  }
  {
    Position = (99.24963, -256.0491, 5576.255)
    Angles = (0, 0, 0)
    name = TRGP_HippoLovin01
    Class = LevelGeometry
    AbsentInNetGames
    TriggerScript = TRGP_HippoLovin01Script
  }
  {
    Position = (471.9023, -2280.468, 3832.57)
    Angles = (1.5708, 0.28798, 0)
    name = HippoLovinLense
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3965.223, -123.2736, 763.2688)
    Angles = (1.5708, 1.5708, 0)
    name = Zoo_Poop01
    Class = LevelObject
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = Zoo_Poop01Script
  }
  {
    Position = (2856.733, -123.2736, -128.9436)
    Angles = (1.5708, 0, 0)
    name = Zoo_Poop02
    Class = LevelObject
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = Zoo_Poop02Script
  }
  {
    Position = (3518.652, -292.5959, 6612.37)
    Angles = (0, 0, 0)
    name = Sk3Ed_P_10x10x18
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    CollisionMode = Geometry
  }
  {
    Position = (3471.416, -172.4886, 6756.208)
    Angles = (0, 0, 0)
    name = zoo_hj_buildWall
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    CollisionMode = Geometry
  }
  {
    Position = (3474.336, -172.4886, 6753.727)
    Angles = (0, 0, 0)
    name = zoo_hj_buildWall01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    CollisionMode = Geometry
  }
  {
    Position = (-925.1729, -197.608, 5619.578)
    Angles = (0, 0, 0)
    name = TRG_973
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_176 ]
  }
  {
    Position = (-16.31531, -197.608, 5619.246)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap09
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap02 ]
  }
  {
    Position = (-842.1008, -185.6542, 5624.39)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap01
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_973 ]
  }
  {
    Position = (-99.38745, -185.6542, 5623.108)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap02
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap06 ]
  }
  {
    Position = (5113.971, -222.7281, 6837.747)
    Angles = (0, 0, 0)
    name = Elephant_Fullpipe
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    CollisionMode = Geometry
  }
  {
    Position = (4100.1, -295.0544, 6481.717)
    Angles = (0, 0, 0)
    name = Sk3Ed_QPd_10x10x134
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    CollisionMode = Geometry
  }
  {
    Position = (4355.472, -295.9818, 6657.01)
    Angles = (0, 0, 0)
    name = Sk3Ed_QPd_10x10x139
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    CollisionMode = Geometry
  }
  {
    Position = (-4250.535, -226.0045, 3411.555)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar04 ]
  }
  {
    Position = (-4250.537, -226.0045, 2854.727)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar05 ]
  }
  {
    Position = (-4338.652, -226.0044, 2766.614)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar05
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar06 ]
  }
  {
    Position = (-4672.159, -226.0044, 2766.612)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar07 ]
  }
  {
    Position = (-4760.271, -226.0045, 2854.727)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailGrindBar08 ]
  }
  {
    Position = (-4760.27, -226.0045, 3411.555)
    Angles = (0, 0, 0)
    name = TRG_RailGrindBar08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-3426.93, -471.8727, 4910.594)
    Angles = (0, 0, 0)
    name = InvisoRailCollide
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3426.93, -471.8727, 4458.882)
    Angles = (0, 0, 0)
    name = InvisoRailCollide02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4855.907, -137.847, 4195.984)
    Angles = (0, -3.14159, 0)
    name = TRG_975
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign03
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (4721.452, -137.847, 4195.984)
    Angles = (0, -3.14159, 0)
    name = TRG_976
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign03
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_975 ]
  }
  {
    Position = (536.8698, -192.9304, 5617.998)
    Angles = (0, 0, 0)
    name = TRG_977
    Class = RailNode
    type = Wood
    CreatedAtStart
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_978 ]
  }
  {
    Position = (402.415, -192.9304, 5617.998)
    Angles = (0, 0, 0)
    name = TRG_978
    Class = RailNode
    type = Wood
    CreatedAtStart
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (475.9746, -2280.256, 3835.9)
    Angles = (0, 0, 0)
    name = Zoo_TelescopeCover
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (3228.788, -226.4518, 1643.964)
    Angles = (0, 2.94961, 0)
    name = TRG_Ped_Monkey_05
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Ped_Monkey_05Script
  }
  {
    Position = (3770.515, -226.4518, 567.8923)
    Angles = (0, 1.0821, 0)
    name = TRG_Ped_Monkey_03
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Ped_Monkey_03Script
  }
  {
    Position = (2241.654, -226.4518, 389.5716)
    Angles = (0, -1.24791, 0)
    name = TRG_Ped_Monkey_02
    Class = Pedestrian
    type = Ped_From_Profile_Baby
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_baby
    profile = ped_kid_balloon_a
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_Ped_Nav ]
    TriggerScript = TRG_Ped_Monkey_02Script
  }
  {
    Position = (1630.905, -254.4416, 6025.251)
    Angles = (0, 1.82387, 0)
    name = TRG_Ped_Hippo_03
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    lod_dist1 = 80
    lod_dist2 = 150
    Extra_Anims = animload_Ped_TP
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Hippo_03Script
  }
  {
    Position = (1013.908, -254.4416, 5905.232)
    Angles = (0, -2.1293, 0)
    name = TRG_Ped_Hippo_01
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Hippo_01Script
  }
  {
    Position = (2437.819, -226.4518, 559.6113)
    Angles = (0, 1.71042, 0)
    name = TRG_Ped_Generic13
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_PedNav01 ]
    TriggerScript = TRG_Ped_Generic13Script
  }
  {
    Position = (2438.482, -226.4518, 661.884)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav02 ]
  }
  {
    Position = (2545.266, -226.4518, 1205.401)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav03 ]
  }
  {
    Position = (3187.241, -226.4518, 1359.806)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav04 ]
  }
  {
    Position = (3571.952, -226.4518, 1053.606)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav05 ]
  }
  {
    Position = (3526.084, -226.4518, 627.1256)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav06 ]
  }
  {
    Position = (3004.803, -226.4518, 291.8662)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav01 ]
  }
  {
    Position = (-2168.976, -255.8922, 6282.341)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav08 ]
  }
  {
    Position = (-2154.306, -255.8922, 6899.942)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav09 ]
  }
  {
    Position = (-2008.819, -255.8922, 7019.23)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav10 ]
  }
  {
    Position = (-1886.601, -255.8922, 6714.897)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav11 ]
  }
  {
    Position = (-1882.354, -255.8922, 6224.53)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav12 ]
  }
  {
    Position = (-2021.084, -255.8922, 6039.395)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav07 ]
  }
  {
    Position = (-2201.841, -255.8922, 6180.068)
    Angles = (0, 1.71042, 0)
    name = TRG_Ped_Generic14
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Links = [ TRG_PedNav07 ]
    TriggerScript = TRG_Ped_Generic14Script
  }
  {
    Position = (14.16664, -147.9434, 2246.704)
    Angles = (0, 1.71042, 0)
    name = TRG_Ped_Generic15
    Class = Pedestrian
    type = Ped_From_Profile_Stroller
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_st
    profile = ped_stroller_a
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_PedNav13 ]
    TriggerScript = TRG_Ped_Generic15Script
  }
  {
    Position = (14.83046, -161.9897, 2348.977)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav19 ]
  }
  {
    Position = (-85.45142, -239.3414, 3017.467)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav15 ]
  }
  {
    Position = (136.5929, -247.5894, 3157.078)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav16 ]
  }
  {
    Position = (299.3158, -247.5894, 3111.189)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav17 ]
  }
  {
    Position = (322.9948, -197.1163, 2596.54)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav18 ]
  }
  {
    Position = (235.3185, -160.8192, 2325.553)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav13 ]
  }
  {
    Position = (-405.2195, -35.61148, 1467.55)
    Angles = (0, -1.62316, 0)
    name = TRG_Ped_Generic19
    Class = Pedestrian
    type = Ped_From_Profile
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = random_male_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Generic19Script
  }
  {
    Position = (2777.959, -338.7472, 6473.818)
    Angles = (0, 1.5708, 0)
    name = TRG_RhinoDown01
    Class = Pedestrian
    type = Anl_Rhino
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    SuspendDistance = 0
    TriggerScript = TRG_RhinoDown01Script
  }
  {
    Position = (2860.705, -336.7965, 6465.071)
    Angles = (0, -1.5708, 0)
    name = TRG_RhinoDown02
    Class = Pedestrian
    type = Anl_Rhino
    AbsentInNetGames
    SkeletonName = rhino
    AnimName = animload_anl_rhino
    model = "animals\anl_rhino\anl_rhino.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    SuspendDistance = 0
    TriggerScript = TRG_RhinoDown02Script
  }
  {
    Position = (2820.177, -362.1607, 6515.487)
    Angles = (0, 0, 0)
    name = TRG_RhinoManager
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_RhinoManagerScript
  }
  {
    Position = (-329.7382, -255.9884, 4237.014)
    Angles = (0, 0, 0)
    name = TRG_TramNav01
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_Accel01
    Links = [ TRG_TramNav02 ]
  }
  {
    Position = (649.236, -255.9884, 4258.581)
    Angles = (0, 0, 0)
    name = TRG_TramNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav03 ]
  }
  {
    Position = (1386.551, -255.9884, 4304.039)
    Angles = (0, 0, 0)
    name = TRG_TramNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav23 ]
  }
  {
    Position = (1561.704, -255.9884, 5678.712)
    Angles = (0, 0, 0)
    name = TRG_TramNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav28 ]
  }
  {
    Position = (2176.617, -255.9884, 5423.042)
    Angles = (0, 0, 0)
    name = TRG_TramNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav06 ]
  }
  {
    Position = (2938.278, -255.9884, 5030.203)
    Angles = (0, 0, 0)
    name = TRG_TramNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav07 ]
  }
  {
    Position = (3655.38, -255.9884, 4408.813)
    Angles = (0, 0, 0)
    name = TRG_TramNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav08 ]
  }
  {
    Position = (4743.437, -255.9884, 4311.635)
    Angles = (0, 0, 0)
    name = TRG_TramNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav09 ]
  }
  {
    Position = (5619.306, -255.9884, 4557.576)
    Angles = (0, 0, 0)
    name = TRG_TramNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav10 ]
  }
  {
    Position = (5810.1, -255.9884, 4895.567)
    Angles = (0, 0, 0)
    name = TRG_TramNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav29 ]
  }
  {
    Position = (5664.322, -255.9884, 5463.882)
    Angles = (0, 0, 0)
    name = TRG_TramNav11
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_DecelForTurn01
    Links = [ TRG_TramNav12 ]
  }
  {
    Position = (5426.471, -255.9884, 5305.81)
    Angles = (0, 0, 0)
    name = TRG_TramNav12
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_Accel01
    Links = [ TRG_TramNav13 ]
  }
  {
    Position = (5342.838, -255.9884, 4798.415)
    Angles = (0, 0, 0)
    name = TRG_TramNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav14 ]
  }
  {
    Position = (4798.084, -255.9884, 4377.747)
    Angles = (0, 0, 0)
    name = TRG_TramNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav15 ]
  }
  {
    Position = (3748.281, -255.9884, 4340.271)
    Angles = (0, 0, 0)
    name = TRG_TramNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav16 ]
  }
  {
    Position = (3042.535, -255.9884, 4896.453)
    Angles = (0, 0, 0)
    name = TRG_TramNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav17 ]
  }
  {
    Position = (2465.898, -255.9884, 4739.792)
    Angles = (0, 0, 0)
    name = TRG_TramNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav18 ]
  }
  {
    Position = (1683.912, -255.9884, 4067.37)
    Angles = (0, 0, 0)
    name = TRG_TramNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav19 ]
  }
  {
    Position = (764.933, -255.9884, 3764.866)
    Angles = (0, 0, 0)
    name = TRG_TramNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav20 ]
  }
  {
    Position = (42.78613, -255.9884, 3509.466)
    Angles = (0, 0, 0)
    name = TRG_TramNav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav21 ]
  }
  {
    Position = (-944.3808, -255.9884, 3582.905)
    Angles = (0, 0, 0)
    name = TRG_TramNav21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav22 ]
  }
  {
    Position = (-1113.568, -255.9884, 4008.29)
    Angles = (0, 0, 0)
    name = TRG_TramNav22
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_DecelForTurn01
    Links = [ TRG_TramNav27 ]
  }
  {
    Position = (1351.536, -255.9884, 5855.503)
    Angles = (0, 0, 0)
    name = TRG_Tram
    Class = Vehicle
    type = Tram
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    model = "levels\zoo\veh_zootram\veh_zootram.mdl"
    SkeletonName = car
    SuspendDistance = 0
    lod_dist1 = 300
    lod_dist2 = 350
    Links = [ TRG_TramNav04 ]
    TriggerScript = TRG_TramScript
  }
  {
    Position = (2525.783, -338.796, 6285.944)
    Angles = (0, 3.14159, 0)
    name = TRG_SkaterWait01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "RhinoBet"
  }
  {
    Position = (2473.123, -338.7472, 6341.978)
    Angles = (0, 0, 0)
    name = TRG_Rhino_Keeper
    Class = Pedestrian
    type = Ped_ZooKeeper
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zookeeper\ped_zookeeper.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Rhino_KeeperScript
  }
  {
    Position = (6243.064, -255.6744, 4928.209)
    Angles = (0, 0, 0)
    name = TRGP_LionKill
    Class = LevelGeometry
    CollisionMode = Geometry
    Links = [ TRG_RestartNodeLions ]
    TriggerScript = TRGP_LionKillScript
  }
  {
    Position = (-2445.986, 290.528, 1282.44)
    Angles = (0, 0, 0)
    name = Zoo_BreakawayCage
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_BreakawayCageScript
  }
  {
    Position = (83.37555, 252.0654, -1476.104)
    Angles = (1.5708, 0, 0)
    name = TRGP_LeavingArea
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (83.37555, 252.0654, -1955.426)
    Angles = (1.5708, 0, 0)
    name = TRGP_LeavingArea02
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart01 ]
    TriggerScript = TRGP_Teleport02Script
  }
  {
    Position = (5159.331, -255.9883, 5787.614)
    Angles = (0, -0.48869, 0)
    name = TRG_G_HORSE_Pro
    Class = Pedestrian
    type = PedPro_Burnquist
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_burnquist_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Burnquist
  }
  {
    Position = (5265.916, -255.9883, 5528.924)
    Angles = (0, 2.27766, 0)
    name = TRG_G_HORSE_Spot01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Horse Spot01"
  }
  {
    Position = (4286.901, -22.34921, 4826.764)
    Angles = (0, -1.5708, 0)
    name = TRG_G_HORSE_Spot02
    Class = Restart
    type = Horse
    CreatedAtStart
    RestartName = "Horse Spot01"
    restart_types = [ Horse ]
  }
  {
    Position = (1921.332, 110.8136, 565.2847)
    Angles = (0, -3.14159, 0)
    name = TRG_G_HORSE_Spot03
    Class = Restart
    type = Horse
    CreatedAtStart
    RestartName = "Horse Spot01"
    restart_types = [ Horse ]
  }
  {
    Position = (-1582.057, -289.5202, 7121.027)
    Angles = (0, 0.96866, 0)
    name = TRG_FloatingLog02
    Class = Vehicle
    CreatedAtStart
    AbsentInNetGames
    model = "levels\zoo\zoo_log\Zoo_Log.mdl"
    lod_dist1 = 500
    CollisionMode = Geometry
    TriggerScript = TRG_FloatingLog02Script
  }
  {
    Position = (-1473.085, -289.3573, 7562.82)
    Angles = (0, 2.10312, 0)
    name = TRG_FloatingLog03
    Class = Vehicle
    CreatedAtStart
    AbsentInNetGames
    model = "levels\zoo\zoo_log\Zoo_Log.mdl"
    lod_dist1 = 500
    CollisionMode = Geometry
    TriggerScript = TRG_FloatingLog03Script
  }
  {
    Position = (526.2157, -350.0316, 6279.645)
    Angles = (0, 0.15708, 0)
    name = Zoo_HippoCollision01
    Class = LevelGeometry
    type = 0
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = none
    TriggerScript = Zoo_HippoCollision01Script
  }
  {
    Position = (858.2628, -289.3573, 7370.459)
    Angles = (0, 0.84649, 0)
    name = TRG_FloatingLog08
    Class = Vehicle
    CreatedAtStart
    AbsentInNetGames
    model = "levels\zoo\zoo_log\Zoo_Log.mdl"
    lod_dist1 = 500
    CollisionMode = Geometry
    TriggerScript = TRG_FloatingLog08Script
  }
  {
    Position = (733.8954, -350.0316, 6030.688)
    Angles = (0, 0.15708, 0)
    name = Zoo_HippoCollision04
    Class = LevelGeometry
    type = 0
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = none
    TriggerScript = Zoo_HippoCollision04Script
  }
  {
    Position = (722.3822, -296.7343, 6034.08)
    Angles = (0, 0.94248, 0)
    name = TRG_Hippo_04
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Hippo_04Script
  }
  {
    Position = (585.7676, -289.3573, 7612.379)
    Angles = (0, 0.84649, 0)
    name = TRG_FloatingLog09
    Class = Vehicle
    CreatedAtStart
    AbsentInNetGames
    model = "levels\zoo\zoo_log\Zoo_Log.mdl"
    lod_dist1 = 500
    CollisionMode = Geometry
    TriggerScript = TRG_FloatingLog09Script
  }
  {
    Position = (311.2084, -289.3573, 7856.272)
    Angles = (0, 0.84649, 0)
    name = TRG_FloatingLog10
    Class = Vehicle
    CreatedAtStart
    AbsentInNetGames
    model = "levels\zoo\zoo_log\Zoo_Log.mdl"
    lod_dist1 = 500
    CollisionMode = Geometry
    TriggerScript = TRG_FloatingLog10Script
  }
  {
    Position = (-1189.809, -289.3573, 7777.893)
    Angles = (0, 2.34747, 0)
    name = TRG_FloatingLog11
    Class = Vehicle
    CreatedAtStart
    AbsentInNetGames
    model = "levels\zoo\zoo_log\Zoo_Log.mdl"
    lod_dist1 = 500
    CollisionMode = Geometry
    TriggerScript = TRG_FloatingLog11Script
  }
  {
    Position = (-1799.998, -255.9883, 7560.006)
    Angles = (0, 0, 0)
    name = TRG_979
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1077 ]
  }
  {
    Position = (4248.219, -335.3365, 6356.164)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Collision
    Class = Vehicle
    type = Veh_Elephant_Collision
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    model = "levels\zoo\veh_elephant_collision\veh_elephant_collision.mdl"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_Elephant_Nav03 ]
    TriggerScript = TRG_Elephant_CollisionScript
  }
  {
    Position = (4798.612, -374.2001, 7249.687)
    Angles = (-0.43633, -1.5708, 0)
    name = TRG_ElephantCollision02
    Class = Vehicle
    type = Zoo_Elephant_Collision
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    model = "levels\zoo\zoo_elephant_collision\zoo_elephant_collision.mdl"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
  }
  {
    Position = (5669.371, -259.0969, 5699.008)
    Angles = (0, 0, 0)
    name = zoo_weed01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2797.172, -397.7194, 6473.539)
    Angles = (0, 1.5708, 0)
    name = TRG_RhinoStopCollision01
    Class = Vehicle
    type = Zoo_Elephant_Collision
    AbsentInNetGames
    CollisionMode = Geometry
    model = "levels\zoo\zoo_elephant_collision\zoo_elephant_collision.mdl"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
  }
  {
    Position = (2845.031, -392.0999, 6464.744)
    Angles = (0, -1.5708, 0)
    name = TRG_RhinoStopCollision02
    Class = Vehicle
    type = Zoo_Elephant_Collision
    AbsentInNetGames
    CollisionMode = Geometry
    model = "levels\zoo\zoo_elephant_collision\zoo_elephant_collision.mdl"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
  }
  {
    Position = (-0.85756, -248.845, 3925.511)
    Angles = (0, -0.97738, 0)
    name = Inviso_SealCollide01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (119.1047, -278.8137, 3949.83)
    Angles = (0, 0, 0)
    name = Inviso_SealCollide02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5566.432, 140.3344, 4898.735)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_LoseGoalHighCombo2
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_LoseGoalHighCombo2Script
  }
  {
    Position = (5674.371, -248.994, 4634.742)
    Angles = (0, 1.5708, 0)
    name = TRG_RestartNodeLions
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: Lion"
  }
  {
    Position = (-1187.079, 102.4398, 1748.64)
    Angles = (0, -1.5708, 0)
    name = TRG_G_TS2_PhotoGuy
    Class = Pedestrian
    type = Ped_ZooKeeper
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zookeeper\ped_zookeeper.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_G_TS2_PhotoGuyScript
  }
  {
    Position = (-1366.866, 102.4398, 1945.414)
    Angles = (0, 1.5708, 0)
    name = TRG_G_TS2_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: SKATE"
  }
  {
    Position = (-5115.324, 0, 2316.482)
    Angles = (0, 0, 0)
    name = TRG_GorillaManager
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_GorillaManagerScript
  }
  {
    Position = (-2776.703, -171.821, 528.4149)
    Angles = (0, -1.5708, 0)
    name = TRG_MG_KaboomNav01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Kaboom"
  }
  {
    Position = (-2834.956, 164.0974, 530.3181)
    Angles = (0, 1.5708, 0)
    name = TRG_Bird01
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird01Script
  }
  {
    Position = (-2834.956, 164.0974, 684.215)
    Angles = (0, 1.5708, 0)
    name = TRG_Bird02
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird02Script
  }
  {
    Position = (-2834.956, 164.0974, 378.8058)
    Angles = (0, 1.5708, 0)
    name = TRG_Bird03
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird03Script
  }
  {
    Position = (-5115.324, 0, 1858.123)
    Angles = (0, 0, 0)
    name = TRG_Kaboom_EggCreator
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Kaboom_EggCreatorScript
  }
  {
    Position = (-2598.665, -139.9894, 545.5818)
    Angles = (0, 0, 0)
    name = TRG_EggMoney01
    Class = GameObject
    type = Goal_Money
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_EggMoney01Script
  }
  {
    Position = (-2699.751, -139.9894, 415.993)
    Angles = (0, 0, 0)
    name = TRG_EggMoney02
    Class = GameObject
    type = Goal_Money
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_EggMoney02Script
  }
  {
    Position = (-2699.751, -139.9894, 675.0171)
    Angles = (0, 0, 0)
    name = TRG_EggMoney03
    Class = GameObject
    type = Goal_Money
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_EggMoney03Script
  }
  {
    Position = (3785.601, -266.2409, 4120.118)
    Angles = (0, 1.5708, 0)
    name = ZRock18
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3714.557, -206.4401, 4036.7)
    Angles = (0, 1.5708, 0)
    name = ZRock19
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (7560.036, -125.1626, 3070.406)
    Angles = (0, 0, 0)
    name = zoo_hj_ParkingLotLight02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6360.036, -125.1626, 3070.406)
    Angles = (0, 0, 0)
    name = zoo_hj_ParkingLotLight03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6360.036, -125.1626, 2006.557)
    Angles = (0, 0, 0)
    name = zoo_hj_ParkingLotLight06
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (7560.036, -125.1626, 2006.557)
    Angles = (0, 0, 0)
    name = zoo_hj_ParkingLotLight07
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-87.57497, -27.05611, 4803.846)
    Angles = (0, 0, 0)
    name = TRG_G_JUDGE_COMP
    Class = Pedestrian
    type = Ped_Judge
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_judge\ped_judge.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Extra_Anims = animload_Ped_Judge
    TriggerScript = TRG_G_JUDGE_COMPScript
  }
  {
    Position = (3001.949, 256.9738, 838.5011)
    Angles = (0, 0, 0)
    name = Zoo_MonkeySupport
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3001.949, 170.6812, 838.5022)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyRoof01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyRoof01
    CollisionMode = Geometry
  }
  {
    Position = (229.4015, -35.82083, -360.0004)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny
    Class = Pedestrian
    type = Ped_Mascot
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_ZM
    model = "levels\zoo\ped_mascot\ped_mascot.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_KennyScript
  }
  {
    Position = (1572.703, -255.9884, 4597.99)
    Angles = (0, 0, 0)
    name = TRG_TramNav23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav24 ]
  }
  {
    Position = (1409.599, -255.9884, 5027.224)
    Angles = (0, 0, 0)
    name = TRG_TramNav24
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav25 ]
  }
  {
    Position = (1253.426, -255.9884, 5373.398)
    Angles = (0, 0, 0)
    name = TRG_TramNav25
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav26 ]
  }
  {
    Position = (1276.804, -255.9884, 5661.967)
    Angles = (0, 0, 0)
    name = TRG_TramNav26
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_DecelForTurn01
    Links = [ TRG_TramNav04 ]
  }
  {
    Position = (5102.365, -255.9883, 5620.511)
    Angles = (0, 2.27766, 0)
    name = TRG_G_HORSE_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Horse Restart"
  }
  {
    Position = (229.4015, -35.82083, -360.0004)
    Angles = (0, 0, 0)
    name = TRG_Kenny_Collision
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Kenny_CollisionScript
  }
  {
    Position = (229.5313, 6.20128, -363.0115)
    Angles = (0, 0, 0)
    name = Zoo_Kenny_Collision
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = Zoo_Kenny_CollisionScript
  }
  {
    Position = (225.703, -35.82083, -355.2097)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Heelflip
    Class = Pedestrian
    type = Ped_Mascot
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_ZM
    model = "levels\zoo\ped_mascot\ped_mascot.skin"
    SuspendDistance = 10000
    lod_dist1 = 349
    lod_dist2 = 350
    Links = [ TRG_Ped_Kenny_Nav01 ]
    TriggerScript = TRG_Ped_Kenny_HeelflipScript
  }
  {
    Position = (327.8587, -35.82083, -137.5257)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav02 ]
  }
  {
    Position = (337.5632, -35.82083, 572.7172)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav03 ]
  }
  {
    Position = (38.22025, -35.82083, 759.686)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav04 ]
  }
  {
    Position = (130.7477, -35.82083, 1110.144)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav05 ]
  }
  {
    Position = (371.9399, -35.82083, 1217.647)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav06 ]
  }
  {
    Position = (373.8796, -35.82083, 1448.41)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav07 ]
  }
  {
    Position = (38.71851, -58.4326, 1680.677)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav08 ]
  }
  {
    Position = (366.807, -109.2849, 2035.05)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav09 ]
  }
  {
    Position = (303.1896, -173.3211, 2442.914)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav10 ]
  }
  {
    Position = (29.31989, -186.505, 2546.652)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav11 ]
  }
  {
    Position = (-116.4774, -139.4196, 2208.296)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav12 ]
  }
  {
    Position = (46.69836, -92.33411, 1918.382)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav13 ]
  }
  {
    Position = (301.9554, -109.2849, 2063.492)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav14 ]
  }
  {
    Position = (254.7433, -157.946, 2327.272)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav15 ]
  }
  {
    Position = (-97.86499, -202.1423, 2645.726)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav16 ]
  }
  {
    Position = (263.4351, -224.246, 2821.452)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav17 ]
  }
  {
    Position = (401.5356, -241.6695, 3122.089)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav18 ]
  }
  {
    Position = (19.2005, -248.612, 3405.833)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav19 ]
  }
  {
    Position = (-345.0345, -248.612, 3561.675)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav20 ]
  }
  {
    Position = (-538.7693, -248.612, 3976.489)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav21 ]
  }
  {
    Position = (-272.0129, -248.612, 4270.281)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav22 ]
  }
  {
    Position = (125.4724, -248.612, 4340.556)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav23 ]
  }
  {
    Position = (536.7082, -248.612, 4244.31)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav24 ]
  }
  {
    Position = (763.4014, -248.612, 3879.12)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav24
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav25 ]
  }
  {
    Position = (547.2726, -248.612, 3574.684)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav25
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav26 ]
  }
  {
    Position = (-103.2835, -241.6695, 3163.612)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav26
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav27 ]
  }
  {
    Position = (-77.17944, -224.246, 2833.289)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Nav27
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Ped_Kenny_Nav10 ]
  }
  {
    Position = (-2323.336, -2575.098, 2152.011)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_ZooKeeper
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "P1: Restart"
    restart_types = [ Player1 ]
  }
  {
    Position = (4380.297, -132.584, 3357.452)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_TeleportZookeeper
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    TriggerScript = TRGP_TeleportZookeeperScript
  }
  {
    Position = (4382.352, -259.2882, 3439.007)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_Giraffe
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Giraffe"
  }
  {
    Position = (-2333.767, -2458.61, 2125.956)
    Angles = (1.5708, 3.14159, 0)
    name = TRGP_TeleportZookeeper01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_TeleportZookeeper01Script
  }
  {
    Position = (-2323.336, -2575.098, 2600.168)
    Angles = (0, -3.14159, 0)
    name = TRG_MG_InvadersNav01
    Class = Restart
    type = Player1
    CreatedAtStart
    RestartName = "Invaders"
    restart_types = [ Player1 ]
  }
  {
    Position = (-2106.212, -2582.335, 3202.52)
    Angles = (0, 0, 0)
    name = TRG_Invader_Monkey01
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Links = [ TRG_InvaderNav01 ]
    TriggerScript = TRG_Invader_Monkey01Script
  }
  {
    Position = (-2259.037, -2582.335, 3088.987)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav02 ]
  }
  {
    Position = (-2441.312, -2582.335, 3060.219)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav02
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie01 }
    Links = [ TRG_InvaderNav03 ]
  }
  {
    Position = (-2507.186, -2582.335, 2879.526)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav04 ]
  }
  {
    Position = (-2437.111, -2582.335, 2742.02)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav05 ]
  }
  {
    Position = (-2263.413, -2582.335, 2695.907)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav06 ]
  }
  {
    Position = (-2114.925, -2582.335, 2855.472)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav08 ]
  }
  {
    Position = (4113.912, -29.50734, 5069.312)
    Angles = (0, 0, 0)
    name = TRG_980
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_360 ]
  }
  {
    Position = (4113.583, -29.50734, 4762.716)
    Angles = (0, 0, 0)
    name = TRG_981
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_364 ]
  }
  {
    Position = (-2450.158, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav01
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (-2316.377, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav02
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (-2186.29, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav03
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (-2154.5, -2582.335, 3007.862)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav08
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie02 }
    Links = [ TRG_InvaderNav01 ]
  }
  {
    Position = (-2323.159, -2582.335, 3070.316)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav09
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie03 }
    Links = [ TRG_InvaderNav10 ]
  }
  {
    Position = (-2215.056, -2582.335, 3032.744)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav10
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie04 }
    Links = [ TRG_InvaderNav12 ]
  }
  {
    Position = (-2462.379, -2582.335, 2995.675)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav11
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie05 }
    Links = [ TRG_InvaderNav09 ]
  }
  {
    Position = (-2190.816, -2582.335, 2926.276)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav13 ]
  }
  {
    Position = (-2251.75, -2582.335, 2814.579)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav14 ]
  }
  {
    Position = (-2345.98, -2582.335, 2800.23)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav15 ]
  }
  {
    Position = (-2448.814, -2582.335, 2885.979)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav11 ]
  }
  {
    Position = (-2522.406, -2582.335, 3198.262)
    Angles = (0, 0, 0)
    name = TRG_Invader_Monkey02
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Links = [ TRG_InvaderNav09 ]
    TriggerScript = TRG_Invader_Monkey02Script
  }
  {
    Position = (-2382.98, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav04
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (-2253.569, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav05
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (-2444.832, -2582.335, 3164.036)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav16
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie06 }
    Links = [ TRG_InvaderNav17 ]
  }
  {
    Position = (-2328.093, -2582.335, 3164.036)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav17
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie07 }
    Links = [ TRG_InvaderNav18 ]
  }
  {
    Position = (-2224.892, -2582.335, 3164.036)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav18
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie08 }
    Links = [ TRG_InvaderNav23 ]
  }
  {
    Position = (-2424.17, -2582.335, 3124.77)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav19
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie11 }
    Links = [ TRG_InvaderNav22 ]
  }
  {
    Position = (-2307.43, -2582.335, 3124.77)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav20
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie09 }
    Links = [ TRG_InvaderNav19 ]
  }
  {
    Position = (-2204.229, -2582.335, 3124.77)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav21
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling params = { PoopNode = TRG_poopie10 }
    Links = [ TRG_InvaderNav20 ]
  }
  {
    Position = (-2473.334, -2582.335, 3136.163)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav16 ]
  }
  {
    Position = (-2171.678, -2582.335, 3148.574)
    Angles = (0, 0, 0)
    name = TRG_InvaderNav23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_InvaderNav21 ]
  }
  {
    Position = (-2494.617, -2582.335, 3211.074)
    Angles = (0, 0, 0)
    name = TRG_Invader_Monkey03
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    Links = [ TRG_InvaderNav22 ]
    TriggerScript = TRG_Invader_Monkey03Script
  }
  {
    Position = (4741.524, -300.6646, 6255.673)
    Angles = (0, 0, 0)
    name = Zoo_ElephantRock
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4426.193, -10.80768, 4682.073)
    Angles = (0, 0, 0)
    name = proset7_Kicker03
    Class = LevelGeometry
    TrickObject
  }
  {
    Position = (-2318.052, -2582.459, 3246.125)
    Angles = (0, 0, 0)
    name = TRG_Poop_Controller
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poop_ControllerScript
  }
  {
    Position = (-2515.927, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav06
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (-2117.056, -2575.098, 2475.402)
    Angles = (0, 0, 0)
    name = TRG_PoopieNav07
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Zoo_Monkey_Stop_Fling poop = poopie01
  }
  {
    Position = (2480.379, -234.6871, 5007.477)
    Angles = (0, 0, 0)
    name = Zoo_PicnicDamage01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (3472.201, -216.0525, 4935.664)
    Angles = (0, 0, 0)
    name = Zoo_SnackBarRail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail01
    CollisionMode = Geometry
  }
  {
    Position = (4245.065, -215.5401, 4584.431)
    Angles = (0, 0, 0)
    name = Zoo_SnackBarRail03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail03
    CollisionMode = Geometry
  }
  {
    Position = (4245.065, -215.5401, 5248.454)
    Angles = (0, 0, 0)
    name = Zoo_SnackBarRail02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBarRail02
    CollisionMode = Geometry
  }
  {
    Position = (4245.065, -214.4987, 4584.431)
    Angles = (0, 0, 0)
    name = SnackRail_Shadow
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4052.6, -189.5763, 4931.679)
    Angles = (0, 0, 0)
    name = Zoo_SnackBars
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_SnackBar
    CollisionMode = Geometry
    TriggerScript = Zoo_SnackBarsScript
  }
  {
    Position = (5479.021, -269.0508, 4197.712)
    Angles = (0, 0, 0)
    name = TRG_G_RACE_RaceNav01
    Class = GameObject
    type = Combo_B
    AbsentInNetGames
    model = "stat_point"
    lod_dist1 = 400
    lod_dist2 = 401
    SuspendDistance = 0
  }
  {
    Position = (2264.187, -225.6538, 669.0532)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_Monkey
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_Race_MonkeyNav01 ]
    TriggerScript = TRG_Race_MonkeyScript
  }
  {
    Position = (2384.088, -221.3647, 1696.031)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav02 ]
  }
  {
    Position = (1813.016, -176.6755, 2729.023)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav03 ]
  }
  {
    Position = (1715.765, -249.7643, 3792.602)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav04 ]
  }
  {
    Position = (2448.252, -224.315, 4764.017)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav05 ]
  }
  {
    Position = (3265.972, -240.3302, 4849.45)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav06 ]
  }
  {
    Position = (3708.165, -240.3302, 4474.082)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav07 ]
  }
  {
    Position = (4518.435, -240.3302, 4351.125)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav08 ]
  }
  {
    Position = (5358.576, -240.3302, 4412.625)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav09 ]
  }
  {
    Position = (5467.044, -240.3302, 4589.176)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav10 ]
  }
  {
    Position = (5191.023, -240.3302, 4921.811)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav11 ]
  }
  {
    Position = (5019.209, -240.3302, 5458.694)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav12 ]
  }
  {
    Position = (4127.961, -240.3302, 5467.463)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav13 ]
  }
  {
    Position = (3383.347, -240.3302, 5205.685)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav14 ]
  }
  {
    Position = (2612.981, -224.315, 4844.958)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav15 ]
  }
  {
    Position = (2232.023, -224.315, 4544.246)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav16 ]
  }
  {
    Position = (1261.805, -224.315, 4115.011)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav17 ]
  }
  {
    Position = (645.0159, -224.315, 3663.392)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav18 ]
  }
  {
    Position = (201.1668, -224.315, 3115.342)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav19 ]
  }
  {
    Position = (296.3388, -157.1868, 2377.033)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav20 ]
  }
  {
    Position = (9.20783, -14.19115, 1466.134)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav21 ]
  }
  {
    Position = (235.993, -24.07423, 945.1061)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav22 ]
  }
  {
    Position = (288.8138, -24.07423, -18.12843)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_Race_MonkeyNav23 ]
  }
  {
    Position = (271.2952, -24.07423, -1529.79)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyNav23
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (194.5172, -50.37742, -1519.557)
    Angles = (0, 0, 0)
    name = TRG_G_RACE_RaceNav02
    Class = GameObject
    type = Combo_B
    AbsentInNetGames
    model = "stat_point"
    lod_dist1 = 400
    lod_dist2 = 401
    SuspendDistance = 0
  }
  {
    Position = (4052.6, -189.5763, 4931.679)
    Angles = (0, 0, 0)
    name = InvisoSnackBarCollide
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5479.293, -254.4957, 4185.204)
    Angles = (0, -3.14159, 0)
    name = TRG_Ped_Security_01
    Class = Pedestrian
    type = Ped_SecurityGuard01
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_securityguard01\ped_securityguard01.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Security_01Script
  }
  {
    Position = (194.0751, -34.71579, -1549.908)
    Angles = (0, -3.14159, 0)
    name = TRG_Ped_Security_02
    Class = Pedestrian
    type = Ped_SecurityGuard01
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_securityguard01\ped_securityguard01.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Security_02Script
  }
  {
    Position = (2264.187, -225.6538, 669.0532)
    Angles = (0, -3.14159, 0)
    name = TRG_Race_MonkeyStart
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Race_MonkeyStartScript
  }
  {
    Position = (-1899.684, -50.52452, 7473.435)
    Angles = (0, 0, 0)
    name = trg_proset2_QP_Rail02
    Class = RailNode
    type = Metal
    TrickObject Cluster = proset2_QP02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_proset2_QP_Rail01 ]
  }
  {
    Position = (-2189.416, -50.48206, 7473.435)
    Angles = (0, 0, 0)
    name = trg_proset2_QP_Rail01
    Class = RailNode
    type = Metal
    TrickObject Cluster = proset2_QP02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2273.495, -299.5649, 4681.823)
    Angles = (0, -1.5708, 0)
    name = TRG_ElephantRearingNav01
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (3951.481, -254.4416, 5306.835)
    Angles = (0, -1.5708, 0)
    name = TRG_Restart_AfterEle
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "After Elephant"
  }
  {
    Position = (-1911.86, -252.9745, 4753.883)
    Angles = (0, -1.27409, 0)
    name = TRG_Elephant_Trainer_Shoot
    Class = Pedestrian
    type = Ped_ETrainer_Rifle
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_ET
    profile = ped_elephant_trainer_a
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Elephant_Trainer_ShootScript
  }
  {
    Position = (5479.293, -254.4957, 4185.204)
    Angles = (0, -3.14159, 0)
    name = TRG_Ped_SecurityAlert01
    Class = Pedestrian
    type = Ped_SecurityGuard01
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_securityguard01\ped_securityguard01.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    Extra_Anims = animload_ped_BP
    SuspendDistance = 0
    TriggerScript = TRG_Ped_SecurityAlert01Script
  }
  {
    Position = (194.0751, -34.71579, -1549.908)
    Angles = (0, -3.14159, 0)
    name = TRG_Ped_SecurityAlert02
    Class = Pedestrian
    type = Ped_SecurityGuard01
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_securityguard01\ped_securityguard01.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    Extra_Anims = animload_ped_BP
    SuspendDistance = 0
    TriggerScript = TRG_Ped_SecurityAlert02Script
  }
  {
    Position = (194.9274, -35.15967, -1458.56)
    Angles = (0, 0, 0)
    name = TRG_Race_MonkeyCaught
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Race_MonkeyCaughtScript
  }
  {
    Position = (5882.642, -253.5615, 5118.931)
    Angles = (0, -1.56207, 0)
    name = TRG_G_SPECIAL_Pro
    Class = Pedestrian
    type = PedPro_Burnquist
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_burnquist_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    pro_name = Burnquist
  }
  {
    Position = (5975.796, -235.6576, 3785.861)
    Angles = (0, -1.5708, 0)
    name = TRG_Ped_Tram_Security
    Class = Pedestrian
    type = Ped_SecurityGuard01
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_securityguard01\ped_securityguard01.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    TriggerScript = TRG_Ped_Tram_SecurityScript
  }
  {
    Position = (4649.713, -266.4481, 3582.46)
    Angles = (0, -2.6529, 0)
    name = TRG_Giraffe01
    Class = Pedestrian
    type = Anl_Giraffe
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = giraffe
    AnimName = animload_anl_giraffe
    model = "animals\anl_giraffe\anl_giraffe.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_giraffe_shadow\anl_giraffe_shadow.mdl"
    Links = [ TRG_GiraffeNav01 ]
    TriggerScript = TRG_Giraffe01Script
  }
  {
    Position = (4390.125, -266.4937, 3509.589)
    Angles = (0, 1.12574, 0)
    name = TRG_Giraffe02
    Class = Pedestrian
    type = Anl_Giraffe
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = giraffe
    AnimName = animload_anl_giraffe
    model = "animals\anl_giraffe\anl_giraffe.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_giraffe_shadow\anl_giraffe_shadow.mdl"
    TriggerScript = TRG_Giraffe02Script
  }
  {
    Position = (2966.622, -184.3519, 4243.585)
    Angles = (0, 0, 0)
    name = ZRock15
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5470.065, -257.272, 2851.912)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLot01_Shadow
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (6360, -269.2242, 1920.003)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLot01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartNodeLions ]
    TriggerScript = Zoo_ParkingLot01Script
  }
  {
    Position = (-2438.09, -199.8416, 531.4192)
    Angles = (0, 0, 0)
    name = TRG_BirdNoises
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_BirdNoisesScript
  }
  {
    Position = (-2457.25, -15.11408, 1102.979)
    Angles = (1.5708, 0, 0)
    name = TRGP_CreateBirdNoises
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_CreateBirdNoisesScript
  }
  {
    Position = (2978.082, -243.2328, 827.2043)
    Angles = (0, 0, 0)
    name = TRG_MonkeyNoises
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_MonkeyNoisesScript
  }
  {
    Position = (2151.776, -15.11408, 2102.835)
    Angles = (1.5708, 0.48869, 0)
    name = TRGP_CreateMonkeyNoises
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_CreateMonkeyNoisesScript
  }
  {
    Position = (6264.683, -291.8837, 4976.896)
    Angles = (0, 0, 0)
    name = TRG_LionNoises
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_LionNoisesScript
  }
  {
    Position = (1465.767, -114.7531, 2546.091)
    Angles = (0, 0, 0)
    name = Zoo_FoodTent01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent01
  }
  {
    Position = (4384.917, -267.2835, 3610.692)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav02 ]
  }
  {
    Position = (4132.144, -267.4907, 3649.049)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav03 ]
  }
  {
    Position = (4032.733, -268.0528, 3771.053)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav04 ]
  }
  {
    Position = (4127.981, -268.0528, 3936.102)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav05 ]
  }
  {
    Position = (4392.583, -268.0528, 4046.671)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav06 ]
  }
  {
    Position = (4600.426, -268.0528, 3980.841)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav07 ]
  }
  {
    Position = (4724.078, -268.0528, 3818.027)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav08 ]
  }
  {
    Position = (4617.319, -267.7335, 3678.497)
    Angles = (0, -2.6529, 0)
    name = TRG_GiraffeNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_GiraffeNav01 ]
  }
  {
    Position = (-842.8807, -293.1197, 5927.382)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint11 ]
  }
  {
    Position = (-1059.801, -293.1197, 6031.257)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint02 ]
  }
  {
    Position = (-2135.037, -276.307, 4681.823)
    Angles = (0, -1.5708, 0)
    name = TRG_Elephant_Rearing
    Class = Pedestrian
    type = Anl_Elephant
    AbsentInNetGames
    SkeletonName = Elephant
    AnimName = animload_anl_elephant
    model = "animals\anl_elephant\anl_elephant.skin"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_elephant_shadow\anl_elephant_shadow.mdl"
    Links = [ TRG_ElephantRearingNav01 ]
    TriggerScript = TRG_Elephant_RearingScript
  }
  {
    Position = (1563.85, -400.9839, 970.3389)
    Angles = (0, 0, 0)
    name = Occlusion01
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (987.9537, -22.19308, 2270.488)
    Angles = (0, 0, 0)
    name = Occlusion02
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (2500.049, -22.19308, 2968.402)
    Angles = (0, 0, 0)
    name = Occlusion03
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (3469.399, -151.4201, 6537.08)
    Angles = (1.5708, -1.5708, 0)
    name = Occlusion07
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (4425.92, -29.44485, 4916.608)
    Angles = (0, 0, 0)
    name = Occlusion08
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (4425.92, -29.44485, 4916.608)
    Angles = (0, 0, 0)
    name = Occlusion05
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-1017.997, 419.7323, -239.4974)
    Angles = (1.5708, -1.5708, 0)
    name = Occlusion06
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-2346.111, -294.8931, 4221.616)
    Angles = (0, 0, 0)
    name = Occlusion09
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-4489.774, -735.4928, 3016.524)
    Angles = (0, 0, 0)
    name = TRG_PenguinNoises
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_PenguinNoisesScript
  }
  {
    Position = (-2748.94, 13.18896, 4729.207)
    Angles = (1.5708, 1.5708, 0)
    name = TRGP_CreatePenguinNoises
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_CreatePenguinNoisesScript
  }
  {
    Position = (-741.0729, -67.7084, 6524.601)
    Angles = (0, 0, 0)
    name = Occlusion10
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-172.9816, -67.7084, 6440.98)
    Angles = (0, 0, 0)
    name = Occlusion11
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-744.0584, -255.9884, 4245.819)
    Angles = (0, 0, 0)
    name = TRG_TramNav27
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TramNav01 ]
  }
  {
    Position = (4500, -255.1427, 4919.807)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyPitFloor02_hdja
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (9960, -291.0666, -1079.997)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLot02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (6960, -291.0666, -1079.997)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLot03
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (9360, -269.2242, 1920.003)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLot04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartNodeLions ]
    TriggerScript = Zoo_ParkingLot04Script
  }
  {
    Position = (710.9639, -194.0222, 4451.749)
    Angles = (0, 0, 0)
    name = Occluder_Bridge
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (710.9639, -194.0222, 4451.749)
    Angles = (0, 0, 0)
    name = Occluder_Bridge01
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-479.602, -194.0222, 4901.645)
    Angles = (1.5708, -3.14159, 0)
    name = Occluder_Bridge02
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-479.602, -194.0222, 4901.645)
    Angles = (1.5708, -3.14159, 0)
    name = Occluder_Bridge03
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (6152.702, -241.2624, 3514.71)
    Angles = (0, 0, 0)
    name = Zoo_TramStationShadow02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6315.719, -248.4086, 3555.036)
    Angles = (0, 0, 0)
    name = Zoo_TramStationShadow01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5914.016, -255.4306, 3510.379)
    Angles = (0, 0, 0)
    name = zoo_tram_Shadow
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5510.751, -17.76012, 4152.897)
    Angles = (0, 0, 0)
    name = Zoo_Flagpole01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Flagpole01
  }
  {
    Position = (5801.427, -134.9757, 3936.705)
    Angles = (0, 0, 0)
    name = Zoo_TramEntrance01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_TramEntrance01
    CollisionMode = Geometry
  }
  {
    Position = (113.5901, -149.3354, 4439.609)
    Angles = (0, 0, 0)
    name = InvisoBridgeDeBonker
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (231.7216, -35.82083, -355.2097)
    Angles = (0, 0, 0)
    name = TRG_Ped_Kenny_Hardflip
    Class = Pedestrian
    type = Ped_Mascot
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_ZM
    model = "levels\zoo\ped_mascot\ped_mascot.skin"
    SuspendDistance = 10000
    lod_dist1 = 349
    lod_dist2 = 350
    Links = [ TRG_Ped_Kenny_Nav01 ]
    TriggerScript = TRG_Ped_Kenny_HardflipScript
  }
  {
    Position = (3452.217, -925.1118, 5629.697)
    Angles = (1.5708, 0, 0)
    name = BigAssOccluder
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (1616.222, -925.1118, 4290.452)
    Angles = (1.5708, 1.5708, 0)
    name = BigAssOccluder01
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-1108.126, -668.1764, 589.016)
    Angles = (1.5708, -1.5708, 0)
    name = BigAssOccluderSide
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-1360.304, -611.7932, 1975.76)
    Angles = (1.5708, 0, 0)
    name = BigAssOccluderAviary01
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-3524.381, -611.7932, 1975.76)
    Angles = (1.5708, 0, 0)
    name = BigAssOccluderAviary02
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (3960.24, -196.4995, 5648.989)
    Angles = (0, 0, 0)
    name = Zoo_Sign02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign02
    CollisionMode = Geometry
  }
  {
    Position = (4788.679, -179.4118, 4203.04)
    Angles = (0, 0, 0)
    name = Zoo_Sign03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign03
    CollisionMode = Geometry
  }
  {
    Position = (5988.824, -231.241, 5089.435)
    Angles = (0, -1.5708, 0)
    name = Zoo_Sign05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign05
    CollisionMode = Geometry
  }
  {
    Position = (2895.058, -196.4995, 5648.989)
    Angles = (0, 0, 0)
    name = Zoo_Sign06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign06
    CollisionMode = Geometry
  }
  {
    Position = (2986.289, 469.7429, 3120.191)
    Angles = (0, 0, 0)
    name = Occlusion12
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (978.5706, 166.5293, 1790.131)
    Angles = (0, 0, 0)
    name = dt_bldg101
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-755.0817, 383.5041, 1627.536)
    Angles = (0, 0, 0)
    name = Zoo_GorillaGrate01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-755.0817, 383.5041, 1356.674)
    Angles = (0, 0, 0)
    name = Zoo_GorillaGrate02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-738.3492, 184.7598, 1791.312)
    Angles = (0, 0, 0)
    name = Zoo_GorillaCage_Ditch
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-733.4424, 62.55811, 1479.293)
    Angles = (0, 0, 0)
    name = Zoo_KongCage
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-755.0817, 383.5041, 1627.536)
    Angles = (0, 0, 0)
    name = Zoo_OpenGrate03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-755.0817, 383.5041, 1356.674)
    Angles = (0, 0, 0)
    name = Zoo_OpenGrate04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (120.9401, -287.4469, 3945.201)
    Angles = (0, -1.61887, 0)
    name = dt_watersurface01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Link_0 = TRG_RestartFountain
    Links = [ TRG_RestartFountain ]
    TriggerScript = dt_watersurface01Script
  }
  {
    Position = (119.1047, -278.8137, 3949.83)
    Angles = (0, 0, 0)
    name = Zoo_SealRock02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (214.3271, -278.8137, 3878.973)
    Angles = (0, -3.14159, 0)
    name = Zoo_SealRock03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-0.85756, -278.8137, 3925.511)
    Angles = (0, -0.97738, 0)
    name = Zoo_SealRock01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1378.562, -206.86, 4439.703)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage19
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1185.183, -140.787, 4439.718)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage18
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage19 ]
  }
  {
    Position = (1059.862, -101.6648, 4439.938)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage17
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage18 ]
  }
  {
    Position = (934.541, -71.6364, 4439.628)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage16
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage17 ]
  }
  {
    Position = (751.3682, -33.83514, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage15
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage16 ]
  }
  {
    Position = (586.4717, -6.67624, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage14
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage15 ]
  }
  {
    Position = (418.1648, 14.10853, 4440.23)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage13
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage14 ]
  }
  {
    Position = (212.6922, 33.1292, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage12
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage13 ]
  }
  {
    Position = (5.23909, 33.1292, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage08
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-190.9846, 14.25963, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage07
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage08 ]
  }
  {
    Position = (-359.2915, -9.00703, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage06
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage07 ]
  }
  {
    Position = (-524.188, -36.29164, 4438.73)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage05
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage06 ]
  }
  {
    Position = (-707.3607, -75.09897, 4439.628)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage04
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage05 ]
  }
  {
    Position = (-832.6816, -103.5614, 4439.938)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage03
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage04 ]
  }
  {
    Position = (-958.0025, -146.2274, 4439.718)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage02
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage03 ]
  }
  {
    Position = (-1132.913, -206.1064, 4439.692)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage01
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage02 ]
  }
  {
    Position = (182.4017, 36.84489, 4434.553)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage11
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage12 ]
  }
  {
    Position = (165.5566, 44.16737, 4428.35)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage10
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage11 ]
  }
  {
    Position = (137.1965, 61.35478, 4415.227)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage09
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage10 ]
  }
  {
    Position = (-1132.913, -206.1064, 4919.031)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide16
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide01 ]
  }
  {
    Position = (-958.0026, -146.2274, 4919.057)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide01
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide02 ]
  }
  {
    Position = (-832.6818, -103.5614, 4919.278)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide02
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide03 ]
  }
  {
    Position = (-707.3608, -75.09897, 4918.967)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide03
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide04 ]
  }
  {
    Position = (-524.1882, -36.29164, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide04
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide05 ]
  }
  {
    Position = (-359.2917, -9.00703, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide05
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide06 ]
  }
  {
    Position = (-190.9847, 14.25963, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide06
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide07 ]
  }
  {
    Position = (32.69211, 33.1292, 4916.798)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide07
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide17 ]
  }
  {
    Position = (247.2271, 33.1292, 4916.798)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide08
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide09 ]
  }
  {
    Position = (418.1647, 15.40852, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide09
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide10 ]
  }
  {
    Position = (586.4716, -6.67624, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide10
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide11 ]
  }
  {
    Position = (751.368, -33.83514, 4918.069)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide11
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide12 ]
  }
  {
    Position = (934.5409, -71.6364, 4918.967)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide12
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide13 ]
  }
  {
    Position = (1059.862, -101.6648, 4919.278)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide13
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide14 ]
  }
  {
    Position = (1185.183, -140.787, 4919.057)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide14
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide15 ]
  }
  {
    Position = (1378.562, -206.86, 4919.042)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide15
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (72.62315, 33.1292, 4926.178)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide17
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_Damage_CompSide18 ]
  }
  {
    Position = (89.46825, 33.1292, 4939.068)
    Angles = (0, 0, 0)
    name = TRG_Rail_Damage_CompSide18
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2720.522, -335.9187, 6707.264)
    Angles = (0, 0, 0)
    name = Zoo_RhinoGround01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3471.766, -292.5959, 6612.37)
    Angles = (0, 0, 0)
    name = Sk3Ed_P_10x10x14
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_buildWall
    CollisionMode = Geometry
  }
  {
    Position = (4216.188, -335.7522, 6574.7)
    Angles = (0, 0, 0)
    name = Zoo_ElephantGround01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3954.817, -337.2175, 5868.26)
    Angles = (0, 0, 0)
    name = ZEleph_Trench01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench01
    CollisionMode = Geometry
  }
  {
    Position = (4874.979, -356.7841, 5951.589)
    Angles = (0, 0, 0)
    name = ZEleph_Trench02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench02
    CollisionMode = Geometry
  }
  {
    Position = (1942.879, -307.9953, 6785.577)
    Angles = (0, 0, 0)
    name = ZRhino_Trench01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench01
  }
  {
    Position = (6743.054, -212.7323, 5399.963)
    Angles = (0, 0, 0)
    name = Zoo_LionQP03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks01
    CollisionMode = Geometry
  }
  {
    Position = (6050.923, 38.81025, 4920.004)
    Angles = (0, 0, 0)
    name = Zoo_LionTopTrim
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    CollisionMode = Geometry
    Links = [ TRG_RestartHills01 ]
    TriggerScript = Zoo_LionTopTrimScript
  }
  {
    Position = (6005.628, -222.663, 5400.004)
    Angles = (0, 0, 0)
    name = Zoo_LionQP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    TriggerScript = Zoo_LionQP02Script
  }
  {
    Position = (6485.515, 70.37706, 4848.455)
    Angles = (0, 0, 0)
    name = zoo_lion_Floor
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6613.299, -157.9699, 4919.947)
    Angles = (0, 0, 0)
    name = Zoo_LionRoof
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionHouse01
    CollisionMode = Geometry
  }
  {
    Position = (6810.014, 89.88741, 5365.906)
    Angles = (1.46363, 0, 0)
    name = ivy01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (6810.014, 89.88741, 5390.382)
    Angles = (1.46363, 0, 0)
    name = ivy02
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (6613.299, -157.9818, 4919.925)
    Angles = (0, 0, 0)
    name = Zoo_LionHouse01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionHouse01
    CollisionMode = Geometry
  }
  {
    Position = (6005.513, -184.5836, 4917.655)
    Angles = (0, 0, 0)
    name = Zoo_LionGate
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6005.539, -222.6633, 4440.004)
    Angles = (0, 0, 0)
    name = Zoo_LionQP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    TriggerScript = Zoo_LionQP01Script
  }
  {
    Position = (6050.363, -113.1787, 4920.004)
    Angles = (0, 0, 0)
    name = Lion_mound
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCage
    CollisionMode = Geometry
    TriggerScript = Lion_moundScript
  }
  {
    Position = (6005.513, -113.1788, 4921.075)
    Angles = (0, 0, 0)
    name = Zoo_LionCage
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3000, -356.5903, 5867.771)
    Angles = (0, 0, 0)
    name = ZRhino_Trench03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench03
  }
  {
    Position = (2108.055, -356.5903, 5951.067)
    Angles = (0, 0, 0)
    name = ZRhino_Trench04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench04
  }
  {
    Position = (5020.21, -356.596, 6740.026)
    Angles = (0, 0, 0)
    name = ZEleph_Trench04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench04
    CollisionMode = Geometry
  }
  {
    Position = (1014.464, -125.699, 4957.177)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage25
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage26 ]
  }
  {
    Position = (1047.181, -125.4652, 5036.118)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage23
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage24 ]
  }
  {
    Position = (1047.243, -124.3963, 5475.365)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage22
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage32 ]
  }
  {
    Position = (1018.007, -123.3273, 5557.726)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage21
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage22 ]
  }
  {
    Position = (934.4573, -122.2584, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage20
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage21 ]
  }
  {
    Position = (394.3965, -121.2129, 5596.429)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage19
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage20 ]
  }
  {
    Position = (259.0199, -80.20004, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage18
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage19 ]
  }
  {
    Position = (121.4987, -65.6994, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage17
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage18 ]
  }
  {
    Position = (-19.53052, -80.20004, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage16
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage17 ]
  }
  {
    Position = (-167.2129, -122.2584, 5596.702)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage15
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage16 ]
  }
  {
    Position = (-707.2737, -123.3039, 5596.975)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage14
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage15 ]
  }
  {
    Position = (-790.8234, -124.3728, 5557.999)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage13
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage14 ]
  }
  {
    Position = (-820.0591, -125.4418, 5475.638)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage12
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage13 ]
  }
  {
    Position = (-819.9972, -126.5107, 5036.391)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage11
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage35 ]
  }
  {
    Position = (-787.0242, -125.699, 4955.457)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage09
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage10 ]
  }
  {
    Position = (839.8372, -52.00175, 4917.878)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage27
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage28 ]
  }
  {
    Position = (751.368, -36.29164, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage28
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage29 ]
  }
  {
    Position = (586.4714, -10.30704, 4919.569)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage29
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage30 ]
  }
  {
    Position = (-190.9847, 14.25963, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage04
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage05 ]
  }
  {
    Position = (-359.2917, -9.00703, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage05
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage06 ]
  }
  {
    Position = (-524.1882, -36.29164, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage06
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage07 ]
  }
  {
    Position = (-600.162, -50.95279, 4917.878)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage07
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage08 ]
  }
  {
    Position = (1003.915, -125.699, 4950.082)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage26
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage27 ]
  }
  {
    Position = (1023.672, -125.699, 4968.787)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage24
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage25 ]
  }
  {
    Position = (-796.1954, -125.699, 4968.218)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage10
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage11 ]
  }
  {
    Position = (-769.7692, -125.699, 4948.682)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage08
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage09 ]
  }
  {
    Position = (32.69211, 33.1292, 4916.798)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage03
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage04 ]
  }
  {
    Position = (247.2271, 33.1292, 4916.798)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage31
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (418.1647, 14.25961, 4918.069)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage30
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage31 ]
  }
  {
    Position = (72.62315, 33.1292, 4926.178)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage02
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage03 ]
  }
  {
    Position = (89.46825, 33.1292, 4939.068)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage01
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage02 ]
  }
  {
    Position = (-2012.161, -256.0394, 5815.848)
    Angles = (0, -0.7854, 0)
    name = TRG_SnackMonkey
    Class = Pedestrian
    type = Anl_Monkey
    AbsentInNetGames
    SkeletonName = monkey
    AnimName = animload_anl_monkey
    model = "animals\anl_monkey\anl_monkey.skin"
    SuspendDistance = 0
    lod_dist1 = 50
    lod_dist2 = 100
    TriggerScript = TRG_SnackMonkeyScript
  }
  {
    Position = (-2834.956, 164.0974, 684.215)
    Angles = (0, 1.5708, 0)
    name = TRG_EggLayer01
    Class = Pedestrian
    type = Anl_Cockatoo
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_EggLayer01Script
  }
  {
    Position = (-2834.956, 164.0974, 530.3181)
    Angles = (0, 1.5708, 0)
    name = TRG_EggLayer02
    Class = Pedestrian
    type = Anl_Cockatoo
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_EggLayer02Script
  }
  {
    Position = (-2834.956, 164.0974, 378.8058)
    Angles = (0, 1.5708, 0)
    name = TRG_EggLayer03
    Class = Pedestrian
    type = Anl_Cockatoo
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_EggLayer03Script
  }
  {
    Position = (-2449.157, -68.40146, 592.9006)
    Angles = (0, 1.5708, 0)
    name = TRG_Bird04
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird04Script
  }
  {
    Position = (-2449.157, -68.40146, 379.1215)
    Angles = (0, -1.5708, 0)
    name = TRG_Bird05
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird05Script
  }
  {
    Position = (-2038.845, 164.0974, 779.285)
    Angles = (0, -1.5708, 0)
    name = TRG_Bird06
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird06Script
  }
  {
    Position = (-2038.845, 164.0974, 461.3392)
    Angles = (0, -1.5708, 0)
    name = TRG_Bird07
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird07Script
  }
  {
    Position = (-2341.965, 164.0974, 157.5338)
    Angles = (0, -3.14159, 0)
    name = TRG_Bird08
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird08Script
  }
  {
    Position = (-2590.744, 164.0974, 899.6042)
    Angles = (0, 0, 0)
    name = TRG_Bird09
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird09Script
  }
  {
    Position = (-2205.409, 230.1814, 982.83)
    Angles = (0, 0.00873, 0)
    name = TRG_Bird11
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird11Script
  }
  {
    Position = (-1966.343, 230.1814, 337.9104)
    Angles = (0, -1.5708, 0)
    name = TRG_Bird14
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird14Script
  }
  {
    Position = (-2626.581, 230.1814, 74.03792)
    Angles = (0, -3.14159, 0)
    name = TRG_Bird15
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird15Script
  }
  {
    Position = (-2441.974, 162.5062, 691.1807)
    Angles = (0, -1.5708, 0)
    name = TRG_Bird16
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird16Script
  }
  {
    Position = (-2449.157, 162.5062, 329.5266)
    Angles = (0, 1.5708, 0)
    name = TRG_Bird17
    Class = Pedestrian
    type = Anl_Cockatoo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = cockatoo
    AnimName = animload_anl_cockatoo
    model = "animals\anl_cockatoo\anl_cockatoo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Bird17Script
  }
  {
    Position = (-2184.449, -176.023, 889.8082)
    Angles = (0, -1.56207, 0)
    name = TRG_G_COUNTERCOMBO_Pro
    Class = Pedestrian
    type = PedPro_Margera
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_margera_profile
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    pro_name = Margera
  }
  {
    Position = (-2157.756, -176.023, 966.3371)
    Angles = (0, 0, 0)
    name = TRG_G_COUNTERCOMBO_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: SKATE-Tris"
  }
  {
    Position = (-2449.157, -232.9587, 496.299)
    Angles = (0, 1.5708, 0)
    name = TRG_MG_BirdCounter
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_MG_BirdCounterScript
  }
  {
    Position = (-2013.589, -1056.225, 5034.388)
    Angles = (1.5708, 1.5708, 0)
    name = OcclusionAquarium
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-4284.794, -558.0471, 2374.736)
    Angles = (1.5708, 0.64577, 0)
    name = OcclusionAquarium01
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (6011.63, 56.12939, 4415.268)
    Angles = (1.5708, 1.5708, 0)
    name = TRG_G_HighCombo2_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Lion Goal"
    TriggerScript = TRG_G_HighCombo2_RestartNodeScript
  }
  {
    Position = (-947.105, 294.5227, 2919.163)
    Angles = (0, 0, 0)
    name = Proset6_QP01
    Class = LevelGeometry
    TrickObject Cluster = Proset6_QP01
  }
  {
    Position = (-984.9185, 351.8514, 2782.068)
    Angles = (0, 0, 0)
    name = trg_proset6_RailQP01
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset6_QP01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-984.9186, 351.8275, 3143.923)
    Angles = (0, 0, 0)
    name = trg_proset6_RailQP02
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset6_QP01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_proset6_RailQP01 ]
  }
  {
    Position = (1228.643, 351.8275, 2782.092)
    Angles = (0, -3.14159, 0)
    name = trg_proset6_RailQP03
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset6_QP02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_proset6_RailQP04 ]
  }
  {
    Position = (1228.643, 351.8514, 3143.947)
    Angles = (0, -3.14159, 0)
    name = trg_proset6_RailQP04
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset6_QP02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1190.829, 294.5227, 3006.851)
    Angles = (0, -3.14159, 0)
    name = Proset6_QP02
    Class = LevelGeometry
    TrickObject Cluster = Proset6_QP02
  }
  {
    Position = (4429.685, -134.5997, 3499.274)
    Angles = (0, 0, 0)
    name = Zoo_Giraffe_inside_cw
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4715.427, -7.91116, 3342.75)
    Angles = (0, 0, 0)
    name = Zoo_GiraffePen03
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (5199.422, -26.45118, 3775.529)
    Angles = (0, 0, 0)
    name = Zoo_GiraffePen
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_RestartNode01 ]
  }
  {
    Position = (-2752.957, 476.1584, 1716.767)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine02
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset5_QP03
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-2752.957, 476.1346, 2223.876)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine03
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset5_QP03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_Proset5_RailSpine02 ]
  }
  {
    Position = (-2132.595, 476.1107, 2224.123)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine04
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset5_QP04
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_Proset5_RailSpine05 ]
  }
  {
    Position = (-2132.595, 476.1346, 1717.013)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine05
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset5_QP04
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-3301.012, 195.1981, 2219.127)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine06
    Class = RailNode
    type = Wood
    TrickObject Cluster = Proset5_Spine01
    TerrainType = TERRAIN_WOOD
    Links = [ trg_Proset5_RailSpine07 ]
  }
  {
    Position = (-3301.012, 195.1981, 1720.548)
    Angles = (0, 1.5708, 0)
    name = trg_Proset5_RailSpine07
    Class = RailNode
    type = Wood
    TrickObject Cluster = Proset5_Spine01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (4425.997, 28.75372, 5195.732)
    Angles = (0, 0, 0)
    name = Proset7_QP05
    Class = LevelGeometry
    TrickObject Cluster = Proset7_QP05
  }
  {
    Position = (4294.615, 86.06934, 5234.781)
    Angles = (0, -3.14159, 0)
    name = trg_proset7_RailQP05
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset7_QP05
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (4557.378, 86.04545, 5234.781)
    Angles = (0, -3.14159, 0)
    name = trg_proset7_RailQP06
    Class = RailNode
    type = Metal
    TrickObject Cluster = Proset7_QP05
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_proset7_RailQP05 ]
  }
  {
    Position = (4623.382, -334.488, 6474.992)
    Angles = (0, 1.5708, 0)
    name = TRG_G_GAP2_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gaps2"
  }
  {
    Position = (5364.534, 137.2754, 6702.839)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapStart_ElephantRock
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRGP_GapEnd_ElephantRock ]
    TriggerScript = TRGP_GapStart_ElephantRockScript
  }
  {
    Position = (5364.534, 137.2754, 6982.807)
    Angles = (1.5708, 0, 0)
    name = TRGP_GapEnd_ElephantRock
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRGP_GapStart_ElephantRock ]
    TriggerScript = TRGP_GapEnd_ElephantRockScript
  }
  {
    Position = (4715.45, -336.4095, 6561.136)
    Angles = (0, 0, 0)
    name = TRG_G_GAP2_Pro
    Class = Pedestrian
    type = PedPro_Burnquist
    SkeletonName = human
    AnimName = animload_human
    profile = pedpro_burnquist_profile
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
    pro_name = Burnquist
  }
  {
    Position = (-1682.387, -50.48206, 5064.638)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailSpine07
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1682.387, -50.52452, 5408.056)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailSpine08
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_RailSpine07 ]
  }
  {
    Position = (2013.099, -52.65889, 4847.572)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailSpine09
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2010.091, -50.52452, 4535.172)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailSpine10
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_RailSpine09 ]
  }
  {
    Position = (2010.091, -50.48206, 5384.979)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailSpine11
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (2010.091, -50.52452, 5041.561)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailSpine12
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ trg_g_comp_RailSpine11 ]
  }
  {
    Position = (1047.224, -124.724, 5340.724)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage32
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1047.201, -125.1188, 5178.496)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage33
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage23 ]
  }
  {
    Position = (-820.04, -125.7701, 5340.724)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage34
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Damage12 ]
  }
  {
    Position = (-820.0171, -126.1649, 5178.498)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Damage35
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-820.0171, -126.1649, 5178.498)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl30
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-820.04, -125.7701, 5340.724)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl31
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl20 ]
  }
  {
    Position = (1047.224, -124.724, 5340.724)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl32
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1047.201, -125.1188, 5178.496)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl33
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl02 ]
  }
  {
    Position = (-1133.076, -232.0455, 4653.885)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail01
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-832.1689, -133.0651, 4653.885)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail02
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail01 ]
  }
  {
    Position = (-523.8315, -62.51151, 4653.885)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail03
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail02 ]
  }
  {
    Position = (-135.5247, -7.7982, 4653.885)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail04
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail03 ]
  }
  {
    Position = (-135.5247, -7.7982, 4778.188)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail05
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail06 ]
  }
  {
    Position = (-523.8315, -62.51151, 4778.188)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail06
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail07 ]
  }
  {
    Position = (-832.1689, -133.0651, 4778.188)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail07
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail08 ]
  }
  {
    Position = (-1133.076, -232.0455, 4778.188)
    Angles = (0, 1.5708, 0)
    name = trg_g_comp_RailRail08
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1380.331, -232.0455, 4782.441)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail09
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1079.424, -133.0651, 4782.441)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail10
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail09 ]
  }
  {
    Position = (771.0869, -62.51151, 4782.441)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail11
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail10 ]
  }
  {
    Position = (379.319, -7.80167, 4782.441)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail12
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail11 ]
  }
  {
    Position = (379.319, -7.80168, 4658.137)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail13
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail14 ]
  }
  {
    Position = (771.0869, -62.51151, 4658.137)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail14
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail15 ]
  }
  {
    Position = (1079.424, -133.0651, 4658.137)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail15
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_comp_RailRail16 ]
  }
  {
    Position = (1380.331, -232.0455, 4658.137)
    Angles = (0, -1.5708, 0)
    name = trg_g_comp_RailRail16
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (119.8014, 148.8355, 1327.599)
    Angles = (0, 0, 0)
    name = Zoo_TurnStyleRoof
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
    CollisionMode = Geometry
    TriggerScript = Zoo_TurnStyleRoofScript
  }
  {
    Position = (-171.7153, -12.53962, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_A01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (-145.4417, -4.38049, 1310.322)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_B01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (34.84789, -12.53962, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_A02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (61.12144, -4.38049, 1310.322)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_B04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (178.0131, -4.38049, 1310.322)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_B12
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (204.3367, -12.53962, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_A07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (381.436, -4.38049, 1310.322)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_B14
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (407.7596, -12.53962, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyle_A08
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (120.7515, -12.44092, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleBlock01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (-86.64035, -12.44092, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleBlock02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (323.0382, -12.44092, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleBlock03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (-290.9122, -12.44092, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleBlock04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (529.5252, -12.44092, 1310.555)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleBlock05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (235.1628, -15.65909, 1302.94)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleGate01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (441.6295, -15.65909, 1302.94)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleGate03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (-44.69699, -15.65909, 1302.94)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleGate06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (-248.8155, -15.65909, 1302.94)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleGate08
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = zoo_hj_TurnStyle_A01
  }
  {
    Position = (121.6127, -35.91983, 1322.946)
    Angles = (0, 0, 0)
    name = Zoo_TurnStyleRoofPoles
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntranceRoof01
  }
  {
    Position = (-639.1267, -341.6348, 5638.389)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Hippo_bridge_post03_cw
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    CollisionMode = Geometry
  }
  {
    Position = (1327.575, -155.4603, 7283.418)
    Angles = (0, -1.5708, 0)
    name = Zoo_BigRockQP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP01
    CollisionMode = Geometry
  }
  {
    Position = (-2295.08, -202.2493, 7528.758)
    Angles = (0, 0, 0)
    name = ZRock02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-430.6187, -277.8787, 6758.062)
    Angles = (0, 0, 0)
    name = Zoo_HippoShallowWater
    Class = LevelGeometry
    Push1 = 110
    CollisionMode = Geometry
  }
  {
    Position = (-786.5513, -243.6811, 6869.73)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    CollisionMode = Geometry
    TriggerScript = Zoo_HippoPoolBottomScript
  }
  {
    Position = (-647.2449, -157.5264, 7386.817)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolTop
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    CollisionMode = Geometry
  }
  {
    Position = (-553.805, -135.1082, 7443.778)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolTop01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    CollisionMode = Geometry
  }
  {
    Position = (-917.3134, -266.15, 6424.972)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-290.922, -248.2948, 6802.526)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoPoolBottom
    CollisionMode = Geometry
    TriggerScript = Zoo_HippoPoolBottom02Script
  }
  {
    Position = (-302.7518, -160.0899, 7375.927)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolTop02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoPoolTop
    CollisionMode = Geometry
  }
  {
    Position = (-1079.999, -376.6775, 6840.004)
    Angles = (0, 0, 0)
    name = Zoo_HippoWater02
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = Zoo_HippoWater02Script
  }
  {
    Position = (-1799.999, -266.9335, 6360.005)
    Angles = (0, 0, 0)
    name = Zoo_Ground01
    Class = LevelGeometry
    CreatedAtStart
    Push1 = 110
  }
  {
    Position = (2040, -256.6251, 6258.317)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Zoo_Ground03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart_Hills01 ]
    TriggerScript = G_COMPNOT_Bob_Zoo_Ground03Script
  }
  {
    Position = (68.75528, -265.864, 6415.081)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-21.90906, -353.8107, 7416.818)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-924.4155, -350.9736, 7461.003)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom06
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (360.0005, -376.6775, 6840.004)
    Angles = (0, 0, 0)
    name = Zoo_HippoWater03
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = Zoo_HippoWater03Script
  }
  {
    Position = (-302.4964, -341.6348, 5638.389)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Hippo_bridge_post04_cw
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    CollisionMode = Geometry
  }
  {
    Position = (-302.4964, -341.6348, 6065.986)
    Angles = (0, 0, 0)
    name = Hippo_bridge_post02_cw
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-639.1267, -341.6348, 6065.986)
    Angles = (0, 0, 0)
    name = Hippo_bridge_post01_cw
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-193.3809, -257.2526, 5617.388)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Hippo_bridge_fence02_cw
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    CollisionMode = Geometry
  }
  {
    Position = (-126.9568, -211.0807, 5625.298)
    Angles = (0, -0.06981, 0)
    name = G_COMPNOT_Bob_Zoo_HippoRope02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    CollisionMode = Geometry
  }
  {
    Position = (-1820.459, -254.8721, 6861.387)
    Angles = (0, 0, 0)
    name = Hippo_bridge_fence01_cw
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    CollisionMode = Geometry
  }
  {
    Position = (-814.5314, -211.0807, 5625.298)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Zoo_HippoRope01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    CollisionMode = Geometry
  }
  {
    Position = (141.7207, -260.5659, 5616.003)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Hippo_bridge_fenceshad02_cw
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1804.467, -266.9335, 5538.317)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Zoo_Ground_cw
    Class = LevelGeometry
    CreatedAtStart
    Push1 = 110
  }
  {
    Position = (-1774.151, -94.7764, 7869.924)
    Angles = (-0.08583, -2.76585, -0.34373)
    name = dt_wedgie02
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-1991.59, -217.5173, 7657.527)
    Angles = (-0.24856, -2.44402, 0.62462)
    name = dt_wedgie04
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-1530.013, -145.9124, 7973.818)
    Angles = (-0.14896, -2.57325, -0.32219)
    name = Zoo_Log02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Log02
    CollisionMode = Geometry
  }
  {
    Position = (-1835.099, -57.21817, 7803.224)
    Angles = (-0.10805, -2.19219, 0.51121)
    name = Zoo_Log01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Log01
    CollisionMode = Geometry
  }
  {
    Position = (-2519.998, 137.2283, 7200.739)
    Angles = (0, 0, 0)
    name = log_shadow
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1157.36, 2530.053, 7230.492)
    Angles = (0, 0, 0)
    name = log_shadow2
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (717.4079, -180.9678, 8014.516)
    Angles = (-0.65149, 2.23591, -0.03478)
    name = dt_wedgie05
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (862.5948, -133.0758, 7801.45)
    Angles = (-0.64845, 2.44284, 0.07632)
    name = Zoo_Log03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Log03
    CollisionMode = Geometry
  }
  {
    Position = (-1126.328, 2545.269, 7114.477)
    Angles = (0, 0.06109, 0)
    name = log_shadow03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2306.261, -173.9501, 7630.237)
    Angles = (0, 0, 0)
    name = rockshadow02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2286.646, -266.2409, 6705.417)
    Angles = (0, 0, 0)
    name = ZRock01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-745.1829, -154.7984, 5629.812)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap03
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap01 ]
  }
  {
    Position = (-698.6442, -134.1892, 5629.728)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap04
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap03 ]
  }
  {
    Position = (-654.5024, -98.34439, 5629.58)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap05
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap04 ]
  }
  {
    Position = (-196.3053, -154.7984, 5629.812)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap06
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap07 ]
  }
  {
    Position = (-242.844, -134.1892, 5629.716)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap07
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_G_COMPNOT_RailHippoGap08 ]
  }
  {
    Position = (-285.7279, -100.972, 5629.646)
    Angles = (0, 0, 0)
    name = TRG_G_COMPNOT_RailHippoGap08
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-454.6752, -257.1759, 6059.142)
    Angles = (0, 0, 0)
    name = InvisoBridgeSmoother
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-71.44896, -210.0784, 2664.135)
    Angles = (0, 1.71042, 0)
    name = TRG_PedNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_PedNav14 ]
  }
  {
    Position = (1607.244, -254.4416, 5918.52)
    Angles = (0, 1.82387, 0)
    name = TRG_Ped_Hippo_04
    Class = Pedestrian
    type = Ped_From_Profile_Baby
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_baby
    profile = ped_kid_balloon_a
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_Ped_LookAt ]
    TriggerScript = TRG_Ped_Hippo_04Script
  }
  {
    Position = (-2271.967, 256.252, 5321.262)
    Angles = (0, 0, 0)
    name = Zoo_AquaWaveQP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP01
  }
  {
    Position = (-2013.195, -158.3414, 4198.494)
    Angles = (0, 0, 0)
    name = Zoo_AquaFront02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1799.999, -256.0764, 5518.81)
    Angles = (0, 0, 0)
    name = Zoo_AquaFront01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (127.513, 28.32479, 4652.315)
    Angles = (0, 0, 0)
    name = TRG_KOTH01
    Class = GenericNode
    type = Crown
    CreatedAtStart
  }
  {
    Position = (4430.343, 28.32479, 4921.461)
    Angles = (0, 0, 0)
    name = TRG_KOTH02
    Class = GenericNode
    type = Crown
    CreatedAtStart
  }
  {
    Position = (3471.914, -43.90029, 6580.231)
    Angles = (0, 0, 0)
    name = TRG_KOTH03
    Class = GenericNode
    type = Crown
    CreatedAtStart
  }
  {
    Position = (-2306.588, 178.5151, 4711.623)
    Angles = (0, 0, 0)
    name = TRG_KOTH04
    Class = GenericNode
    type = Crown
    CreatedAtStart
  }
  {
    Position = (-240, -35.82084, -600.0002)
    Angles = (0, 0, 0)
    name = Sk3Ed_Gt_20x20
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter01
    CollisionMode = Geometry
  }
  {
    Position = (480, -35.82084, -600.0004)
    Angles = (0, 0, 0)
    name = Sk3Ed_Gt_20x21
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Entrance_Planter02
    CollisionMode = Geometry
  }
  {
    Position = (-492.1006, 95.21412, -1521.76)
    Angles = (0, 0, 0)
    name = Zoo_EntBlock
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-237.8542, 122.9871, -600.4179)
    Angles = (0, 0.34907, 0)
    name = Zoo_SmallTree01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (467.2912, 122.9871, -600.4179)
    Angles = (0, 0.34907, 0)
    name = Zoo_SmallTree02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (730.6187, 95.21412, -1521.76)
    Angles = (0, 0, 0)
    name = Zoo_EntBlock01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1861.217, -255.9884, 5483.016)
    Angles = (0, 0, 0)
    name = TRG_TramNav28
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_Accel01
    Links = [ TRG_TramNav05 ]
  }
  {
    Position = (5651.29, -248.994, 4305.097)
    Angles = (0, -3.14159, 0)
    name = TRG_RestartNode01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Gen: Restart"
  }
  {
    Position = (397.1133, -2401.097, 4183.307)
    Angles = (0, 0, 0)
    name = Zoo_HippoPoolBottom07
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (162.8457, -2429.256, 4608.23)
    Angles = (0, 0, 0)
    name = Zoo_HippoWater05
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_HippoWater05Script
  }
  {
    Position = (-2369.946, 365.5373, 4402.781)
    Angles = (0, 0, 0)
    name = Zoo_AquaFlag01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2369.946, 365.5373, 4402.781)
    Angles = (0, 0, 0)
    name = Zoo_AquaPole01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2369.946, 365.5373, 5082.619)
    Angles = (0, 0, 0)
    name = Zoo_AquaFlag02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2369.946, 365.5373, 5082.619)
    Angles = (0, 0, 0)
    name = Zoo_AquaPole02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2328.985, 102.0042, 4275.911)
    Angles = (0, 0, 0)
    name = Zoo_AquariumSignRail
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaSignRail01
    CollisionMode = Geometry
  }
  {
    Position = (-3737.265, -353.0867, 4103.387)
    Angles = (0, 0, 0)
    name = AQUA_SeaWeed03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4215.409, -183.7971, 3982.712)
    Angles = (0, 0, 0)
    name = AQUA_SeaRocks04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3737.265, -353.0867, 5313.072)
    Angles = (0, 0, 0)
    name = AQUA_SeaWeed02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3395.306, -455.6575, 5316.418)
    Angles = (0, 0, 0)
    name = AQUA_SeaRocks03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3426.494, -272.1722, 3733.802)
    Angles = (0, 1.5708, 0)
    name = AQUA_FloatingJunk01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3426.494, -272.1722, 4930.077)
    Angles = (0, 1.5708, 0)
    name = AQUA_FloatingJunk02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-5456.332, -524.1849, 4872.437)
    Angles = (0, 0, 0)
    name = AQUA_SeaRocks01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-5200.206, -504.5953, 4727.785)
    Angles = (0, 0, 0)
    name = AQUA_SeaWeed01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-5196.203, -656.5211, 4524.347)
    Angles = (0, 0, 0)
    name = Floating_Junk03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5327.155, -255.9883, 5667.976)
    Angles = (0, -0.9163, 0)
    name = TRG_RestartHills01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Hills"
  }
  {
    Position = (-2187.699, -275.8532, 4447.146)
    Angles = (0, 0, 0)
    name = InvisoAquaCollide
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2187.699, -275.8532, 4923.231)
    Angles = (0, 0, 0)
    name = InvisoAquaCollide01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4472.61, -564.621, 6416.784)
    Angles = (0, 0, 0)
    name = AQUA_SeaRocks02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4215.409, -183.7971, 3982.712)
    Angles = (0, 0, 0)
    name = Zoo_AquariumHills02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (122.2007, -239.39, 3072.9)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_Team
    Class = Restart
    type = Team
    CreatedAtStart
    RestartName = "Team: Restart"
    restart_types = [ Team ]
  }
  {
    Position = (-318.1319, -242.8916, 4177.831)
    Angles = (0, -3.14159, 0)
    name = TRG_Flag_Blue
    Class = GameObject
    type = Flag_Blue
    model = "gameobjects\flags\flag_blue\flag_blue.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_Flag_BlueScript
  }
  {
    Position = (-86.54553, -242.8916, 3606.38)
    Angles = (0, -3.14159, 0)
    name = TRG_Flag_Green
    Class = GameObject
    type = Flag_Green
    model = "gameobjects\flags\flag_green\flag_green.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_Flag_GreenScript
  }
  {
    Position = (337.0695, -242.8916, 3606.38)
    Angles = (0, -3.14159, 0)
    name = TRG_Flag_Red
    Class = GameObject
    type = Flag_Red
    model = "gameobjects\flags\flag_red\flag_red.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_Flag_RedScript
  }
  {
    Position = (547.2703, -242.8916, 4177.831)
    Angles = (0, -3.14159, 0)
    name = TRG_Flag_Yellow
    Class = GameObject
    type = Flag_Yellow
    model = "gameobjects\flags\flag_yellow\flag_yellow.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_Flag_YellowScript
  }
  {
    Position = (-4531.843, -535.2089, 2643.538)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_waddle_02
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 10000
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_PenguinNav08 ]
    TriggerScript = TRG_penguin_waddle_02Script
  }
  {
    Position = (-4829.654, -535.2089, 2841.007)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_waddle_03
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 10000
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_PenguinNav20 ]
    TriggerScript = TRG_penguin_waddle_03Script
  }
  {
    Position = (-4771.986, -670.5212, 3734.609)
    Angles = (0, -3.14159, 0)
    name = TRG_penguin_waddle_04
    Class = Pedestrian
    type = Anl_Penguin
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = penguin
    AnimName = animload_anl_penguin
    model = "animals\anl_penguin\anl_penguin.skin"
    SuspendDistance = 10000
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_PenguinNav18 ]
    TriggerScript = TRG_penguin_waddle_04Script
  }
  {
    Position = (-4509.187, -346.8605, 6197.938)
    Angles = (0, 0, 0)
    name = AQUA_FloatingJunk03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2443.598, -78.34184, 1083.881)
    Angles = (1.5708, 0, 0)
    name = TRGP_PlasticNoise
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_PlasticNoiseScript
  }
  {
    Position = (117.3655, -15.35207, 1302.965)
    Angles = (1.5708, 0, 0)
    name = TRGP_TurnstyleNoise
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_TurnstyleNoiseScript
  }
  {
    Position = (-3801.177, -101.3482, 4678.846)
    Angles = (0, 0, 0)
    name = KillerWhale_skin
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1584.875, -234.8036, 4233.178)
    Angles = (0, 0, 0)
    name = Zoo_PicnicTable04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    CollisionMode = Geometry
  }
  {
    Position = (-1718.582, -234.8036, 4233.178)
    Angles = (0, 0, 0)
    name = Zoo_PicnicTable03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaTable01
    CollisionMode = Geometry
  }
  {
    Position = (-1716.42, -235.1651, 5246.78)
    Angles = (0, 0, 0)
    name = G_COMPNOT_PicnicTable01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    CollisionMode = Geometry
  }
  {
    Position = (-1582.713, -235.1651, 5246.78)
    Angles = (0, 0, 0)
    name = G_COMPNOT_PicnicTable02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaTable02
    CollisionMode = Geometry
  }
  {
    Position = (1602.393, -234.8873, 5007.283)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Table03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    CollisionMode = Geometry
  }
  {
    Position = (1736.101, -234.8873, 5007.283)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Table04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table03
    CollisionMode = Geometry
  }
  {
    Position = (2091.581, -234.8404, 4747.156)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Table02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    CollisionMode = Geometry
  }
  {
    Position = (1957.874, -234.8404, 4747.156)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Table01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = G_COMPNOT_Table01
    CollisionMode = Geometry
  }
  {
    Position = (2346.671, -234.6871, 5007.477)
    Angles = (0, 0, 0)
    name = Zoo_PicnicNormal01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    CollisionMode = Geometry
  }
  {
    Position = (2480.378, -234.6871, 5007.477)
    Angles = (0, 0, 0)
    name = Zoo_PicnicNormal02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_PicnicNormal01
    CollisionMode = Geometry
  }
  {
    Position = (-2900.67, -31.95847, 1031.849)
    Angles = (0, 0, 0)
    name = TRG_982
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_988 ]
  }
  {
    Position = (-2900.672, -31.95844, 14.7507)
    Angles = (0, 0, 0)
    name = TRG_983
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_982 ]
  }
  {
    Position = (-1977.682, -31.95844, 14.7507)
    Angles = (0, 0, 0)
    name = TRG_984
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_985 ]
  }
  {
    Position = (-1977.68, -31.95847, 1029.36)
    Angles = (0, 0, 0)
    name = TRG_985
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_989 ]
  }
  {
    Position = (-1982.348, -31.95844, -3.94399)
    Angles = (0, 0, 0)
    name = TRG_986
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP02
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_984 ]
  }
  {
    Position = (-2896.37, -31.95844, -3.94399)
    Angles = (0, 0, 0)
    name = TRG_987
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP01
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_983 ]
  }
  {
    Position = (-2888.011, -31.95847, 1052.583)
    Angles = (0, 0, 0)
    name = TRG_988
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP01
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-1989.924, -31.95847, 1050.094)
    Angles = (0, 0, 0)
    name = TRG_989
    Class = RailNode
    type = Wood
    CreatedAtStart
    TrickObject Cluster = Aviary_QP02
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-613.7775, -261.2273, 6048.143)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge07
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge01 ]
  }
  {
    Position = (-327.0842, -261.2273, 6047.954)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge08
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
    Links = [ TRG_RailHippoBridge04 ]
  }
  {
    Position = (-615.1635, -261.2273, 5656.43)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge09
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-324.6932, -261.2273, 5656.43)
    Angles = (0, 0, 0)
    name = TRG_RailHippoBridge10
    Class = RailNode
    type = Wood
    TerrainType = TERRAIN_WOOD
  }
  {
    Position = (-4505.404, -228.6045, 3088.474)
    Angles = (0, 0, 0)
    name = Zoo_PenguinRail
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4506.086, -509.9981, 3175.624)
    Angles = (0, 0, 0)
    name = AQUA_PenguinArea
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart02 ]
    TriggerScript = AQUA_PenguinAreaScript
  }
  {
    Position = (-4506.062, -645.7122, 3427.947)
    Angles = (0, 0, 0)
    name = Zoo_PenguinGround
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4506.061, -607.481, 3108.505)
    Angles = (0, 0, 0)
    name = Sk3Ed_QPd_10x10x142
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4504.917, -245.9741, 2835.934)
    Angles = (0, 0, 0)
    name = AQUA_Lamp
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3954.817, -337.2175, 5868.26)
    Angles = (0, 0, 0)
    name = InvisoCrapFixer
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (119.9999, -157.4548, 2263.138)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_MainStreet
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "MainStreet"
  }
  {
    Position = (-4961.558, -58.39459, 4684.073)
    Angles = (0, 0, 0)
    name = TRGP_MiniGameHeight02
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_MiniGameHeight02Script
  }
  {
    Position = (-5224.894, -334.794, 3923.74)
    Angles = (0, 0, 0)
    name = TRG_Shark01
    Class = Pedestrian
    type = Anl_Shark
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = shark
    AnimName = animload_anl_shark
    model = "animals\anl_shark\anl_shark.skin"
    SuspendDistance = 0
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_SharkNav01 ]
    TriggerScript = TRG_Shark01Script
  }
  {
    Position = (-5224.894, -334.794, 4012.872)
    Angles = (0, 0, 0)
    name = TRG_SharkNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav02 ]
  }
  {
    Position = (-5018.165, -334.794, 4138.87)
    Angles = (0, 0, 0)
    name = TRG_SharkNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav03 ]
  }
  {
    Position = (-4987.965, -334.794, 5318.266)
    Angles = (0, 0, 0)
    name = TRG_SharkNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav04 ]
  }
  {
    Position = (-5288.926, -334.794, 5554.063)
    Angles = (0, 0, 0)
    name = TRG_SharkNav04
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav05 ]
  }
  {
    Position = (-5516.469, -334.794, 5269.15)
    Angles = (0, 0, 0)
    name = TRG_SharkNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav06 ]
  }
  {
    Position = (-5459.951, -334.794, 4146.104)
    Angles = (0, 0, 0)
    name = TRG_SharkNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav20 ]
  }
  {
    Position = (-5162.855, -535.0148, 4650.471)
    Angles = (0, 0, 0)
    name = TRG_SharkNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav12 ]
  }
  {
    Position = (-5047.064, -535.0148, 4776.469)
    Angles = (0, 0, 0)
    name = TRG_SharkNav08
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav07 ]
  }
  {
    Position = (-5016.865, -535.0148, 5129.196)
    Angles = (0, 0, 0)
    name = TRG_SharkNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav08 ]
  }
  {
    Position = (-5226.888, -535.0148, 5274.808)
    Angles = (0, 0, 0)
    name = TRG_SharkNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav09 ]
  }
  {
    Position = (-5375.554, -535.0148, 5080.081)
    Angles = (0, 0, 0)
    name = TRG_SharkNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav10 ]
  }
  {
    Position = (-5319.035, -535.0148, 4783.703)
    Angles = (0, 0, 0)
    name = TRG_SharkNav12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav11 ]
  }
  {
    Position = (-4946.152, -535.0148, 5202.558)
    Angles = (0, 0, 0)
    name = TRG_Shark02
    Class = Pedestrian
    type = Anl_Shark
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = shark
    AnimName = animload_anl_shark
    model = "animals\anl_shark\anl_shark.skin"
    SuspendDistance = 0
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_SharkNav09 ]
    TriggerScript = TRG_Shark02Script
  }
  {
    Position = (-5433.687, -382.0535, 3991.947)
    Angles = (0, 0, 0)
    name = TRG_Shark03
    Class = Pedestrian
    type = Anl_Shark
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = shark
    AnimName = animload_anl_shark
    model = "animals\anl_shark\anl_shark.skin"
    SuspendDistance = 0
    lod_dist1 = 150
    lod_dist2 = 200
    Links = [ TRG_SharkNav19 ]
    TriggerScript = TRG_Shark03Script
  }
  {
    Position = (-5224.894, -382.0535, 4012.872)
    Angles = (0, 0, 0)
    name = TRG_SharkNav13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav14 ]
  }
  {
    Position = (-5018.165, -382.0535, 4138.87)
    Angles = (0, 0, 0)
    name = TRG_SharkNav14
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav15 ]
  }
  {
    Position = (-4987.965, -382.0535, 5318.266)
    Angles = (0, 0, 0)
    name = TRG_SharkNav15
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav16 ]
  }
  {
    Position = (-5288.926, -382.0535, 5554.063)
    Angles = (0, 0, 0)
    name = TRG_SharkNav16
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav17 ]
  }
  {
    Position = (-5516.469, -382.0535, 5269.15)
    Angles = (0, 0, 0)
    name = TRG_SharkNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav18 ]
  }
  {
    Position = (-5459.951, -382.0535, 4146.104)
    Angles = (0, 0, 0)
    name = TRG_SharkNav18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav19 ]
  }
  {
    Position = (-5345.292, -382.0535, 4083.557)
    Angles = (0, 0, 0)
    name = TRG_SharkNav19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav13 ]
  }
  {
    Position = (-5345.292, -334.794, 4083.552)
    Angles = (0, 0, 0)
    name = TRG_SharkNav20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_SharkNav01 ]
  }
  {
    Position = (1356.093, -253.5615, 6947.613)
    Angles = (0, 0, 0)
    name = TRG_Restart_Hills01
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Hills01"
  }
  {
    Position = (-2340.512, -156.3329, 4684.434)
    Angles = (0, 0, 0)
    name = BOARDED_01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2374.632, -263.468, 4656.548)
    Angles = (0, 0, 0)
    name = BounceDoor02
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_DoorWaypoint02 ]
    TriggerScript = BounceDoor02Script
  }
  {
    Position = (-2374.632, -263.468, 4717.948)
    Angles = (0, 0, 0)
    name = BounceDoor03
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_DoorWaypoint01 ]
    TriggerScript = BounceDoor03Script
  }
  {
    Position = (-2362.078, -156.3329, 4684.434)
    Angles = (0, 0, 0)
    name = Damage_Boards
    Class = LevelGeometry
  }
  {
    Position = (-2339.048, -314.3495, 4496.29)
    Angles = (0, 0, 0)
    name = DoorRotate01
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 1000
    lod_dist2 = 1001
    TriggerScript = DoorRotate01Script
  }
  {
    Position = (-2364.27, -255.6353, 4596.853)
    Angles = (0, 0, 0)
    name = BounceDoor01
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_DoorWaypoint04 ]
    TriggerScript = BounceDoor01Script
  }
  {
    Position = (-2354.988, -254.6288, 4774.934)
    Angles = (0, 0, 0)
    name = BounceDoor04
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_DoorWaypoint03 ]
    TriggerScript = BounceDoor04Script
  }
  {
    Position = (-2338.551, -313.3015, 4877.959)
    Angles = (0, 0, 0)
    name = DoorRotate04
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 1000
    lod_dist2 = 1001
    TriggerScript = DoorRotate04Script
  }
  {
    Position = (-2339, -313.6056, 4543.588)
    Angles = (0, 0, 0)
    name = DoorRotate02
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 1000
    lod_dist2 = 1001
    TriggerScript = DoorRotate02Script
  }
  {
    Position = (-2340.002, -314.1296, 4832.764)
    Angles = (0, 0, 0)
    name = DoorRotate03
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 1000
    lod_dist2 = 1001
    TriggerScript = DoorRotate03Script
  }
  {
    Position = (-2341.97, -313.4312, 4496.29)
    Angles = (0, 0, 0)
    name = FallenDoor01
    Class = LevelGeometry
  }
  {
    Position = (-2341.97, -313.4312, 4545.599)
    Angles = (0, 0, 0)
    name = FallenDoor02
    Class = LevelGeometry
  }
  {
    Position = (-2341.97, -313.4312, 4830.282)
    Angles = (0, 0, 0)
    name = FallenDoor03
    Class = LevelGeometry
  }
  {
    Position = (-2341.97, -313.4312, 4877.959)
    Angles = (0, 0, 0)
    name = FallenDoor04
    Class = LevelGeometry
  }
  {
    Position = (-2362.078, -156.3329, 4684.434)
    Angles = (0, 0, 0)
    name = Damage_boards02
    Class = LevelGeometry
  }
  {
    Position = (-2670.245, -306.6101, 4738.321)
    Angles = (0, 0, 0)
    name = TRG_DoorWaypoint01
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (-2670.245, -306.6101, 4636.528)
    Angles = (0, 0, 0)
    name = TRG_DoorWaypoint02
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (-2670.245, -306.6101, 4838.989)
    Angles = (0, 0, 0)
    name = TRG_DoorWaypoint03
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (-2670.245, -306.6101, 4563.065)
    Angles = (0, 0, 0)
    name = TRG_DoorWaypoint04
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (-2346.111, -275.2088, 5260.048)
    Angles = (0, 0, 0)
    name = Occlusion04
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (5578.263, -163.9106, 5035.106)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail01
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail02 ]
  }
  {
    Position = (5514.79, -163.9106, 4918.202)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail02
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail03 ]
  }
  {
    Position = (5495.321, -193.9639, 4901.208)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail03
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail04 ]
  }
  {
    Position = (5475.783, -197.3883, 4858.936)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail04
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (5633.2, -163.9106, 5005.278)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail05
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail06 ]
  }
  {
    Position = (5569.726, -163.9106, 4888.374)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail06
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail07 ]
  }
  {
    Position = (5566.076, -193.9639, 4862.791)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail07
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail08 ]
  }
  {
    Position = (5541.266, -197.3883, 4823.382)
    Angles = (0, -0.49742, 0)
    name = TRG_LRover_Safari_Rail08
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1649.554, -228.7628, 6727.198)
    Angles = (0, 0, 0)
    name = ZElephRhino_Handrail02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    CollisionMode = Geometry
  }
  {
    Position = (2102.398, -228.7627, 5894.845)
    Angles = (0, 0, 0)
    name = ZElephRhino_Handrail03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    CollisionMode = Geometry
  }
  {
    Position = (3479.505, -228.7627, 5641.233)
    Angles = (0, 0, 0)
    name = ZElephRhino_Handrail04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZElephRhino_Handrail01
    CollisionMode = Geometry
  }
  {
    Position = (-1108.126, -668.1764, 589.016)
    Angles = (1.5708, -1.5708, 0)
    name = BigAssOccluderSide01
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (4879.085, -585.579, 6823.627)
    Angles = (1.5708, -1.5708, 0)
    name = OccluderElephantRock
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-3145.354, -294.8931, 3421.668)
    Angles = (0, 1.5708, 0)
    name = Occlusion13
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-3145.354, -294.8931, 5910.129)
    Angles = (0, 1.5708, 0)
    name = Occlusion14
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (5988.916, -216.4857, 5725.128)
    Angles = (0, 0, 0)
    name = InvisoCorner
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2533.091, -18.9314, 5732.835)
    Angles = (0, 0, 0)
    name = AQUA_SmallTank01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2533.091, -18.9314, 3636.033)
    Angles = (0, 0, 0)
    name = AQUA_SmallTank02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3257.805, -203.9381, 5734.771)
    Angles = (0, 0, 0)
    name = SI_PalmLeaves03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    CollisionMode = Geometry
  }
  {
    Position = (3129.692, -349.7828, 6164.082)
    Angles = (0, 0, 0)
    name = SI_PalmTree03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree03
    CollisionMode = Geometry
  }
  {
    Position = (4598.951, -349.9678, 6249.447)
    Angles = (0, 0, 0)
    name = SI_PalmTree13
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    CollisionMode = Geometry
  }
  {
    Position = (2479.191, -349.7828, 6171.083)
    Angles = (0, 0, 0)
    name = SI_PalmTree14
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    CollisionMode = Geometry
  }
  {
    Position = (2319.482, -203.9381, 5752.499)
    Angles = (0, 0, 0)
    name = SI_PalmLeaves04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree14
    CollisionMode = Geometry
  }
  {
    Position = (5070.095, -275.5304, 6121.604)
    Angles = (0, 0, 0)
    name = SI_PalmLeaves05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = SI_PalmTree13
    CollisionMode = Geometry
  }
  {
    Position = (1754.882, 39.0948, 1833.529)
    Angles = (0, 0, 0)
    name = Zoo_Banner10
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1754.882, 39.0948, 2527.021)
    Angles = (0, 0, 0)
    name = Zoo_Banner09
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4113.949, -96.12363, 4916.005)
    Angles = (0, 0, 0)
    name = Zoo_SnackBarSign
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5510.751, -17.22819, 4142.215)
    Angles = (0, 0, 0)
    name = Zoo_Tram_Sign_Move
    Class = LevelObject
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = Zoo_Tram_Sign_MoveScript
  }
  {
    Position = (5510.751, -17.76012, 4152.897)
    Angles = (0, 0, 0)
    name = Zoo_Tram_Sign_Start
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    TriggerScript = Zoo_Tram_Sign_StartScript
  }
  {
    Position = (5510.751, -17.22819, 4142.215)
    Angles = (-1.23918, 0, 0)
    name = Zoo_Tram_Sign_Stop
    Class = LevelGeometry
    TrickObject Cluster = Zoo_Flagpole01
    CollisionMode = Geometry
  }
  {
    Position = (5353.255, -126.1899, 5049.962)
    Angles = (0, 0, 0.08727)
    name = Lion_Banner01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Lion_Banner01
    CollisionMode = Geometry
  }
  {
    Position = (-2695.439, 675.3693, 590.3765)
    Angles = (0, 0, 0)
    name = Zoo_BreakAwayCage01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_BreakAwayCage01Script
  }
  {
    Position = (-2196.533, 675.3693, 590.3765)
    Angles = (0, 0, 0)
    name = Zoo_BreakAwayCage02
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_BreakAwayCage02Script
  }
  {
    Position = (-2445.986, 649.9853, 1036.038)
    Angles = (0, 0, 0)
    name = Zoo_BreakAwayCage03
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_BreakAwayCage03Script
  }
  {
    Position = (-2445.986, 649.9853, 120.9365)
    Angles = (0, 0, 0)
    name = Zoo_BreakAwayCage04
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_BreakAwayCage04Script
  }
  {
    Position = (-431.7267, -14.56661, 2206.564)
    Angles = (0, 0, 0)
    name = Zoo_Kicker06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    CollisionMode = Geometry
  }
  {
    Position = (664.8343, -15.26057, 2206.564)
    Angles = (0, 0, 0)
    name = Zoo_Kicker05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    CollisionMode = Geometry
  }
  {
    Position = (664.8343, -143.051, 3155.163)
    Angles = (0, 0, 0)
    name = Zoo_Kicker02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    CollisionMode = Geometry
  }
  {
    Position = (-431.7267, -143.051, 3155.163)
    Angles = (0, 0, 0)
    name = Zoo_Kicker07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    CollisionMode = Geometry
  }
  {
    Position = (-3654.703, -294.8931, 5816.5)
    Angles = (0, 1.5708, 0)
    name = Occlusion15
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (3038.441, -123.2736, 1806.136)
    Angles = (1.5708, -3.14159, 0)
    name = Zoo_Poop03
    Class = LevelObject
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = Zoo_Poop03Script
  }
  {
    Position = (-2314.718, -2584.011, 2740.521)
    Angles = (0, 0, 0)
    name = ZooKeeper_Floor
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2313.497, -2585.996, 2662.159)
    Angles = (0, 0, 0)
    name = Zoo_Poo_Wall
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2563.025, -2536.126, 2534.512)
    Angles = (1.5708, -1.5708, 0)
    name = Zoo_Poo_Button
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2566.074, -2483.616, 2535.983)
    Angles = (1.5708, 1.5708, 0)
    name = Zoo_ReleaseMonkeys
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (151.491, -272.2322, 5159.631)
    Angles = (0, 0, 0)
    name = TRGP_LeavingComp
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_LeavingCompScript
  }
  {
    Position = (151.491, -272.2322, 5159.631)
    Angles = (0, 0, 0)
    name = TRGP_LeavingComp01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TRGP_LeavingComp01Script
  }
  {
    Position = (-832.6815, -132.7359, 5036.391)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl34
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl36 ]
  }
  {
    Position = (-1132.85, -256.7064, 5036.042)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl35
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl34 ]
  }
  {
    Position = (-823.0082, -124.0499, 5036.391)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl36
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (1365.239, -256.7025, 5036.043)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl37
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl38 ]
  }
  {
    Position = (1067.018, -134.5733, 5036.043)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl38
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_comp_Rail_Bowl39 ]
  }
  {
    Position = (1054.281, -122.0376, 5036.043)
    Angles = (0, 0, 0)
    name = trg_comp_Rail_Bowl39
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2849.337, -243.0652, 5467.766)
    Angles = (1.5708, -1.5708, 0)
    name = Alc_BenchCollision
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    CollisionMode = Geometry
  }
  {
    Position = (3201.686, -243.0652, 5467.766)
    Angles = (1.5708, -1.5708, 0)
    name = Alc_BenchCollision01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    CollisionMode = Geometry
  }
  {
    Position = (3552.017, -243.0652, 5467.766)
    Angles = (1.5708, -1.5708, 0)
    name = Alc_BenchCollision02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    CollisionMode = Geometry
  }
  {
    Position = (3909.591, -243.0652, 5467.766)
    Angles = (1.5708, -1.5708, 0)
    name = Alc_BenchCollision03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    CollisionMode = Geometry
  }
  {
    Position = (-1693.896, -42.47036, -2760.001)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLotFront
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1307.708, -53.42626, -5760.001)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLotFront01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1692.292, -53.42626, -5760.001)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLotFront02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1306.104, -42.47036, -2760.001)
    Angles = (0, 0, 0)
    name = Zoo_ParkingLotFront03
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-7273.38, 33.93076, -890.4172)
    Angles = (0, 1.5708, 0)
    name = zoo_outsidewall_cw
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1913.052, 93.54611, -1897.675)
    Angles = (0, 1.5708, 0)
    name = zoo_outsidewall_cw2
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1306.104, -42.47036, -2760.001)
    Angles = (0, 0, 0)
    name = park02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1693.896, -42.47036, -2760.001)
    Angles = (0, 0, 0)
    name = park01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (3081.681, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_wood_bench_02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    CollisionMode = Geometry
  }
  {
    Position = (2729.332, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_wood_bench_01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    CollisionMode = Geometry
  }
  {
    Position = (3432.012, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_wood_bench_03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    CollisionMode = Geometry
  }
  {
    Position = (3789.586, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_wood_bench_04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    CollisionMode = Geometry
  }
  {
    Position = (106.1041, -21.73384, -3561.537)
    Angles = (0, 0, 0)
    name = Island01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1095.248, 59.28241, -3511.581)
    Angles = (0, 0, 0)
    name = TreeTrunk08
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (242.5457, 80.26331, -3511.059)
    Angles = (0, 0, 0)
    name = TreeTrunk10
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-597.6907, 78.63481, -3511.059)
    Angles = (0, 0, 0)
    name = TreeTrunk11
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (223.9818, 374.1542, -3456.83)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree03
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1098.136, 374.1542, -3456.83)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree04
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-577.0875, 368.7986, -3448.101)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (279.0652, 207.5853, -4909.315)
    Angles = (0, 0, 0)
    name = OuterTree
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (106.1041, -21.73384, -6357.852)
    Angles = (0, 0, 0)
    name = Island05
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (113.3342, -21.73384, -5152.096)
    Angles = (0, 0, 0)
    name = Island04
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2831.882, -21.73384, -3562.476)
    Angles = (0, 0, 0)
    name = Island03
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (3043.151, -21.73384, -3562.476)
    Angles = (0, 0, 0)
    name = Island02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2813.481, 374.1542, -2889.776)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2785.475, 87.13287, -2833.131)
    Angles = (0, 0, 0)
    name = TreeTrunk12
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3010.166, 374.1542, -3049.688)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree05
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (3066.318, 87.13287, -2833.131)
    Angles = (0, 0, 0)
    name = TreeTrunk13
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (128.9143, 204.3938, -6356.655)
    Angles = (0, 0, 0)
    name = OuterTree02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (8401.726, -251.6562, 1457.529)
    Angles = (0, 0, 0)
    name = Island06
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (8401.726, -251.6562, -1339.726)
    Angles = (0, 0, 0)
    name = Island07
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (8408.955, -251.6562, -133.03)
    Angles = (0, 0, 0)
    name = Island08
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (5463.738, -251.6562, 679.4298)
    Angles = (0, 0, 0)
    name = Island09
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (11080.32, -251.6562, 1456.589)
    Angles = (0, 0, 0)
    name = Island10
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (8823.608, -67.72198, 31.22197)
    Angles = (0, 0, 0)
    name = OuterTree01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (7699.849, 144.2318, 1592.702)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree07
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (8502.378, 144.2318, 1592.702)
    Angles = (0, 0, 0)
    name = ParkingLot_Tree08
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (7699.311, -170.6399, 1507.485)
    Angles = (0, 0, 0)
    name = TreeTrunk15
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (8541.489, -164.1432, 1491.238)
    Angles = (0, 0, 0)
    name = TreeTrunk14
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3144.694, -36.68653, 4578.224)
    Angles = (0, 0, 0)
    name = Zoo_Aquarium_Wires
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3426.93, -471.8727, 4458.882)
    Angles = (0, 0, 0)
    name = Zoo_Handrail21
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-4189.879, -606.1809, 4190.399)
    Angles = (0, 0, 0)
    name = AQUA_QP01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4447.519, -679.4807, 4679.784)
    Angles = (0, 0, 0)
    name = Zoo_AquaFloorPiece
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-5385.894, -256.1646, 4678.494)
    Angles = (0, 0, 0)
    name = Zoo_BigTankWater
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart02 ]
    TriggerScript = Zoo_BigTankWaterScript
  }
  {
    Position = (-4189.879, -606.1808, 5386.501)
    Angles = (0, 0, 0)
    name = AQUA_QP02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4215.409, -183.7971, 3982.712)
    Angles = (0, 0, 0)
    name = Zoo_AquaGround02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3426.93, -471.8727, 4907.271)
    Angles = (0, 0, 0)
    name = Zoo_Handrail15
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-5385.902, -458.6082, 5275.244)
    Angles = (0, 0, 0)
    name = Zoo_Aqua_BigTank
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_Aqua_BigTankScript
  }
  {
    Position = (-4506.183, -193.4016, 5850.879)
    Angles = (0, 0, 0)
    name = AQUA_SideTank01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4506.119, -338.4551, 6184.316)
    Angles = (0, 0, 0)
    name = AQUA_SideTank02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3523.23, 217.695, 4496.188)
    Angles = (-2.42369, 0.7179, -1.38061)
    name = Zoo_AquariumVents
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3433.348, 128.7632, 5177.465)
    Angles = (0, 0, 0)
    name = Zoo_AquariumPipes
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4506.086, -631.481, 3735.072)
    Angles = (0, 0, 0)
    name = Sk3Ed_QPd_10x10x141
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4537.037, 175.0414, 4742.059)
    Angles = (0, 0, 0)
    name = Zoo_AquariumHills01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart02 ]
  }
  {
    Position = (-4516.225, -193.4016, 3501.069)
    Angles = (0, 0, 0)
    name = AQUA_Penguin_Door_Damage
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2013.195, 141.0574, 5693.532)
    Angles = (0, 0, 0)
    name = Zoo_AquaGround01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2013.195, -158.3414, 4198.494)
    Angles = (0, 0, 0)
    name = Zoo_AquaGround03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3601.891, -184.2883, 4114.702)
    Angles = (0, 0, 0)
    name = Zoo_SideAquarium02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3601.891, -184.2883, 5255.447)
    Angles = (0, 0, 0)
    name = Zoo_SideAquarium01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4807.456, -607.4807, 4679.787)
    Angles = (0, 0, 0)
    name = Sk3Ed_QPd_10x10x124
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-3268.93, -0.2066, 5260.886)
    Angles = (0, 0, 0)
    name = Zoo_AquariumPipes03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3268.93, 2.19338, 4118.895)
    Angles = (0, 0, 0)
    name = Zoo_AquariumPipes04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2383.686, 47.19456, 4672.377)
    Angles = (0, 0, 0)
    name = Zoo_hj_AquariumBuild01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_hj_AquariumBuild01Script
  }
  {
    Position = (1563.85, -400.9839, 970.3389)
    Angles = (0, 0, 0)
    name = Occlusion
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (4380.297, -132.584, 3361.772)
    Angles = (1.5708, 3.14159, 0)
    name = Zoo_MonkeyPooBlocker
    Class = LevelGeometry
  }
  {
    Position = (4382.352, -259.2882, 2933.892)
    Angles = (0, -3.14159, 0)
    name = TRG_NetGameInit
    Class = GameObject
    type = Ghost
    CreatedAtStart
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_NetGameInitScript
  }
  {
    Position = (4379.247, -139.0029, 3365.097)
    Angles = (0, 0, 0)
    name = Zoo_GiraffeDoorNet
    Class = LevelGeometry
  }
  {
    Position = (-73.20061, -33.34352, -525.4866)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_Multiplayer01
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart1"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (122.8954, -14.66255, 4681.227)
    Angles = (0, 1.5708, 0)
    name = TRG_Restart_Multiplayer02
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart2"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (2638.193, -314.7717, 6751.62)
    Angles = (0, 0, 0)
    name = TRG_Restart_Multiplayer03
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart3"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (3975.18, -215.1389, 4987.489)
    Angles = (0, -1.5708, 0)
    name = TRG_Restart_Multiplayer04
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart4"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (2920.31, -25.41967, 4326.306)
    Angles = (0, 0, 0)
    name = Zoo_Cage01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2532.799, -166.5161, 5824.081)
    Angles = (0, 0, 0)
    name = AQUA_Fish01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2532.795, -160.3436, 3544.315)
    Angles = (0, 0, 0)
    name = AQUA_Fish02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2986.289, 469.7429, 3120.191)
    Angles = (0, 0, 0)
    name = Occlusion17
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (486.0333, -422.3043, 4891.59)
    Angles = (0, 0, 0)
    name = Occluder_Bridge04
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (-257.0879, -422.3043, 4891.59)
    Angles = (0, 0, 0)
    name = Occluder_Bridge05
    Class = LevelGeometry
    Occluder
  }
  {
    Position = (1100.185, -235.6705, 6707.081)
    Angles = (0, 0, 0)
    name = Hippo_bridge_fence02_cw01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    CollisionMode = Geometry
  }
  {
    Position = (852.8008, -235.6705, 5865.002)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Hippo_bridge_fence02_cw02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence02
    CollisionMode = Geometry
  }
  {
    Position = (-990.0146, -254.8721, 5617.388)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Hippo_bridge_fence02_cw03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    CollisionMode = Geometry
  }
  {
    Position = (-1573.074, -254.8721, 5865.002)
    Angles = (0, 0, 0)
    name = Hippo_bridge_fence02_cw04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoFence01
    CollisionMode = Geometry
  }
  {
    Position = (-5385.902, -458.5642, 4507.334)
    Angles = (0, 0, 0)
    name = Zoo_Aqua_BigTank01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = Zoo_Aqua_BigTank01Script
  }
  {
    Position = (-3070.227, -261.119, 5286.874)
    Angles = (0, 0, 0)
    name = SeaWeed01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3084.463, -261.119, 4077.188)
    Angles = (0, 0, 0)
    name = AQUA_SeaWeed04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3471.773, 125.6198, 2948.866)
    Angles = (0, 0, 0)
    name = Zoo_hj_AquariumBuild02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_hj_AquariumBuild02Script
  }
  {
    Position = (-3648.871, 153.3983, 6350.84)
    Angles = (0, 0, 0)
    name = Zoo_hj_AquariumBuild03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_hj_AquariumBuild03Script
  }
  {
    Position = (3478.659, -227.1579, 1320)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyPitFloor03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2518.659, -227.3077, 360.0076)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyPitFloor04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4506.063, -607.481, 2884.008)
    Angles = (0, 0, 0)
    name = Zoo_PenguinGround01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6110.185, -126.2617, 3470.138)
    Angles = (0, 0, 0)
    name = Zoo_TramEntrance02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-426.438, -13.84229, 1923.509)
    Angles = (0, 0, 0)
    name = Zoo_MainStreetRails02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    CollisionMode = Geometry
  }
  {
    Position = (-422.1563, -142.036, 2767.29)
    Angles = (0, 0, 0)
    name = Zoo_MainStreetRails03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    CollisionMode = Geometry
  }
  {
    Position = (-4504.917, -245.9741, 3376.226)
    Angles = (0, 0, 0)
    name = AQUA_Lamp01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2445.986, 284.8467, 1142.389)
    Angles = (0, 0, 0)
    name = Zoo_AviaryCage01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2445.986, 284.9442, 1138.574)
    Angles = (0, 0, 0)
    name = AVIARY_Cage01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2533.091, -18.93138, 5310.446)
    Angles = (0, 0, 0)
    name = Zoo_SideAquarium03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2533.091, -18.93135, 4058.075)
    Angles = (0, 0, 0)
    name = Zoo_SideAquarium04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4506.086, -193.4016, 3719.526)
    Angles = (0, 0, 0)
    name = Zoo_SideAquarium05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-3433.348, 128.7632, 4189.775)
    Angles = (0, 0, 0)
    name = Zoo_AquariumPipes01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4287.407, 128.7632, 4129.556)
    Angles = (0, 0, 0)
    name = AQUA_Pipes
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4287.407, 128.7632, 5236.058)
    Angles = (0, 0, 0)
    name = AQUA_Pipes01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4029.924, -341.6808, 4699.659)
    Angles = (0, 0, 0)
    name = TRG_Proximity_AQUA
    Class = ProximNode
    type = Camera
    CreatedAtStart
    radius = 2400
    TriggerScript = TRG_Proximity_AQUAScript
  }
  {
    Position = (-2934.591, 0, 707.9849)
    Angles = (0, 0, 0)
    name = TRG_Proximity_AVIARY
    Class = ProximNode
    type = Camera
    CreatedAtStart
    radius = 2400
    TriggerScript = TRG_Proximity_AVIARYScript
  }
  {
    Position = (2937.649, 0, 1663.57)
    Angles = (0, 0, 0)
    name = TRG_Proximity_MONKEY
    Class = ProximNode
    type = Camera
    CreatedAtStart
    radius = 2400
    TriggerScript = TRG_Proximity_MONKEYScript
  }
  {
    Position = (4381.492, 630.3152, 3396.749)
    Angles = (0, 0, 0)
    name = InvisoGiraffeBlocker
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2729.332, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_WoodShadow
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench01
    CollisionMode = Geometry
  }
  {
    Position = (3081.681, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_WoodShadow01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench02
    CollisionMode = Geometry
  }
  {
    Position = (3432.012, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_WoodShadow02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench03
    CollisionMode = Geometry
  }
  {
    Position = (3789.586, -227.9484, 5463.407)
    Angles = (1.5708, 1.5708, 0)
    name = Alc_WoodShadow03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Alc_wood_bench04
    CollisionMode = Geometry
  }
  {
    Position = (2524.481, -129.7548, 7282.103)
    Angles = (0, 0, 0)
    name = TRG_990
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_991 ]
  }
  {
    Position = (2549.37, -129.7548, 7282.103)
    Angles = (0, 0, 0)
    name = TRG_991
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_992 ]
  }
  {
    Position = (2562.422, -129.7548, 7296.65)
    Angles = (0, 0, 0)
    name = TRG_992
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_993 ]
  }
  {
    Position = (2743.429, -129.7547, 7296.65)
    Angles = (0, 0, 0)
    name = TRG_993
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_994 ]
  }
  {
    Position = (2756.481, -129.7546, 7282.103)
    Angles = (0, 0, 0)
    name = TRG_994
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_995 ]
  }
  {
    Position = (2781.371, -129.7546, 7282.103)
    Angles = (0, 0, 0)
    name = TRG_995
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2949.763, -129.7548, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_996
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_997 ]
  }
  {
    Position = (2974.652, -129.7548, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_997
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_998 ]
  }
  {
    Position = (2987.704, -129.7548, 7296.649)
    Angles = (0, 0, 0)
    name = TRG_998
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_999 ]
  }
  {
    Position = (3168.711, -129.7547, 7296.649)
    Angles = (0, 0, 0)
    name = TRG_999
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1000 ]
  }
  {
    Position = (3181.763, -129.7546, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1000
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1001 ]
  }
  {
    Position = (3206.652, -129.7546, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1001
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3629.223, -129.7548, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1002
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1003 ]
  }
  {
    Position = (3654.113, -129.7548, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1003
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1004 ]
  }
  {
    Position = (3667.165, -129.7548, 7296.649)
    Angles = (0, 0, 0)
    name = TRG_1004
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1005 ]
  }
  {
    Position = (3848.172, -129.7547, 7296.649)
    Angles = (0, 0, 0)
    name = TRG_1005
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1006 ]
  }
  {
    Position = (3861.224, -129.7546, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1006
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1007 ]
  }
  {
    Position = (3886.113, -129.7546, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1007
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall05
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (4043.755, -129.7548, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1008
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1009 ]
  }
  {
    Position = (4068.644, -129.7548, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1009
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1010 ]
  }
  {
    Position = (4081.696, -129.7548, 7296.649)
    Angles = (0, 0, 0)
    name = TRG_1010
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1011 ]
  }
  {
    Position = (4262.703, -129.7547, 7296.649)
    Angles = (0, 0, 0)
    name = TRG_1011
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1012 ]
  }
  {
    Position = (4275.755, -129.7546, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1012
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1013 ]
  }
  {
    Position = (4300.644, -129.7546, 7282.102)
    Angles = (0, 0, 0)
    name = TRG_1013
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall04
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2322.863, -214.3928, 6986.647)
    Angles = (0, 0, 0)
    name = TRG_1014
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2090.863, -214.393, 6986.647)
    Angles = (0, 0, 0)
    name = TRG_1015
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1016 ]
  }
  {
    Position = (2103.915, -214.393, 7001.194)
    Angles = (0, 0, 0)
    name = TRG_1016
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1017 ]
  }
  {
    Position = (2284.922, -214.3929, 7001.194)
    Angles = (0, 0, 0)
    name = TRG_1017
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1018 ]
  }
  {
    Position = (2297.974, -214.3928, 6986.647)
    Angles = (0, 0, 0)
    name = TRG_1018
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1014 ]
  }
  {
    Position = (2065.973, -214.393, 6986.647)
    Angles = (0, 0, 0)
    name = TRG_1019
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_PitWall03
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1015 ]
  }
  {
    Position = (3659.825, -166.9676, 7407.274)
    Angles = (0, 0, 0)
    name = TRG_1020
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1021 ]
  }
  {
    Position = (4440.001, -166.9676, 7407.274)
    Angles = (0, 0, 0)
    name = TRG_1021
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1022 ]
  }
  {
    Position = (4581.461, -176.2428, 7407.274)
    Angles = (0, 0, 0)
    name = TRG_1022
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1023 ]
  }
  {
    Position = (4722.92, -194.525, 7407.274)
    Angles = (0, 0, 0)
    name = TRG_1023
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1024 ]
  }
  {
    Position = (4842.868, -219.2441, 7407.274)
    Angles = (0, 0, 0)
    name = TRG_1024
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1025 ]
  }
  {
    Position = (4969.591, -255.0432, 7408.165)
    Angles = (0, 0, 0)
    name = TRG_1025
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (4969.562, -255.0432, 7329)
    Angles = (0, 0, 0)
    name = TRG_1026
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (4969.27, -255.0432, 7479.981)
    Angles = (0, 0, 0)
    name = TRG_1027
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1026 ]
  }
  {
    Position = (3659.825, -166.9676, 7472.329)
    Angles = (0, 0, 0)
    name = TRG_1028
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1020 ]
  }
  {
    Position = (-1576.797, -103.3946, 7956.971)
    Angles = (0, 0, 0)
    name = Pumpkin_01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-1577.038, -119.1739, 7955.817)
    Angles = (0, 0, 0)
    name = G_COLLECT2_StartGap01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = G_COLLECT2_StartGap01Script
  }
  {
    Position = (-1704.991, -255.9316, 5634.987)
    Angles = (0, 0, 0)
    name = TRG_G_COLLECT2_Pro
    Class = Pedestrian
    type = Ped_ZooKeeper
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zookeeper\ped_zookeeper.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_G_COLLECT2_ProScript
  }
  {
    Position = (-2250.823, -255.7238, 6848.193)
    Angles = (0, -3.12414, 0)
    name = TRG_G_COLLECT2_RestartNode
    Class = Restart
    type = Horse
    CreatedAtStart
    RestartName = "Gaps2"
    restart_types = [ Horse ]
  }
  {
    Position = (1099.978, -203.0569, 6640.612)
    Angles = (0, 1.5708, 0)
    name = G_COLLECT2_StartGap02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = G_COLLECT2_StartGap02Script
  }
  {
    Position = (1100.219, -187.2777, 6641.766)
    Angles = (0, 1.5708, 0)
    name = Pumpkin_02
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-1339.844, -189.5941, 5634.825)
    Angles = (0, 2.32129, 0)
    name = Pumpkin_03
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-1340.085, -205.3733, 5633.67)
    Angles = (0, 2.32129, 0)
    name = G_COLLECT2_StartGap03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = G_COLLECT2_StartGap03Script
  }
  {
    Position = (4200.479, -379.9376, 6600.834)
    Angles = (0, 0, 0)
    name = TRG_Skitch_Checker
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Skitch_CheckerScript
  }
  {
    Position = (3959.354, -137.6718, 5656.527)
    Angles = (1.5708, 3.14159, 0)
    name = TRG_G_TS3_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Trickspot3 Restart"
    TriggerScript = TRG_G_TS3_RestartNodeScript
  }
  {
    Position = (4491.169, -255.9883, 5606.413)
    Angles = (0, -0.48869, 0)
    name = TRG_G_TS3_Photoguy
    Class = Pedestrian
    type = Ped_ZooEmployee
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    profile = Ped_ZooEmployee_b
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_G_TS3_PhotoguyScript
  }
  {
    Position = (6011.63, 56.12939, 5387.175)
    Angles = (1.5708, 1.5708, 0)
    name = TRG_G_SPECIAL_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Special"
    TriggerScript = TRG_G_SPECIAL_RestartNodeScript
  }
  {
    Position = (6802.641, -51.09279, 4920.407)
    Angles = (0, 0, 0)
    name = InvisoLionQPSmoother
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5570.2, -164.1371, 4948.668)
    Angles = (0, -3.14159, 0)
    name = TRG_G_TS4_PhotoGuy
    Class = Pedestrian
    type = Ped_LionTamer
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    Extra_Anims = animload_ped_LT
    model = "levels\zoo\ped_liontamer\ped_liontamer.skin"
    lod_dist1 = 80
    lod_dist2 = 150
    SuspendDistance = 0
  }
  {
    Position = (3951.801, -227.6853, 4127.197)
    Angles = (0, -2.24275, 0)
    name = TRG_G_TS4_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Trickspot4 Restart"
  }
  {
    Position = (-3558.184, -5.78842, 2231.548)
    Angles = (0, 0, 0)
    name = InvisoCorner02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1019.523, 75.91965, 3279.509)
    Angles = (0, 0, 0)
    name = TRG_1029
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_599 ]
  }
  {
    Position = (-1024.196, 77.76983, 3262.124)
    Angles = (0, 0, 0)
    name = TRG_1030
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Wire03
    DefaultLine
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_1031 ]
  }
  {
    Position = (-1034.6, 77.76983, 3242.825)
    Angles = (0, 0, 0)
    name = TRG_1031
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Wire03
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_893 ]
  }
  {
    Position = (-337.8542, 108.4643, 3843.258)
    Angles = (0, 0, 0)
    name = TRG_1032
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1033 ]
  }
  {
    Position = (-414.1265, 183.547, 3549.712)
    Angles = (0, 0, 0)
    name = TRG_1033
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_576 ]
  }
  {
    Position = (578.3402, 108.2146, 3843.258)
    Angles = (0, 0, 0)
    name = TRG_1034
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_615 ]
  }
  {
    Position = (654.4841, 183.4181, 3549.713)
    Angles = (0, 0, 0)
    name = TRG_1035
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables01
    DefaultLine
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1034 ]
  }
  {
    Position = (6124.186, -255.9884, 4908.15)
    Angles = (0, 0, 0)
    name = TRG_Outro_Lion_01
    Class = Pedestrian
    type = Anl_Lion
    AbsentInNetGames
    SkeletonName = lion
    AnimName = animload_anl_lion
    model = "animals\anl_lion\anl_lion.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_lion_shadow\anl_lion_shadow.mdl"
    Links = [ TRG_LionNav17 ]
    TriggerScript = TRG_Outro_Lion_01Script
  }
  {
    Position = (6024.401, -255.9884, 4950.167)
    Angles = (0, 0, 0)
    name = TRG_LionNav17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_LionNav18 ]
  }
  {
    Position = (5924.639, -255.9884, 5023.712)
    Angles = (0, 0, 0)
    name = TRG_LionNav18
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (5967.982, -255.9884, 4963.386)
    Angles = (0, 0, 0)
    name = TRG_Outro_Lion_02
    Class = Pedestrian
    type = Anl_Lion
    AbsentInNetGames
    SkeletonName = lion
    AnimName = animload_anl_lion
    model = "animals\anl_lion\anl_lion.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    ShadowModel = "animals\anl_lion_shadow\anl_lion_shadow.mdl"
    Links = [ TRG_LionNav20 ]
    TriggerScript = TRG_Outro_Lion_02Script
  }
  {
    Position = (5913.909, -255.9884, 5105.817)
    Angles = (0, 0, 0)
    name = TRG_LionNav20
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (6420.288, 93.82689, 4917.313)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_GapStart_Special
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapStart_SpecialScript
  }
  {
    Position = (5100.078, 169.6985, 4917.313)
    Angles = (1.5708, -1.5708, 0)
    name = TRGP_GapEnd_Special
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_SpecialScript
  }
  {
    Position = (5840.213, -254.4416, 4884.326)
    Angles = (0, 1.5708, 0)
    name = TRG_G_HighCombo2_IntroNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "HighCombo2 IntroNode"
  }
  {
    Position = (-360.0001, -116.8508, 2503.338)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand20
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand21 ]
  }
  {
    Position = (-360.0001, -116.8508, 2318.471)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand21
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (599.9999, -116.8509, 2503.483)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand22
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_Rail_ZooMainHand23 ]
  }
  {
    Position = (599.9999, -116.8509, 2322.584)
    Angles = (0, 0, 0)
    name = TRG_Rail_ZooMainHand23
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (5699.235, -255.7365, 3959.807)
    Angles = (0, 0, 0)
    name = Zoo_Ground05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1786.313, -255.9883, 5417.246)
    Angles = (0, -0.48869, 0)
    name = TRG_G_COUNTER_Pro
    Class = Pedestrian
    type = Ped_PhotoGuy
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "peds\ped_photoguy\ped_photoguy.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Extra_Anims = animload_ped_photo
    TriggerScript = TRG_G_COUNTER_ProScript
  }
  {
    Position = (1287.543, -255.9883, 5180.2)
    Angles = (0, -1.56207, 0)
    name = TRG_G_COUNTER_RestartNode
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Horse Restart"
  }
  {
    Position = (-1911.542, -255.9169, 5395.16)
    Angles = (0, 1.5708, 0)
    name = TRG_CHASE_Lion01
    Class = Pedestrian
    type = Anl_Lion
    AbsentInNetGames
    SkeletonName = lion
    AnimName = animload_anl_lion
    model = "animals\anl_lion\anl_lion.skin"
    SuspendDistance = 10000
    lod_dist1 = 149
    lod_dist2 = 150
    ShadowModel = "animals\anl_lion_shadow\anl_lion_shadow.mdl"
    TriggerScript = TRG_CHASE_Lion01Script
  }
  {
    Position = (-1932.746, -255.9169, 4036.706)
    Angles = (0, 1.5708, 0)
    name = TRG_CHASE_Lion02
    Class = Pedestrian
    type = Anl_Lion
    AbsentInNetGames
    SkeletonName = lion
    AnimName = animload_anl_lion
    model = "animals\anl_lion\anl_lion.skin"
    SuspendDistance = 10000
    lod_dist1 = 149
    lod_dist2 = 150
    ShadowModel = "animals\anl_lion_shadow\anl_lion_shadow.mdl"
    TriggerScript = TRG_CHASE_Lion02Script
  }
  {
    Position = (6146.659, -255.9884, 4920.95)
    Angles = (0, 0, 0)
    name = TRG_Chase_Manager
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 10000
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Chase_ManagerScript
  }
  {
    Position = (6122.358, -255.9884, 4948.732)
    Angles = (0, 0, 0)
    name = TRG_Chase_Effects
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 10000
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Chase_EffectsScript
  }
  {
    Position = (611.3311, 34.74753, 5266.98)
    Angles = (0, 0, 0)
    name = TRGP_LoopPolyStart01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_LoopPolyStart01Script
  }
  {
    Position = (-839.828, -243.2522, 5582.393)
    Angles = (0, 0, 0)
    name = TRG_HippoLovin
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_HippoLovinScript
  }
  {
    Position = (99.53394, -243.2522, 5582.393)
    Angles = (0, 0, 0)
    name = TRG_HippoLovin01
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_HippoLovin01Script
  }
  {
    Position = (2010.091, -50.48206, 5384.979)
    Angles = (0, -1.5708, 0)
    name = trg_g_counter_loop_Rail01
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (2010.091, -50.52452, 5041.561)
    Angles = (0, -1.5708, 0)
    name = trg_g_counter_loop_Rail02
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_counter_loop_Rail01 ]
  }
  {
    Position = (-64.2888, -50.52452, 5610.532)
    Angles = (0, 1.5708, 0)
    name = trg_g_counter_loop_Rail03
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ trg_g_counter_loop_Rail04 ]
  }
  {
    Position = (-64.28853, -50.48206, 5267.114)
    Angles = (0, 1.5708, 0)
    name = trg_g_counter_loop_Rail04
    Class = RailNode
    type = Metal
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (792.092, 76.43586, 5266.98)
    Angles = (0, 0, 0)
    name = TRGP_LoopPolyEnd02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_LoopPolyEnd02Script
  }
  {
    Position = (1509.166, -254.4416, 5905.49)
    Angles = (0, 1.82387, 0)
    name = TRG_Ped_TramRider01
    Class = Pedestrian
    type = Anl_Gorilla
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = Gorilla
    AnimName = animload_anl_gorilla
    model = "animals\anl_gorilla\anl_gorilla.skin"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Ped_TramRider01Script
  }
  {
    Position = (1399.745, 35.79189, 5339.161)
    Angles = (0, 0, 0)
    name = BobChallenge1_TRGP_LoopCheck
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge1_TRGP_LoopCheckScript
  }
  {
    Position = (1206.918, 96.5351, 5333.703)
    Angles = (0, 0, 0)
    name = BobChallenge1_TRGP_LoopPolyEnd
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge1_TRGP_LoopPolyEndScript
  }
  {
    Position = (1778.554, -255.9883, 5463.139)
    Angles = (0, -0.48869, 0)
    name = TRG_G_COUNTER_Loop_ChallengeObj
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 10000
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_G_COUNTER_Loop_ChallengeObjScript
  }
  {
    Position = (795.3787, 76.43586, 5266.98)
    Angles = (0, 0, 0)
    name = BobChallenge1_TRGP01
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge1_TRGP01Script
  }
  {
    Position = (1203.643, 76.43586, 5321.641)
    Angles = (0, 0, 0)
    name = BobChallenge1_TRGP02
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge1_TRGP02Script
  }
  {
    Position = (795.3787, 76.43586, 5268.791)
    Angles = (0, 0, 0)
    name = BobChallenge2_TRGP01
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge2_TRGP01Script
  }
  {
    Position = (1305.643, 76.43586, 5443.427)
    Angles = (0, 0, 0)
    name = BobChallenge2_TRGP02
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge2_TRGP02Script
  }
  {
    Position = (1407.643, 76.43586, 5545.443)
    Angles = (0, 0, 0)
    name = BobChallenge3_TRGP01
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge3_TRGP01Script
  }
  {
    Position = (795.3787, 76.43586, 5268.791)
    Angles = (0, 0, 0)
    name = BobChallenge3_TRGP02
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge3_TRGP02Script
  }
  {
    Position = (6145.119, -255.9884, 4948.732)
    Angles = (0, 0, 0)
    name = TRG_Text_Chase
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 10000
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Text_ChaseScript
  }
  {
    Position = (1503.843, 35.79189, 5357.161)
    Angles = (0, 0, 0)
    name = BobChallenge2_TRGP_LoopCheck
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge2_TRGP_LoopCheckScript
  }
  {
    Position = (1603.891, 35.79189, 5375.161)
    Angles = (0, 0, 0)
    name = BobChallenge3_TRGP_LoopCheck
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge3_TRGP_LoopCheckScript
  }
  {
    Position = (1308.029, 96.5351, 5351.703)
    Angles = (0, 0, 0)
    name = BobChallenge2_TRGP_LoopPolyEnd
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge2_TRGP_LoopPolyEndScript
  }
  {
    Position = (1410.103, 96.5351, 5369.703)
    Angles = (0, 0, 0)
    name = BobChallenge3_TRGP_LoopPolyEnd
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = BobChallenge3_TRGP_LoopPolyEndScript
  }
  {
    Position = (1808.49, 0, 5449.599)
    Angles = (0, 0, 0)
    name = TRG_SkaterLanded
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
  }
  {
    Position = (1835.978, 0, 5449.599)
    Angles = (0, 0, 0)
    name = TRG_SkaterBailed
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
  }
  {
    Position = (1078.668, -241.0302, 5394.561)
    Angles = (0, 0, 0)
    name = G_Counter_Loop_Bail
    Class = LevelGeometry
    CollisionMode = Geometry
    TriggerScript = G_Counter_Loop_BailScript
  }
  {
    Position = (-571.8275, 44.36098, -1405.08)
    Angles = (0, 0, 0)
    name = TRG_1036
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-662.9531, 44.36098, -1316.901)
    Angles = (0, 0, 0)
    name = TRG_1037
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1036 ]
  }
  {
    Position = (-698.4073, 44.36098, -1205.788)
    Angles = (0, 0, 0)
    name = TRG_1038
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1037 ]
  }
  {
    Position = (-696.2495, 44.36098, -1086.413)
    Angles = (0, 0, 0)
    name = TRG_1039
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1038 ]
  }
  {
    Position = (-678.8056, 44.361, -840.0005)
    Angles = (0, 0, 0)
    name = TRG_1040
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1039 ]
  }
  {
    Position = (-643.1589, 44.36102, -599.2066)
    Angles = (0, 0, 0)
    name = TRG_1041
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1040 ]
  }
  {
    Position = (-595.2624, 44.36102, -362.5963)
    Angles = (0, 0, 0)
    name = TRG_1042
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1041 ]
  }
  {
    Position = (-549.5953, 44.36103, -237.2503)
    Angles = (0, 0, 0)
    name = TRG_1043
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1042 ]
  }
  {
    Position = (-520.6368, 44.36103, -121.2765)
    Angles = (0, 0, 0)
    name = TRG_1044
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1043 ]
  }
  {
    Position = (-522.8662, 44.36105, 120.0056)
    Angles = (0, 0, 0)
    name = TRG_1045
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1044 ]
  }
  {
    Position = (-570.7628, 44.36105, 234.9859)
    Angles = (0, 0, 0)
    name = TRG_1046
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1045 ]
  }
  {
    Position = (-678.8056, 44.36105, 360.0003)
    Angles = (0, 0, 0)
    name = TRG_1047
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1046 ]
  }
  {
    Position = (-785.5793, 44.36106, 481.2319)
    Angles = (0, 0, 0)
    name = TRG_1048
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1047 ]
  }
  {
    Position = (-827.2487, 44.36106, 599.5211)
    Angles = (0, 0, 0)
    name = TRG_1049
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1048 ]
  }
  {
    Position = (-814.6643, 44.36108, 715.7252)
    Angles = (0, 0, 0)
    name = TRG_1050
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1049 ]
  }
  {
    Position = (-786.5754, 44.36108, 841.0234)
    Angles = (0, 0, 0)
    name = TRG_1051
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1050 ]
  }
  {
    Position = (-639.9247, 44.36108, 1081.006)
    Angles = (0, 0, 0)
    name = TRG_1052
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1051 ]
  }
  {
    Position = (-534.1501, 14.66241, 1207.105)
    Angles = (0, 0, 0)
    name = TRG_1053
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1052 ]
  }
  {
    Position = (-472.4883, -22.77924, 1298.191)
    Angles = (0, 0, 0)
    name = TRG_1054
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1053 ]
  }
  {
    Position = (822.1659, 5.945, 1207.105)
    Angles = (0, 0, 0)
    name = TRG_1055
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (929.7112, 21.38786, 1080.684)
    Angles = (0, 0, 0)
    name = TRG_1056
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1055 ]
  }
  {
    Position = (1055.575, 21.38786, 840.7017)
    Angles = (0, 0, 0)
    name = TRG_1057
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1056 ]
  }
  {
    Position = (1095.859, 21.38786, 715.4034)
    Angles = (0, 0, 0)
    name = TRG_1058
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1057 ]
  }
  {
    Position = (1108.443, 21.38785, 599.1993)
    Angles = (0, 0, 0)
    name = TRG_1059
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1058 ]
  }
  {
    Position = (1066.774, 21.38785, 480.9102)
    Angles = (0, 0, 0)
    name = TRG_1060
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1059 ]
  }
  {
    Position = (959.9999, 21.38788, 359.6786)
    Angles = (0, 0, 0)
    name = TRG_1061
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1060 ]
  }
  {
    Position = (851.957, 21.38783, 234.9856)
    Angles = (0, 0, 0)
    name = TRG_1062
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1061 ]
  }
  {
    Position = (804.0605, 21.38783, 120.0054)
    Angles = (0, 0, 0)
    name = TRG_1063
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1062 ]
  }
  {
    Position = (801.8311, 21.38782, -128.3826)
    Angles = (0, 0, 0)
    name = TRG_1064
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1063 ]
  }
  {
    Position = (830.7896, 21.38782, -244.3564)
    Angles = (0, 0, 0)
    name = TRG_1065
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1064 ]
  }
  {
    Position = (876.4567, 21.3878, -369.7025)
    Angles = (0, 0, 0)
    name = TRG_1066
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1065 ]
  }
  {
    Position = (924.3531, 21.3878, -606.3127)
    Angles = (0, 0, 0)
    name = TRG_1067
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1066 ]
  }
  {
    Position = (959.9999, 21.38778, -847.1067)
    Angles = (0, 0, 0)
    name = TRG_1068
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1067 ]
  }
  {
    Position = (977.4437, 21.38777, -1086.414)
    Angles = (0, 0, 0)
    name = TRG_1069
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1068 ]
  }
  {
    Position = (979.6016, 21.38777, -1205.788)
    Angles = (0, 0, 0)
    name = TRG_1070
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1069 ]
  }
  {
    Position = (946.9288, 21.38777, -1316.902)
    Angles = (0, 0, 0)
    name = TRG_1071
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1070 ]
  }
  {
    Position = (769.5854, 21.38774, -1441.087)
    Angles = (0, 0, 0)
    name = TRG_1072
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1071 ]
  }
  {
    Position = (24.3114, -203.0569, 8048.103)
    Angles = (0, 0, 0)
    name = G_COLLECT2_StartGap04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = G_COLLECT2_StartGap04Script
  }
  {
    Position = (24.55237, -187.2777, 8049.257)
    Angles = (0, 0, 0)
    name = Pumpkin_04
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (142.0069, 0, -1614.433)
    Angles = (0, -3.14159, 0)
    name = Trg_AnimloadDummy
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    Extra_Anims = animload_Ped_Egg
  }
  {
    Position = (972.8212, -238.1183, 7473.951)
    Angles = (0, 0, 0)
    name = TRG_1073
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (588.5474, -197.3074, 8040.008)
    Angles = (0, 0, 0)
    name = TRG_1074
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_807 ]
  }
  {
    Position = (608.1077, -197.3074, 8028.309)
    Angles = (0, 0, 0)
    name = TRG_1075
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_815 ]
  }
  {
    Position = (-1307.24, -197.1423, 8040.006)
    Angles = (0, 0, 0)
    name = TRG_1076
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1074 ]
  }
  {
    Position = (-1329.09, -197.1423, 8030.603)
    Angles = (0, 0, 0)
    name = TRG_1077
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_783 ]
  }
  {
    Position = (-5282.597, 0, 2088.996)
    Angles = (0, 0, 0)
    name = TRG_Initializer
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_InitializerScript
  }
  {
    Position = (3718.873, -310.229, 6548.311)
    Angles = (0, 0, 0)
    name = TRG_Elephant_Turd_Dummy
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Elephant_Turd_DummyScript
  }
  {
    Position = (3776.007, -311.6413, 6415.021)
    Angles = (0, 0, 0)
    name = TRG_TurdNav01
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav02 ]
  }
  {
    Position = (3790.127, -331.4516, 6384.76)
    Angles = (0, 0, 0)
    name = TRG_TurdNav02
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav03 ]
  }
  {
    Position = (3793.535, -336.0585, 6398.731)
    Angles = (0, 0, 0)
    name = TRG_TurdNav03
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav04 ]
  }
  {
    Position = (3783.924, -336.0585, 6436.653)
    Angles = (0, 0, 0)
    name = TRG_TurdNav04
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (4459.158, -310.229, 6304.867)
    Angles = (0, 2.19039, 0)
    name = TRG_Elephant_Turd_Dummy01
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Elephant_Turd_Dummy01Script
  }
  {
    Position = (4533.445, -311.6413, 6428.333)
    Angles = (0, 2.19039, 0)
    name = TRG_TurdNav05
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav06 ]
  }
  {
    Position = (4548.896, -331.4516, 6456.268)
    Angles = (0, 2.19039, 0)
    name = TRG_TurdNav06
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav07 ]
  }
  {
    Position = (4537.577, -336.0585, 6452.511)
    Angles = (0, 2.19039, 0)
    name = TRG_TurdNav07
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav08 ]
  }
  {
    Position = (4512.285, -336.0585, 6422.666)
    Angles = (0, 2.19039, 0)
    name = TRG_TurdNav08
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (4006.188, -311.6413, 6920.098)
    Angles = (0, -1.8675, 0)
    name = TRG_TurdNav09
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav10 ]
  }
  {
    Position = (3974.62, -331.4516, 6915.352)
    Angles = (0, -1.8675, 0)
    name = TRG_TurdNav10
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav11 ]
  }
  {
    Position = (3984.491, -336.0585, 6908.658)
    Angles = (0, -1.8675, 0)
    name = TRG_TurdNav11
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_TurdNav12 ]
  }
  {
    Position = (4023.566, -336.0585, 6906.761)
    Angles = (0, -1.8675, 0)
    name = TRG_TurdNav12
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (4149.363, -310.229, 6936.324)
    Angles = (0, -1.8675, 0)
    name = TRG_Elephant_Turd_Dummy02
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Elephant_Turd_Dummy02Script
  }
  {
    Position = (2261.935, -227.3464, 1541.75)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_Multiplayer05
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart5"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (-2280, -88.43515, 2771.487)
    Angles = (0, 2.37365, 0)
    name = TRG_Restart_Multiplayer06
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart6"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (1352.529, -256.0451, 7012.698)
    Angles = (0, 0, 0)
    name = TRG_Restart_Multiplayer07
    Class = Restart
    type = Multiplayer
    CreatedAtStart
    RestartName = "Multi: Restart7"
    restart_types = [ Multiplayer ]
  }
  {
    Position = (5676.363, -37.84364, 3908.287)
    Angles = (0, -3.14159, 0)
    name = TRG_Restart_Multiplayer08
    Class = Restart
    type = UserDefined
    CreatedAtStart
    RestartName = "Multi: Restart4"
    restart_types = [ Multiplayer Horse ]
  }
  {
    Position = (995.2848, -35.39775, 2278.252)
    Angles = (0, 0, 0)
    name = Zoo_MainBank03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart_MainStreet ]
    TriggerScript = Zoo_MainBank03Script
  }
  {
    Position = (-2267.344, -149.6288, 1969.033)
    Angles = (0, 0, 0)
    name = Zoo_AviaryBench01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AviaryBench01
    CollisionMode = Geometry
  }
  {
    Position = (-2616.444, -149.6919, 1969.011)
    Angles = (0, 0, 0)
    name = Zoo_AviaryBench02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AviaryBench02
    CollisionMode = Geometry
  }
  {
    Position = (-2271.968, 256.252, 4168.351)
    Angles = (0, 0, 0)
    name = Zoo_AquaWaveQP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = AquaWaveQP02
  }
  {
    Position = (-359.9984, -228.6624, 7707.74)
    Angles = (0, 0, 0)
    name = Zoo_HippoBackWall
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = HippoBackWall
    CollisionMode = Geometry
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = Zoo_HippoBackWallScript
  }
  {
    Position = (122.6922, -111.3867, 4448.666)
    Angles = (0, 0, 0)
    name = Bridge_Normal_Rail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BridgeRail01
  }
  {
    Position = (122.6922, -111.3867, 4906.861)
    Angles = (0, 0, 0)
    name = Bridge_Normal_Rail02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BridgeRail02
  }
  {
    Position = (2635.271, -198.5433, 1828.743)
    Angles = (0, 0, 0)
    name = MONKEY_Rail03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail03
    CollisionMode = Geometry
  }
  {
    Position = (2367.993, -199.4528, 438.7211)
    Angles = (0, 0, 0)
    name = MONKEY_Rail04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = MONKEY_Rail04
    CollisionMode = Geometry
  }
  {
    Position = (4580.203, -236.3683, 3836.543)
    Angles = (0, 0, 0)
    name = Zoo_GiraffePen04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffePen04
    Links = [ TRG_RestartNode01 ]
    TriggerScript = Zoo_GiraffePen04Script
  }
  {
    Position = (4715.427, -7.91116, 3342.75)
    Angles = (0, 0, 0)
    name = Zoo_GiraffeQP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffeQP01
  }
  {
    Position = (4124.43, -7.91119, 3342.75)
    Angles = (0, 0, 0)
    name = Zoo_GiraffeQP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_GiraffeQP02
  }
  {
    Position = (5353.255, -126.1899, 5049.962)
    Angles = (0, 0, 0.08727)
    name = Lion_Banner02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Lion_Banner02
    CollisionMode = Geometry
  }
  {
    Position = (-173.1579, -147.3862, 6363.608)
    Angles = (0, 0, 0)
    name = Zoo_HippoTooth01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth01
    CollisionMode = Geometry
  }
  {
    Position = (-749.7351, -145.2051, 6446.288)
    Angles = (0, 0, 0)
    name = Zoo_HippoTooth02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth02
    CollisionMode = Geometry
  }
  {
    Position = (-916.2959, -109.4162, 7290.626)
    Angles = (0, 0, 0)
    name = Zoo_HippoTooth03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth03
    CollisionMode = Geometry
  }
  {
    Position = (-785.4857, -122.8867, 7648.308)
    Angles = (0, 0, 0)
    name = Zoo_HippoTooth04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_HippoTooth04
    CollisionMode = Geometry
  }
  {
    Position = (6743.3, -212.7164, 4440.017)
    Angles = (0, 0, 0)
    name = Zoo_LionQP04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks02
    CollisionMode = Geometry
  }
  {
    Position = (2720.522, -335.9187, 6707.264)
    Angles = (0, 0, 0)
    name = Zoo_RhinoGround02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_RhinoGround02
    CollisionMode = Geometry
  }
  {
    Position = (995.1684, 249.149, 2766.062)
    Angles = (0, 0, 0)
    name = BuildingTop01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BuildingTop01
    CollisionMode = Geometry
  }
  {
    Position = (978.5705, 189.4536, 1790.131)
    Angles = (0, 0, 0)
    name = BuildingLedge
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BuildingLedge
    CollisionMode = Geometry
  }
  {
    Position = (978.3489, 63.75374, 2782.887)
    Angles = (0, 0, 0)
    name = BuildingLedge03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BuildingLedge03
    CollisionMode = Geometry
  }
  {
    Position = (2443.097, -338.6826, 7216.797)
    Angles = (0, 0, 0)
    name = ZRhino_Trench07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench07
    Links = [ TRG_Restart06 ]
    TriggerScript = ZRhino_Trench07Script
  }
  {
    Position = (3199.655, -291.6987, 7379.622)
    Angles = (0, 0, 0)
    name = ZRhino_Trench08
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZRhino_Trench08
    Links = [ TRG_Restart06 ]
    TriggerScript = ZRhino_Trench08Script
  }
  {
    Position = (4228.509, -351.2796, 7271.218)
    Angles = (0, 0, 0)
    name = ZEleph_Trench07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench07
    Links = [ TRG_Restart05 ]
    TriggerScript = ZEleph_Trench07Script
  }
  {
    Position = (119.8014, 166.8355, 1327.333)
    Angles = (0, -3.14159, 0)
    name = TRG_CTF_BLUE
    Class = GameObject
    type = Flag_Blue
    model = "gameobjects\flags\flag_blue\flag_blue.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_BLUEScript
  }
  {
    Position = (9.24174, 166.8355, 1327.333)
    Angles = (0, -3.14159, 0)
    name = TRG_CTF_RESTART_BLUE
    Class = Restart
    type = CTF
    CreatedAtStart
    RestartName = "Team: CTF"
    restart_types = [ CTF ]
  }
  {
    Position = (4270.139, -23.65619, 4917.558)
    Angles = (0, -1.5708, 0)
    name = TRG_CTF_RESTART_GREEN
    Class = Restart
    type = CTF
    CreatedAtStart
    RestartName = "Team: CTF"
    restart_types = [ CTF ]
  }
  {
    Position = (4270.139, -23.65619, 5028.118)
    Angles = (0, -1.5708, 0)
    name = TRG_CTF_GREEN
    Class = GameObject
    type = Flag_Green
    model = "gameobjects\flags\flag_green\flag_green.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_GREENScript
  }
  {
    Position = (3834.736, 110.6326, -29.68365)
    Angles = (0, -3.14159, 0)
    name = TRG_CTF_RED
    Class = GameObject
    type = Flag_Red
    model = "gameobjects\flags\flag_red\flag_red.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_REDScript
  }
  {
    Position = (3773.501, 110.6326, 18.83871)
    Angles = (0, -2.31256, 0)
    name = TRG_CTF_RESTART_RED
    Class = Restart
    type = CTF
    CreatedAtStart
    RestartName = "Team: CTF"
    restart_types = [ CTF ]
  }
  {
    Position = (-390.4544, -197.0778, 7389.969)
    Angles = (0, 0, 0)
    name = TRG_CTF_RESTART_YELLOW
    Class = Restart
    type = CTF
    CreatedAtStart
    RestartName = "Team: CTF"
    restart_types = [ CTF ]
  }
  {
    Position = (-501.0142, -207.8241, 7389.969)
    Angles = (0, -3.14159, 0)
    name = TRG_CTF_YELLOW
    Class = GameObject
    type = Flag_Yellow
    model = "gameobjects\flags\flag_yellow\flag_yellow.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_YELLOWScript
  }
  {
    Position = (1348.038, 57.77873, 7310.711)
    Angles = (0, 0, 0)
    name = TRG_KOTH05
    Class = GenericNode
    type = Crown
    CreatedAtStart
  }
  {
    Position = (1807.71, 79.32508, 1523.916)
    Angles = (0, 0, 0)
    name = TRG_KOTH06
    Class = GenericNode
    type = Crown
    CreatedAtStart
  }
  {
    Position = (-402.8617, -154.278, 8051.057)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_05
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_05Script
  }
  {
    Position = (-2314.833, 196.4158, 4710.215)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_06
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_06Script
  }
  {
    Position = (2459.683, 150.856, 1427.517)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_07
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_07Script
  }
  {
    Position = (-465.9737, 92.03268, 2746.282)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_08
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_08Script
  }
  {
    Position = (700.5342, 92.03268, 2746.282)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_09
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_09Script
  }
  {
    Position = (-3852.757, 345.1213, 1983.485)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_10
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_10Script
  }
  {
    Position = (-3692.435, -28.26737, 4678.514)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_11
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_11Script
  }
  {
    Position = (4382.957, 33.46268, 3413.666)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_12
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_12Script
  }
  {
    Position = (6008.174, 75.10764, 4936.286)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_13
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_13Script
  }
  {
    Position = (3159.372, -85.41571, 7285.625)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_14
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_14Script
  }
  {
    Position = (3780.374, -85.41571, 7280.883)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_15
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_15Script
  }
  {
    Position = (1309.179, 91.895, 3251.55)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_16
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_16Script
  }
  {
    Position = (1704.393, 104.8156, 2082.246)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_17
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_17Script
  }
  {
    Position = (5102.674, -139.0192, 6848.02)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_18
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_18Script
  }
  {
    Position = (-2445.054, 181.8343, 522.2712)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_19
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_19Script
  }
  {
    Position = (-2781.622, 189.0448, 857.08)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_20
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_20Script
  }
  {
    Position = (-2026.139, 250.3695, 132.8871)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_21
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_21Script
  }
  {
    Position = (2375.851, -163.1648, 5927.811)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_22
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_22Script
  }
  {
    Position = (3190.371, -163.1648, 5934.228)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_23
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_23Script
  }
  {
    Position = (4821.935, -192.5968, 6193.1)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_24
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_24Script
  }
  {
    Position = (-2270.317, -147.3041, 6705.417)
    Angles = (0, 0, 0)
    name = TRG_CASH_ICON_25
    Class = GameObject
    type = Goal_Money
    CreatedAtStart
    AbsentInNetGames
    model = "gameobjects\goal_money\goal_money.mdl"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_CASH_ICON_25Script
  }
  {
    Position = (119.8014, 166.8355, 1327.333)
    Angles = (0, -3.14159, 0)
    name = TRG_CTF_BLUE_BASE
    Class = GameObject
    type = Flag_Blue_Base
    model = "gameobjects\flags\flag_blue_base\flag_blue_base.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_BLUE_BASEScript
  }
  {
    Position = (4270.139, -23.65619, 5028.118)
    Angles = (0, -1.5708, 0)
    name = TRG_CTF_GREEN_BASE
    Class = GameObject
    type = Flag_Green_Base
    model = "gameobjects\flags\flag_green_base\flag_green_base.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_GREEN_BASEScript
  }
  {
    Position = (3834.736, 110.6326, -29.68369)
    Angles = (0, -3.14159, 0)
    name = TRG_CTF_RED_BASE
    Class = GameObject
    type = Flag_Red_Base
    model = "gameobjects\flags\flag_red_base\flag_red_base.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_RED_BASEScript
  }
  {
    Position = (-501.0142, -207.8241, 7389.969)
    Angles = (0, 0, 0)
    name = TRG_CTF_YELLOW_BASE
    Class = GameObject
    type = Flag_Yellow_Base
    model = "gameobjects\flags\flag_yellow_base\flag_yellow_base.mdl"
    SuspendDistance = 0
    lod_dist1 = 800
    lod_dist2 = 801
    TriggerScript = TRG_CTF_YELLOW_BASEScript
  }
  {
    Position = (-2699.389, -170.2395, 112.0117)
    Angles = (0, 0, 0)
    name = TRG_MG_Kaboom
    Class = LevelObject
    type = Normal
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_MG_KaboomScript
  }
  {
    Position = (-2831.796, 159.1944, 684.215)
    Angles = (0, 0, 0)
    name = TRG_Egg01
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Egg01Script
  }
  {
    Position = (-2831.796, 159.1944, 530.3181)
    Angles = (0, 0, 0)
    name = TRG_Egg02
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Egg02Script
  }
  {
    Position = (-2831.796, 159.1944, 378.8058)
    Angles = (0, 0, 0)
    name = TRG_Egg03
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Egg03Script
  }
  {
    Position = (-2831.796, 159.1944, 684.215)
    Angles = (0, 0, 0)
    name = TRG_Egg04
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Egg04Script
  }
  {
    Position = (-2831.796, 159.1944, 530.3181)
    Angles = (0, 0, 0)
    name = TRG_Egg05
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Egg05Script
  }
  {
    Position = (-2831.796, 159.1944, 378.8058)
    Angles = (0, 0, 0)
    name = TRG_Egg06
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Egg06Script
  }
  {
    Position = (-2090.498, -203.0119, 5319.673)
    Angles = (0, 0, 0)
    name = BushCollision01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision01Script
  }
  {
    Position = (-2090.498, -203.0119, 4347.518)
    Angles = (0, 0, 0)
    name = BushCollision02
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision02Script
  }
  {
    Position = (-1688.369, -203.0119, 3933.603)
    Angles = (0, 1.66143, 0)
    name = BushCollision03
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision03Script
  }
  {
    Position = (-2658.166, -125.9969, 2686.96)
    Angles = (0, 0, 0)
    name = BushCollision04
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision04Script
  }
  {
    Position = (-2415.682, -125.9969, 3452.576)
    Angles = (0, 0, 0)
    name = BushCollision05
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision05Script
  }
  {
    Position = (-1995.087, -139.2337, 2508.393)
    Angles = (0, 0, 0)
    name = BushCollision06
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision06Script
  }
  {
    Position = (-1592.734, -152.9119, 2924.342)
    Angles = (0, 0, 0)
    name = BushCollision07
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision07Script
  }
  {
    Position = (-1201.648, -174.8687, 3038.699)
    Angles = (0, 0, 0)
    name = BushCollision08
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision08Script
  }
  {
    Position = (1011.387, -194.8324, 3337.463)
    Angles = (0, 0, 0)
    name = BushCollision09
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision09Script
  }
  {
    Position = (2449.286, -194.8324, 3597.036)
    Angles = (0, 0, 0)
    name = BushCollision10
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision10Script
  }
  {
    Position = (6061.541, -194.8324, 5715.602)
    Angles = (0, 0, 0)
    name = BushCollision11
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision11Script
  }
  {
    Position = (3045.357, -139.0023, 893.236)
    Angles = (0, 0, 0)
    name = MONKEY_Bush01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2966.895, 152.9922, 820.7766)
    Angles = (0, 0, 0)
    name = Zoo_monkeyBush22
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5449.61, -255.6618, 5944.36)
    Angles = (0, 0, 0)
    name = zoo_weed02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5523.732, -255.6618, 5809.118)
    Angles = (0, 0, 0)
    name = zoo_weed03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2853.498, 37.43095, 2842.424)
    Angles = (0, 0, 0)
    name = TreeTrunk05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1700.285, -12.76833, 2843.124)
    Angles = (0, 0, 0)
    name = TreeTrunk07
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2914.477, -82.17045, 2910.602)
    Angles = (0, 0, 0)
    name = zoo_AvairyTreeShadow02
    Class = LevelGeometry
    CreatedAtStart
    Push1 = 110
  }
  {
    Position = (2249.298, -170.7942, 3728.309)
    Angles = (0, 0, 0)
    name = Zoo_monkeyBush31
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1118.476, -167.2496, 3356.55)
    Angles = (0, 0, 0)
    name = Zoo_monkeyBush33
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1495.06, -123.2918, 2964.529)
    Angles = (0, 0, 0)
    name = Zoo_monkeyBush28
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (2508.336, -117.965, 2370.004)
    Angles = (0, 0, 0)
    name = Zoo_monkeyBush27
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1586.216, 215.0725, 2832.174)
    Angles = (0, 2.05589, 0)
    name = BigbirdTree01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1606.689, -166.9043, 3869.747)
    Angles = (0, 0, 0)
    name = BigAquabushes39
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1250.46, 215.0725, 3209.838)
    Angles = (0, 2.05589, 0)
    name = BigbirdTree12
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2837.333, 230.6052, 2799.885)
    Angles = (0, 2.00813, 0)
    name = BigbirdTree07
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BigbirdTree07Script
  }
  {
    Position = (-2090.927, -212.0932, 4196.603)
    Angles = (0, -1.18362, 0)
    name = BigAquabushes45
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2090.927, -212.0932, 5174.746)
    Angles = (0, -1.18362, 0)
    name = BigAquabushes46
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1945.726, -101.5275, 3692.528)
    Angles = (0, 0, 0)
    name = Bigbirdbushes35
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1156.369, -174.2791, 3155.977)
    Angles = (0, 0, 0)
    name = Bigbirdbushes31
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1510.898, -157.453, 2940.917)
    Angles = (0, 0, 0)
    name = Bigbirdbushes05
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1979.618, -125.7477, 2486.273)
    Angles = (0.01984, -0.00019, -0.01894)
    name = Bigbirdbushes06
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (3635.386, 175.3693, 7335.856)
    Angles = (0, 0, 0)
    name = BigbirdTree10
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BigbirdTree10Script
  }
  {
    Position = (1670.812, -218.598, 7307.148)
    Angles = (0, 0.49742, 0)
    name = fatbush07
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (2355.911, -204.7174, 7358.561)
    Angles = (0, 0, 0)
    name = fatbush30
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (3412.021, -214.1519, 7293.488)
    Angles = (0, 0, 0)
    name = rhinofatbush29
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = rhinofatbush29Script
  }
  {
    Position = (3552.353, -214.1519, 7293.488)
    Angles = (0, 0, 0)
    name = fatbush12
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush12Script
  }
  {
    Position = (3975.943, -214.1519, 7351.777)
    Angles = (0, 0, 0)
    name = fatbush13
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush13Script
  }
  {
    Position = (4353.057, -209.1673, 7351.777)
    Angles = (0, 0, 0)
    name = fatbush11
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush11Script
  }
  {
    Position = (4593.105, -208.4033, 7341.689)
    Angles = (0, 0, 0)
    name = fatbush28
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush28Script
  }
  {
    Position = (4856.566, -260.4359, 7351.826)
    Angles = (0, 0, 0)
    name = fatbush14
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush14Script
  }
  {
    Position = (4043.457, -90.9011, 7529.924)
    Angles = (0, 0, 0)
    name = fatbush20
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush20Script
  }
  {
    Position = (3806.568, -90.9011, 7529.924)
    Angles = (0, 0, 0)
    name = fatbush17
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush17Script
  }
  {
    Position = (4415.409, -64.09088, 7524.31)
    Angles = (0, 0, 0)
    name = fatbush23
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush23Script
  }
  {
    Position = (4726.128, -92.36835, 7520.031)
    Angles = (0, 0, 0)
    name = fatbush22
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush22Script
  }
  {
    Position = (5219.79, -141.351, 7415.778)
    Angles = (0, 0, 0)
    name = fatbush25
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush25Script
  }
  {
    Position = (3826.636, 32.61708, 7677.693)
    Angles = (0, 0, 0)
    name = fatbush16
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush16Script
  }
  {
    Position = (4132.848, -21.09295, 7601.494)
    Angles = (0, 0, 0)
    name = fatbush15
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush15Script
  }
  {
    Position = (4139.234, 86.06145, 7745.778)
    Angles = (0, 0, 0)
    name = fatbush18
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush18Script
  }
  {
    Position = (4478.447, 25.90711, 7710.795)
    Angles = (0, 0, 0)
    name = fatbush19
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush19Script
  }
  {
    Position = (4828.924, -14.03488, 7677.79)
    Angles = (0, 0, 0)
    name = fatbush21
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush21Script
  }
  {
    Position = (5133.386, -31.1178, 7603.962)
    Angles = (0, 0, 0)
    name = fatbush24
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush24Script
  }
  {
    Position = (5436.792, -43.09356, 7478.219)
    Angles = (0, 0, 0)
    name = fatbush26
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush26Script
  }
  {
    Position = (5512.709, -46.47083, 7178.671)
    Angles = (0, 0, 0)
    name = fatbush27
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = fatbush27Script
  }
  {
    Position = (5422.57, -220.484, 6038.275)
    Angles = (0, 1.213, 0)
    name = fatbush_Lion02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (5833.326, -220.484, 5665.902)
    Angles = (0, 2.20784, 0)
    name = fatbush_Lion01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2141.648, -154.1806, 3261.439)
    Angles = (0, 0, 0)
    name = Bigbirdbushes32
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (1363.564, -194.8324, 2077.431)
    Angles = (0, 0, 0)
    name = BushCollision12
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = BushCollision12Script
  }
  {
    Position = (3748.234, -276.2639, 6503.719)
    Angles = (0, -1.81514, 0)
    name = Elephant_Turd01
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_TurdNav01 ]
    TriggerScript = Elephant_Turd01Script
  }
  {
    Position = (4486.291, -276.2639, 6351.461)
    Angles = (0, 0, 0)
    name = Elephant_Turd02
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_TurdNav05 ]
    TriggerScript = Elephant_Turd02Script
  }
  {
    Position = (4095.881, -276.2639, 6929.485)
    Angles = (0, 2.82743, 0)
    name = Elephant_Turd03
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    Links = [ TRG_TurdNav09 ]
    TriggerScript = Elephant_Turd03Script
  }
  {
    Position = (-2460.992, -2575.098, 2994.084)
    Angles = (0, 0, 0)
    name = TRG_poopie05
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie05Script
  }
  {
    Position = (-2439.926, -2575.098, 3058.628)
    Angles = (0, 0, 0)
    name = TRG_poopie01
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie01Script
  }
  {
    Position = (-2443.446, -2575.098, 3162.445)
    Angles = (0, 0, 0)
    name = TRG_poopie06
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie06Script
  }
  {
    Position = (-2422.783, -2575.098, 3123.179)
    Angles = (0, 0, 0)
    name = TRG_poopie11
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie11Script
  }
  {
    Position = (-2326.707, -2575.098, 3162.445)
    Angles = (0, 0, 0)
    name = TRG_poopie07
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie07Script
  }
  {
    Position = (-2306.044, -2575.098, 3123.179)
    Angles = (0, 0, 0)
    name = TRG_poopie09
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie09Script
  }
  {
    Position = (-2321.772, -2575.098, 3068.725)
    Angles = (0, 0, 0)
    name = TRG_poopie03
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie03Script
  }
  {
    Position = (-2223.506, -2575.098, 3162.445)
    Angles = (0, 0, 0)
    name = TRG_poopie08
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie08Script
  }
  {
    Position = (-2202.843, -2575.098, 3123.179)
    Angles = (0, 0, 0)
    name = TRG_poopie10
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie10Script
  }
  {
    Position = (-2213.669, -2575.098, 3031.153)
    Angles = (0, 0, 0)
    name = TRG_poopie04
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie04Script
  }
  {
    Position = (-2153.114, -2575.098, 3006.271)
    Angles = (0, 0, 0)
    name = TRG_poopie02
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 600
    TriggerScript = TRG_Poopie02Script
  }
  {
    Position = (1941.917, -166.5323, 2666.105)
    Angles = (0, 0, 0)
    name = proset3_Funbox01
    Class = LevelGeometry
    TrickObject
  }
  {
    Position = (1493.92, -226.6479, 3848.331)
    Angles = (0, 0, 0)
    name = proset3_Bench05
    Class = LevelGeometry
    TrickObject Cluster = proset3_Bench05
    CollisionMode = Geometry
  }
  {
    Position = (1763.088, -226.6479, 3976.202)
    Angles = (0, 0, 0)
    name = proset3_Bench06
    Class = LevelGeometry
    TrickObject Cluster = proset3_Bench06
    CollisionMode = Geometry
  }
  {
    Position = (445.7966, -207.9321, 2896.639)
    Angles = (0, 0, 0)
    name = proset4_Bench03
    Class = LevelGeometry
    TrickObject Cluster = proset4_Bench03
    CollisionMode = Geometry
  }
  {
    Position = (448.1779, -50.52812, 1750.779)
    Angles = (0, 0, 0)
    name = proset4_Bench02
    Class = LevelGeometry
    TrickObject Cluster = proset4_Bench02
    CollisionMode = Geometry
  }
  {
    Position = (-196.4982, -49.69465, 1750.695)
    Angles = (0, 0, 0)
    name = proset4_Bench01
    Class = LevelGeometry
    TrickObject Cluster = proset4_Bench01
    CollisionMode = Geometry
  }
  {
    Position = (-199.0303, -208.4, 2896.866)
    Angles = (0, 0, 0)
    name = proset4_Bench04
    Class = LevelGeometry
    TrickObject Cluster = proset4_Bench04
    CollisionMode = Geometry
  }
  {
    Position = (-2044.554, -152.3997, 7406.21)
    Angles = (0, 0, 0)
    name = proset2_QP02
    Class = LevelGeometry
    TrickObject Cluster = proset2_QP02
  }
  {
    Position = (-2442.578, 92.0699, 1969.033)
    Angles = (0, 0, 0)
    name = Zoo_AviaryFront02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    CollisionMode = Geometry
  }
  {
    Position = (-2093.874, 176.7682, 1925.62)
    Angles = (0, 0, 0)
    name = Zoo_CompQP06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_CompQP06
    CollisionMode = Geometry
  }
  {
    Position = (-2791.282, 176.7682, 1925.62)
    Angles = (0, 0, 0)
    name = Zoo_CompQP04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_CompQP04
    CollisionMode = Geometry
  }
  {
    Position = (-2715.143, 418.8298, 1999.117)
    Angles = (0, 0, 0)
    name = Proset5_QP03
    Class = LevelGeometry
    TrickObject Cluster = Proset5_QP03
  }
  {
    Position = (-3296.636, 146.1335, 2044.29)
    Angles = (0, 0, 0)
    name = Proset5_Spine01
    Class = LevelGeometry
    TrickObject Cluster = Proset5_Spine01
  }
  {
    Position = (110.6086, -13.87393, -803.3506)
    Angles = (0, 0, 0)
    name = proset4_Table01
    Class = LevelGeometry
    TrickObject Cluster = Entrance_Table01
    CollisionMode = Geometry
  }
  {
    Position = (110.609, -13.87393, -937.058)
    Angles = (0, 0, 0)
    name = proset4_Table02
    Class = LevelGeometry
    TrickObject Cluster = Entrance_Table01
    CollisionMode = Geometry
  }
  {
    Position = (-3813.726, 176.7682, 2013.947)
    Angles = (0, 0, 0)
    name = Zoo_CompQP07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    CollisionMode = Geometry
  }
  {
    Position = (-2602.644, 92.08919, 1969.011)
    Angles = (0, 0, 0)
    name = Zoo_AviaryFront03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront02
    CollisionMode = Geometry
  }
  {
    Position = (-2056.686, -226.5646, 6382.381)
    Angles = (0, 0, 0)
    name = proset2_Bench03
    Class = LevelGeometry
    TrickObject Cluster = proset2_Bench03
    CollisionMode = Geometry
  }
  {
    Position = (-2056.686, -226.5646, 6730.449)
    Angles = (0, 0, 0)
    name = proset2_Bench02
    Class = LevelGeometry
    TrickObject Cluster = proset2_Bench02
    CollisionMode = Geometry
  }
  {
    Position = (2942.586, -318.5856, 6171.839)
    Angles = (0, 0, 0)
    name = proset1_Kicker05
    Class = LevelGeometry
    TrickObject
  }
  {
    Position = (3840.474, -318.5856, 6171.839)
    Angles = (0, 0, 0)
    name = proset1_Kicker04
    Class = LevelGeometry
    TrickObject
  }
  {
    Position = (1808.629, -238.4361, 5705.787)
    Angles = (0, 0, 0)
    name = proset1_Kicker06
    Class = LevelGeometry
    TrickObject
  }
  {
    Position = (-2170.408, 418.8298, 1999.117)
    Angles = (0, 0, 0)
    name = Proset5_QP04
    Class = LevelGeometry
    TrickObject Cluster = Proset5_QP04
  }
  {
    Position = (113.5901, -89.27541, 4934.806)
    Angles = (0, 0, 0)
    name = g_COMP_Wire01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-162.2303, -160.6635, 5484.093)
    Angles = (0, 0, 0)
    name = g_COMP_Bowl01
    Class = LevelGeometry
  }
  {
    Position = (121.9824, -32.91692, 5027.922)
    Angles = (0, 0, 0)
    name = g_COMP_Banner01
    Class = LevelGeometry
  }
  {
    Position = (131.7842, -97.3168, 4795.054)
    Angles = (0, 0, 0)
    name = Bridge_Damaged
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (122.8997, -191.8126, 5258.449)
    Angles = (0, 0, 0)
    name = g_COMP_Bowl03
    Class = LevelGeometry
  }
  {
    Position = (-630.2285, -131.9079, 4665.192)
    Angles = (0, 0, 0)
    name = g_COMP_LowRail01
    Class = LevelGeometry
  }
  {
    Position = (-630.2285, -131.74, 4789.342)
    Angles = (0, 0, 0)
    name = g_COMP_LowRail02
    Class = LevelGeometry
  }
  {
    Position = (884.081, -131.9096, 4795.703)
    Angles = (0, 0, 0)
    name = g_COMP_LowRail03
    Class = LevelGeometry
  }
  {
    Position = (884.081, -131.9096, 4671.387)
    Angles = (0, 0, 0)
    name = g_COMP_LowRail04
    Class = LevelGeometry
  }
  {
    Position = (-600.0364, -255.9721, 4924.193)
    Angles = (0, 0, 0)
    name = Zoo_BridgeDestroyedFloor01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-600.0364, -255.9721, 4924.192)
    Angles = (0, 0, 0)
    name = Zoo_BridgeFloor01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (851.946, -255.9721, 4919.983)
    Angles = (0, 0, 0)
    name = Zoo_BridgeFloor02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (851.946, -255.9721, 4919.984)
    Angles = (0, 0, 0)
    name = Zoo_BridgeDestroyedFloor02
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1174.608, -188.7186, 5045.217)
    Angles = (0, 0, 0)
    name = g_COMP_Bowl02
    Class = LevelGeometry
  }
  {
    Position = (-920.0466, -189.4075, 5045.283)
    Angles = (0, 0, 0)
    name = g_COMP_Bowl04
    Class = LevelGeometry
  }
  {
    Position = (790.6548, -187.957, 5541.316)
    Angles = (0, 0, 0)
    name = g_COMP_Bowl05
    Class = LevelGeometry
  }
  {
    Position = (705.4949, -136.754, 4783.53)
    Angles = (0, 0, 0)
    name = Bridge_Normal01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Bridge_Normal01
  }
  {
    Position = (-470.7592, -297.7722, 5839.771)
    Angles = (0, 0, 0)
    name = Hippo_bridge_down_cw
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (59.24567, -162.9167, 5568.792)
    Angles = (0, 0, 0)
    name = g_COMP_Bowl01a
    Class = LevelGeometry
  }
  {
    Position = (-391.3041, -136.754, 4785.194)
    Angles = (0, 0, 0)
    name = Bridge_Normal
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Bridge_Normal01
  }
  {
    Position = (122.6922, -154.6014, 4964.145)
    Angles = (0, 0, 0)
    name = Normal_COMP_CenterQP
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (2051.169, -256.6251, 6258.317)
    Angles = (0, 0, 0)
    name = G_COMP_Gound02
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ TRG_Restart_Hills01 Trg_Proset2_restartnode ]
    TriggerScript = G_COMP_Gound02Script
  }
  {
    Position = (1015.749, -255.7861, 6498.318)
    Angles = (0, 0, 0)
    name = G_COMP_Ground_CW
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (-639.1267, -221.6348, 5638.389)
    Angles = (0, 0, 0)
    name = G_COMP_BridgePost01
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (-302.4964, -221.6348, 5638.389)
    Angles = (0, 0, 0)
    name = G_COMP_BridgePost02
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (159.1339, -235.6705, 5617.388)
    Angles = (0, 0, 0)
    name = G_COMP_HippoFence01
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (-153.3613, -156.9235, 5626.159)
    Angles = (0, 0, 0)
    name = G_COMP_HippoRope02
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (463.8962, -254.6261, 6415.005)
    Angles = (0, 0, 0)
    name = FenceShadow02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (-1279.446, -255.6956, 6614.616)
    Angles = (0, 0, 0)
    name = FenceShadow
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (852.8007, -235.6705, 5865.002)
    Angles = (0, 0, 0)
    name = G_COMP_HippoFence02
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (-990.0146, -254.8721, 5617.388)
    Angles = (0, 0, 0)
    name = G_COMP_HippoFence03
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (1255.749, -256.0167, 6738.318)
    Angles = (0, 0, 0)
    name = Zoo_Ground_CW
    Class = LevelGeometry
    CreatedAtStart
    Push1 = 110
  }
  {
    Position = (122.6922, -154.6014, 4964.145)
    Angles = (0, 0, 0)
    name = Damaged_COMP_CenterQP
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (851.9459, -255.3432, 4919.984)
    Angles = (0, 0, 0)
    name = Damaged_COMP_BridgeFloor02
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-600.0363, -256.0216, 4924.193)
    Angles = (0, 0, 0)
    name = Damaged_COMP_BridgeFloor01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-600.0364, -255.9721, 4924.192)
    Angles = (0, 0, 0)
    name = Normal_COMP_BridgeFloor02
    Class = LevelGeometry
  }
  {
    Position = (851.946, -255.9721, 4919.983)
    Angles = (0, 0, 0)
    name = Normal_COMP_BridgeFloor01
    Class = LevelGeometry
  }
  {
    Position = (-1079.999, -294.0228, 6840.004)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Zoo_HippoWater01
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = G_COMPNOT_Bob_Zoo_HippoWater01Script
  }
  {
    Position = (360.0005, -294.0228, 6840.004)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_Zoo_HippoWater04
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = G_COMPNOT_Bob_Zoo_HippoWater04Script
  }
  {
    Position = (-1079.999, -294.0228, 6840.004)
    Angles = (0, 0, 0)
    name = G_COMP_HippoWater01
    Class = LevelGeometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = G_COMP_HippoWater01Script
  }
  {
    Position = (360.0005, -294.0228, 6840.005)
    Angles = (0, 0, 0)
    name = G_COMP_HippoWater04
    Class = LevelGeometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = G_COMP_HippoWater04Script
  }
  {
    Position = (-470.4951, -273.2273, 5643.749)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_BridgeEnds
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-461.4911, -277.6251, 5863.876)
    Angles = (0, 0, 0)
    name = G_COMP_BridgeEnd
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (-461.4911, -277.6251, 5863.876)
    Angles = (0, 0, 0)
    name = G_COMP_BridgeWater
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = G_COMP_BridgeWaterScript
  }
  {
    Position = (-460.4984, -343.1821, 5899.876)
    Angles = (0, 0, 0)
    name = G_COMPNOT_Bob_BridgeWater
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = G_COMPNOT_Bob_BridgeWaterScript
  }
  {
    Position = (-460.4984, -277.6251, 5899.876)
    Angles = (0, 0, 0)
    name = Hippo_bridge_up_cw
    Class = LevelGeometry
  }
  {
    Position = (-461.4911, -277.6251, 5899.876)
    Angles = (0, 0, 0)
    name = Hippo_bridge_COMP
    Class = LevelGeometry
  }
  {
    Position = (5.13106, -152.3661, 5438.823)
    Angles = (0, 0, 0)
    name = g_Counter_Loop_QP02
    Class = LevelGeometry
  }
  {
    Position = (658.7303, -45.9884, 5452.294)
    Angles = (0, 0, 0)
    name = G_Counter_Loop01
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1940.671, -152.3661, 5213.27)
    Angles = (0, 0, 0)
    name = g_Counter_Loop_QP01
    Class = LevelGeometry
  }
  {
    Position = (1319.941, -207.4014, 5420.704)
    Angles = (0, 0, 0)
    name = BobChallenge1_Loop01
    Class = LevelGeometry
    type = TRG_SkaterLanded
    TriggerScript = BobChallenge1_Loop01Script
  }
  {
    Position = (679.0696, -207.4013, 5179.98)
    Angles = (0, 0, 0)
    name = G_Counter_Loop02
    Class = LevelGeometry
    type = TRG_SkaterLanded
    MipMapKBias = -8.0
    TriggerScript = G_Counter_Loop02Script
  }
  {
    Position = (1417.339, -199.431, 5540.315)
    Angles = (0, 0, 0)
    name = BobChallenge2_Loop01
    Class = LevelGeometry
    type = TRG_SkaterLanded
    TriggerScript = BobChallenge2_Loop01Script
  }
  {
    Position = (1643.063, -20.84406, 5600.584)
    Angles = (0, 0, 0)
    name = BobChallenge3_Loop01
    Class = LevelGeometry
    type = TRG_SkaterLanded
    TriggerScript = BobChallenge3_Loop01Script
  }
  {
    Position = (1340.28, -45.9884, 5148.39)
    Angles = (0, 0, 0)
    name = BobChallenge1_Loop
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1442.28, -45.98837, 5268.002)
    Angles = (0, 0, 0)
    name = BobChallenge2_Loop
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1544.28, -45.98837, 5358.27)
    Angles = (0, 0, 0)
    name = BobChallenge3_Loop
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (1340.28, -45.9884, 5148.39)
    Angles = (0, 0, 0)
    name = MovingLoop01
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 501
    TriggerScript = MovingLoop01Script
  }
  {
    Position = (1442.28, -45.98837, 5268.002)
    Angles = (0, 0, 0)
    name = MovingLoop02
    Class = LevelObject
    type = Normal
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 500
    lod_dist2 = 501
    TriggerScript = MovingLoop02Script
  }
  {
    Position = (3110.277, 66.78613, 806.2853)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyWall01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    CollisionMode = Geometry
  }
  {
    Position = (5400, -8.84534, 3042.484)
    Angles = (0, -1.5708, 0)
    name = Zoo_CS_Wall
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1093.402, -74.89154, 3039.552)
    Angles = (0, 0, 0)
    name = Zoo_Planter02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2881.429, -24.5603, 4363.189)
    Angles = (0, 0, 0)
    name = Zoo_GorillaPen
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1727.917, -58.3567, 1624.297)
    Angles = (0, 0, 0)
    name = Zoo_Planter03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1369.138, 210.3982, 1907.474)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter02b
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = TRG_RestartNode_MonkeyHouse
    Links = [ TRG_RestartNode_MonkeyHouse ]
    TriggerScript = Zoo_EntPlanter02bScript
  }
  {
    Position = (2284.466, -255.9884, 4440.003)
    Angles = (0, 0, 0)
    name = Zoo_Ground04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3134.063, -58.21812, 782.4999)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyHouse
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyHouse
    CollisionMode = Geometry
  }
  {
    Position = (2325.832, -204.0286, 1560.001)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyPitFloor02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1720.408, -192.1885, 1658.897)
    Angles = (0, 0, 0)
    name = Zoo_Planter05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter05
    CollisionMode = Geometry
  }
  {
    Position = (2339.01, -205.9996, 3013.536)
    Angles = (0, 0, 0)
    name = Zoo_Planter06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter06
    CollisionMode = Geometry
  }
  {
    Position = (2248.746, 18.50034, 3015.92)
    Angles = (0, 0, 0)
    name = TreeTrunk01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2421.517, 319.6456, 2342.406)
    Angles = (0, 2.05589, 0)
    name = TreeTop01
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TreeTop01Script
  }
  {
    Position = (2421.517, 319.6456, 3059.005)
    Angles = (0, 2.05589, 0)
    name = TreeTop03
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TreeTop03Script
  }
  {
    Position = (1588.666, 310.6274, 1750.191)
    Angles = (0, 2.06143, 0)
    name = TreeTop
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TreeTopScript
  }
  {
    Position = (2457.021, 25.74603, 2290.905)
    Angles = (0, 0, 0)
    name = TreeTrunk02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1292.624, 319.6456, 2871.677)
    Angles = (0, 2.0533, 0)
    name = TreeTop02
    Class = LevelGeometry
    CreatedAtStart
    TriggerScript = TreeTop02Script
  }
  {
    Position = (1576.36, 55.04242, 2433.472)
    Angles = (0, 0, 0)
    name = TreeTrunk03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1878.137, 37.43051, 1426.444)
    Angles = (0, 0.17453, 0)
    name = TreeTrunk04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2635.166, 360.7905, 2092.471)
    Angles = (0, 0, 0)
    name = TRG_1078
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (3479.999, 360.9489, 2089.522)
    Angles = (0, 0, 0)
    name = TRG_1079
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1094 ]
  }
  {
    Position = (4480.482, 360.9579, 1320)
    Angles = (0, 0, 0)
    name = TRG_1080
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1093 ]
  }
  {
    Position = (4480.492, 360.9533, 359.9993)
    Angles = (0, 0, 0)
    name = TRG_1081
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1090 ]
  }
  {
    Position = (3479.999, 360.9578, -525.9199)
    Angles = (0, 0, 0)
    name = TRG_1082
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1089 ]
  }
  {
    Position = (2521.57, 360.9578, -526.1514)
    Angles = (0, 0, 0)
    name = TRG_1083
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1087 ]
  }
  {
    Position = (1786.802, 360.9578, 360.0004)
    Angles = (0, 0, 0)
    name = TRG_1084
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1097 ]
  }
  {
    Position = (1785.787, 360.9578, 840.0005)
    Angles = (0, 0, 0)
    name = TRG_1085
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1096 ]
    TriggerScript = TRG_1085Script
  }
  {
    Position = (2515.789, 360.9578, -522.3345)
    Angles = (0, 0, 0)
    name = TRG_1086
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1083 ]
  }
  {
    Position = (2537.088, 360.9578, -527.3791)
    Angles = (0, 0, 0)
    name = TRG_1087
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1088 ]
  }
  {
    Position = (3471.379, 360.9578, -527.4714)
    Angles = (0, 0, 0)
    name = TRG_1088
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1082 ]
  }
  {
    Position = (3489.584, 360.9578, -519.0071)
    Angles = (0, 0, 0)
    name = TRG_1089
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1091 ]
  }
  {
    Position = (4482.338, 360.9533, 367.6915)
    Angles = (0, 0, 0)
    name = TRG_1090
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1092 ]
  }
  {
    Position = (4477.54, 360.9533, 355.7802)
    Angles = (0, 0, 0)
    name = TRG_1091
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1081 ]
  }
  {
    Position = (4482.339, 360.9579, 1315.009)
    Angles = (0, 0, 0)
    name = TRG_1092
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1080 ]
  }
  {
    Position = (4473.947, 360.9579, 1326.479)
    Angles = (0, 0, 0)
    name = TRG_1093
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1095 ]
  }
  {
    Position = (3471.756, 360.9489, 2092.471)
    Angles = (0, 0, 0)
    name = TRG_1094
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1078 ]
  }
  {
    Position = (3485.875, 360.9489, 2087.87)
    Angles = (0, 0, 0)
    name = TRG_1095
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1079 ]
  }
  {
    Position = (1785.787, 360.9578, 366.5674)
    Angles = (0, 0, 0)
    name = TRG_1096
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1084 ]
  }
  {
    Position = (1789.458, 360.9578, 355.7603)
    Angles = (0, 0, 0)
    name = TRG_1097
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyWall01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1086 ]
  }
  {
    Position = (5585.904, -197.8895, 4910.049)
    Angles = (-1.37535, 0.9355, -3.04263)
    name = car
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = Geometry
  }
  {
    Position = (5554.415, -236.7199, 4837.19)
    Angles = (-1.37535, 0.9355, -3.04263)
    name = Car_Wheel01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = Geometry
  }
  {
    Position = (5570.092, -255.3621, 4950.048)
    Angles = (0, 2.62672, 0)
    name = LAND_ROVER_Collision01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = Geometry
  }
  {
    Position = (5585.904, -197.8895, 4910.049)
    Angles = (-1.37535, 0.9355, -3.04263)
    name = Car_Shadow
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = car
    CollisionMode = Geometry
  }
  {
    Position = (-1395.635, -144.2181, 3464.83)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail17
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail18 ]
  }
  {
    Position = (-1377.297, -179.2955, 3466.911)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail18
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail19 ]
  }
  {
    Position = (-1338.265, -191.8214, 3489.269)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail19
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-1538.847, -111.1548, 3465.266)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail20
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail21 ]
  }
  {
    Position = (-1421.376, -138.2753, 3521.485)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail21
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail22 ]
  }
  {
    Position = (-1410.451, -171.6414, 3539.879)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail22
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail23 ]
  }
  {
    Position = (-1368.948, -184.7377, 3556.8)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail23
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (-1513.106, -117.0977, 3408.611)
    Angles = (0.20626, 1.99727, -0.09521)
    name = TRG_LRover_Safari_Rail24
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = BoundingBox
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_LRover_Safari_Rail17 ]
  }
  {
    Position = (-1454.254, -165.5575, 3513.684)
    Angles = (1.45166, 0.36361, 0.22528)
    name = Car01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = Geometry
  }
  {
    Position = (-1396.097, -218.836, 3553.522)
    Angles = (1.45166, 0.36361, 0.22528)
    name = Car_Wheel02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = Geometry
  }
  {
    Position = (-1477.98, -219.0643, 3472.125)
    Angles = (-0.20786, -1.16148, 0.09162)
    name = LAND_ROVER_Collision02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = Geometry
  }
  {
    Position = (-1454.286, -163.7345, 3513.684)
    Angles = (1.45166, 0.36361, 0.22528)
    name = Car_Shadow01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Car01
    CollisionMode = Geometry
  }
  {
    Position = (1581.933, 587.1393, 603.7023)
    Angles = (0, 0, 0)
    name = TRGP_GapStart_OverHills
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRGP_GapEnd_OverHills ]
    TriggerScript = TRGP_GapStart_OverHillsScript
  }
  {
    Position = (1121.796, 483.9124, 622.3449)
    Angles = (0, 0, 0)
    name = TRGP_GapEnd_OverHills
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    TriggerScript = TRGP_GapEnd_OverHillsScript
  }
  {
    Position = (-839.9995, -224.4859, 5597.162)
    Angles = (0, 0, 0)
    name = zoo_hj_Telescope01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (99.37134, -224.4859, 5597.162)
    Angles = (0, 0, 0)
    name = zoo_hj_Telescope02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2443.787, -184.6073, 592.5228)
    Angles = (0, 0, 0)
    name = AVIARY_BirdBase
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2445.986, -175.8925, 1398.429)
    Angles = (0, 0, 0)
    name = BirdBase
    Class = LevelGeometry
    CreatedAtStart
    Link_0 = TRG_RestartAviary02
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = BirdBaseScript
  }
  {
    Position = (-2443.598, -78.34184, 1083.296)
    Angles = (0, 0, 0)
    name = BirdGate02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2439.197, -175.8925, -19.36769)
    Angles = (0, 0, 0)
    name = Zoo_AviaryLiner01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (662.1561, -142.036, 2767.718)
    Angles = (0, 0, 0)
    name = Zoo_MainStreetRails01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    CollisionMode = Geometry
  }
  {
    Position = (2345.96, -40.93073, 7852.439)
    Angles = (0, 0, 0)
    name = zoo_hj_build04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3955.496, -156.9172, 7525.532)
    Angles = (0, 0, 0)
    name = ZEleph_Trench03
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart05 ]
    TriggerScript = ZEleph_Trench03Script
  }
  {
    Position = (5738.102, 15.44948, 5926.479)
    Angles = (0, 0, 0)
    name = Zoo_BigRockQP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_BigRockQP02
  }
  {
    Position = (5880, -37.60713, 6320.479)
    Angles = (0, 0, 0)
    name = Zoo_IvyPatch
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartHills01 ]
    TriggerScript = Zoo_IvyPatchScript
  }
  {
    Position = (-2050.187, -183.0767, 5812.658)
    Angles = (0, 0.7854, 0)
    name = Zoo_FoodTent02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_FoodTent02
  }
  {
    Position = (5934.593, -230.7144, 3965.442)
    Angles = (0, 0, 0)
    name = Zoo_TramRail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_TramRail01
    CollisionMode = Geometry
  }
  {
    Position = (5100.31, -222.5416, 7446.829)
    Angles = (0, 0, 0)
    name = ZEleph_Trench05
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart05 ]
    TriggerScript = ZEleph_Trench05Script
  }
  {
    Position = (-618.5079, 628.9612, 1776.995)
    Angles = (0, 0, 0)
    name = Zoo_GrindBar01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-618.5079, 629.361, 1994.296)
    Angles = (0, 0, 0)
    name = Zoo_GrindBar05
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-738.1322, 52.7954, 2782.887)
    Angles = (0, 0, 0)
    name = dt_bldg99
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-738.3499, 174.1351, 1807.547)
    Angles = (0, 0, 0)
    name = dt_bldg98
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (978.3489, 29.16602, 2782.887)
    Angles = (0, 0, 0)
    name = dt_bldg100
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-646.6312, 177.7693, 1963.581)
    Angles = (0, 1.5708, 0)
    name = Zoo_CompQP03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_CompQP03
    CollisionMode = Geometry
  }
  {
    Position = (2443.097, -338.6826, 7216.797)
    Angles = (0, 0, 0)
    name = ZRhino_Trench02
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart06 ]
    TriggerScript = ZRhino_Trench02Script
  }
  {
    Position = (3358.703, 40.68742, 7529.32)
    Angles = (0, 0, 0)
    name = ZRhino_Trench05
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart06 ]
    TriggerScript = ZRhino_Trench05Script
  }
  {
    Position = (-1668.283, -132.464, 2280.91)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_AviaryYard02Script
  }
  {
    Position = (-2786.371, -127.7039, 2603.645)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_AviaryYard01Script
  }
  {
    Position = (-1666.597, -201.6254, 3838.809)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard06
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2051.165, -234.7035, 5043.773)
    Angles = (0, 0, 0)
    name = Zoo_AquaFrontDirt
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (340.5594, -10.28611, 135.6498)
    Angles = (0, 0, 0)
    name = Zoo_Handrail08
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail08
  }
  {
    Position = (-82.41422, -10.28611, 135.6498)
    Angles = (0, 0, 0)
    name = Zoo_Handrail09
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail09
  }
  {
    Position = (-297.2328, -10.27311, 337.3634)
    Angles = (0, 0, 0)
    name = Zoo_Handrail11
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail11
  }
  {
    Position = (549.973, -10.28612, 366.3072)
    Angles = (0, 0, 0)
    name = Zoo_Handrail13
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Handrail13
  }
  {
    Position = (0.00003, -35.82079, 960.0005)
    Angles = (0, 0, 0)
    name = Zoo_EntGround01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2498.367, 103.0033, 126.3365)
    Angles = (0, 0, 0)
    name = AVIARY_Yard
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = AVIARY_YardScript
  }
  {
    Position = (-755.1749, 276.6541, 1807.547)
    Angles = (0, 0, 0)
    name = ZooBuildingTower
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-3428.549, 61.91428, 2974.242)
    Angles = (0, 0, 0)
    name = Zoo_hj_AquariumTopBuild
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_hj_AquariumTopBuildScript
  }
  {
    Position = (124.3903, 138.5265, 525.6227)
    Angles = (0, 0, 0)
    name = ZEnt_MainEntrance01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Entrance_Main01
    TriggerScript = ZEnt_MainEntrance01Script
  }
  {
    Position = (-4778.948, 141.4487, 1298.598)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard07
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_AviaryYard07Script
  }
  {
    Position = (666.4379, -13.84229, 1923.509)
    Angles = (0, 0, 0)
    name = Zoo_MainStreetRails04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    CollisionMode = Geometry
  }
  {
    Position = (3203.965, -40.93069, 7852.439)
    Angles = (0, 0, 0)
    name = zoo_hj_build01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2526.725, 40.68738, 7474.506)
    Angles = (0, 0, 0)
    name = ZRhino_Trench06
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart06 ]
    TriggerScript = ZRhino_Trench06Script
  }
  {
    Position = (-739.3822, 81.31785, 2277.283)
    Angles = (0, 0, 0)
    name = Zoo_AlleyWall01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (6825.795, 11.26568, 5399.992)
    Angles = (0, 0, 0)
    name = Zoo_LionCageRocks01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks01
    CollisionMode = Geometry
    Links = [ TRG_RestartNodeLions ]
    TriggerScript = Zoo_LionCageRocks01Script
  }
  {
    Position = (6825.152, 8.97498, 4440.451)
    Angles = (0, 0, 0)
    name = Zoo_LionCageRocks02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_LionCageRocks02
    CollisionMode = Geometry
    Links = [ TRG_RestartNodeLions ]
    TriggerScript = Zoo_LionCageRocks02Script
  }
  {
    Position = (-754.9491, 249.149, 2766.062)
    Angles = (0, 0, 0)
    name = BuildingTop
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BuildingTop
    CollisionMode = Geometry
  }
  {
    Position = (-738.1322, 52.7954, 2782.887)
    Angles = (0, 0, 0)
    name = BuildingLedge01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BuildingLedge01
    CollisionMode = Geometry
  }
  {
    Position = (-738.3499, 174.1351, 1807.547)
    Angles = (0, 0, 0)
    name = BuildingLedge02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = BuildingLedge02
    CollisionMode = Geometry
  }
  {
    Position = (-840.0129, -257.2711, 5598.122)
    Angles = (0, 0, 0)
    name = TelescopeCollision
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (99.41008, -257.2711, 5598.122)
    Angles = (0, 0, 0)
    name = TelescopeCollision01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2430.865, -40.20473, 1969.966)
    Angles = (0, 0, 0)
    name = Zoo_AviaryFront01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    CollisionMode = Geometry
  }
  {
    Position = (-1395.29, -35.67326, 3148.279)
    Angles = (0, 0, 0)
    name = TreeTrunk07a
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1763.1, -254.0069, 4680.003)
    Angles = (0, 0, 0)
    name = PlantLiner
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1612.967, -152.3765, 4791.889)
    Angles = (0, 0, 0)
    name = g_COMP_QP02
    Class = LevelGeometry
  }
  {
    Position = (1981.986, -152.3765, 4812.672)
    Angles = (0, 0, 0)
    name = g_COMP_QP04
    Class = LevelGeometry
  }
  {
    Position = (1980.828, -152.6658, 5334.333)
    Angles = (0, 0, 0)
    name = g_COMP_QP05
    Class = LevelGeometry
  }
  {
    Position = (-1612.967, -152.3765, 5353.877)
    Angles = (0, 0, 0)
    name = g_COMP_QP03
    Class = LevelGeometry
  }
  {
    Position = (1407.647, 77.35912, 3081.604)
    Angles = (0, 0, 0)
    name = Zoo_Wire02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Wire01
    CollisionMode = Geometry
  }
  {
    Position = (1799.665, 81.97025, 1866.043)
    Angles = (0, 0, 0)
    name = Zoo_Wire01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Wire01
    CollisionMode = Geometry
  }
  {
    Position = (-1156.518, 17.60767, 3604.464)
    Angles = (0, 0, 0)
    name = Zoo_Banner08
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    CollisionMode = Geometry
  }
  {
    Position = (-1156.518, 17.60767, 3604.464)
    Angles = (0, 0, 0)
    name = Zoo_Banner07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    CollisionMode = Geometry
  }
  {
    Position = (1412.3, -75.26868, 3198.581)
    Angles = (0, 0.77667, 0)
    name = zoo_hj_ParkingLotLight12
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1543.919, -46.17659, 2888.988)
    Angles = (0, 0.17453, 0)
    name = zoo_hj_ParkingLotLight11
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1669.72, -34.00425, 2189.93)
    Angles = (0, 0.1309, 0)
    name = zoo_hj_ParkingLotLight10
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1793.473, -68.45918, 1504.088)
    Angles = (0, 0.21817, 0)
    name = zoo_hj_ParkingLotLight09
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (2138.682, -226.0433, 3355.819)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyBench02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench02
    CollisionMode = Geometry
  }
  {
    Position = (2395.364, -152.1368, 2369.62)
    Angles = (0, 0.20071, 0)
    name = Zoo_MonkeyBench01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_MonkeyBench01
    CollisionMode = Geometry
  }
  {
    Position = (128.0376, -39.75469, 1344.467)
    Angles = (0, 0, 0)
    name = zoo_hj_TurnStyleShadow02
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (4363.666, -268.6622, 3627.079)
    Angles = (0, 0, 0)
    name = GiraffeCollision01
    Class = LevelObject
    type = Normal
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = GiraffeCollision01Script
  }
  {
    Position = (4388.379, -268.6622, 3511.41)
    Angles = (0, 1.16064, 0)
    name = GiraffeCollision02
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
  }
  {
    Position = (4379.371, -139.0029, 3381.655)
    Angles = (0, 0, 0)
    name = Zoo_GiraffeDoor
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
  }
  {
    Position = (-3368.573, -151.0097, 5376.142)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint12
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint13 ]
  }
  {
    Position = (-3842.814, -151.0097, 5412.962)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint13
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint17 ]
  }
  {
    Position = (-3963.493, -151.0097, 5293.212)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint17
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint22 ]
  }
  {
    Position = (-3419.522, -151.0097, 5107.977)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint18
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint20 ]
  }
  {
    Position = (-2887.311, -151.0097, 5396.696)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint19
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint21 ]
  }
  {
    Position = (-3220.913, -151.0097, 5443.894)
    Angles = (0, -0.49742, 0)
    name = TRG_Hippo09
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    Links = [ TRG_HippoWaypoint12 ]
    TriggerScript = TRG_Hippo09Script
  }
  {
    Position = (-3013.204, -151.0097, 5166.165)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint20
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint23 ]
  }
  {
    Position = (-3104.057, -151.0097, 5438.646)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint21
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint12 ]
  }
  {
    Position = (-3791.046, -151.0097, 5147.268)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint22
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint18 ]
  }
  {
    Position = (-2870.326, -151.0097, 5274.808)
    Angles = (0, 0, 0)
    name = TRG_HippoWaypoint23
    Class = Waypoint
    CreatedAtStart
    Links = [ TRG_HippoWaypoint19 ]
  }
  {
    Position = (-3400.098, -368.644, 5346.816)
    Angles = (0, -0.49742, 0)
    name = TRG_Hippo10
    Class = Pedestrian
    type = Anl_Hippo
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = hippo
    AnimName = animload_anl_hippo
    model = "animals\anl_hippo\anl_hippo.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_Hippo10Script
  }
  {
    Position = (-3442.786, -496.6648, 3894.068)
    Angles = (0.31415, -1.5791, 0.0027)
    name = TRG_GiantGator
    Class = Pedestrian
    type = Anl_Gator
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = gator
    AnimName = animload_anl_gator
    model = "animals\anl_gator\anl_gator.skin"
    SuspendDistance = 0
    lod_dist1 = 80
    lod_dist2 = 150
    TriggerScript = TRG_GiantGatorScript
  }
  {
    Position = (1693.17, -254.4416, 5945.381)
    Angles = (0, 1.82387, 0)
    name = TRG_Ped_LookAt
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (2173.582, -226.4518, 371.4472)
    Angles = (0, -1.24791, 0)
    name = TRG_Ped_Nav
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (3134.063, -58.21811, 782.4998)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyInnerFloor
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-715.8317, -175.1707, 3300.026)
    Angles = (0, 0, 0)
    name = Zoo_CompQP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = FountainQP
  }
  {
    Position = (469.6423, -196.0711, 5610.942)
    Angles = (0, 0, 0)
    name = Zoo_Sign04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2013.195, -158.3414, 4198.494)
    Angles = (0, 0, 0)
    name = Zoo_AquariumEntranceFloor
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 7.43014, 3267.526)
    Angles = (0, 0, 0)
    name = Zoo_Banner04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 202.6872, 2945.094)
    Angles = (0, 0, 0)
    name = Zoo_Banner02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 202.6872, 2788.214)
    Angles = (0, 0, 0)
    name = Zoo_Banner01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 202.6872, 3111.667)
    Angles = (0, 0, 0)
    name = Zoo_Banner03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, -6.42853, 3267.413)
    Angles = (0, 0, 0)
    name = WelcomeSigns
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    CollisionMode = Geometry
  }
  {
    Position = (-1156.518, 17.60767, 3604.464)
    Angles = (0, 0, 0)
    name = Fish_Bird_Signs
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 188.8285, 3111.554)
    Angles = (0, 0, 0)
    name = WelcomeSigns01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner03
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 188.8285, 2944.98)
    Angles = (0, 0, 0)
    name = WelcomeSigns02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner02
    CollisionMode = Geometry
  }
  {
    Position = (118.9561, 188.8285, 2788.1)
    Angles = (0, 0, 0)
    name = WelcomeSigns03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    CollisionMode = Geometry
  }
  {
    Position = (-1153.636, 102.1395, 3576.573)
    Angles = (0, 0, 0)
    name = Fish_Bird_Signs01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner07
    CollisionMode = Geometry
  }
  {
    Position = (1610.912, -218.3239, 3000.002)
    Angles = (0, 0, 0)
    name = Zoo_MonkeyPitFloor01_hdj
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (1093.402, -209.2174, 3142.206)
    Angles = (0, 0, 0)
    name = Zoo_Planter04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter04
    CollisionMode = Geometry
  }
  {
    Position = (-1956.921, -172.2118, 3000.406)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard05
    Class = LevelGeometry
    CreatedAtStart
    Push1 = 110
    CollisionMode = Geometry
  }
  {
    Position = (120.0173, -259.1669, 3957.087)
    Angles = (0, -1.61887, 0)
    name = Arco_Fountain_11
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Fountain
    CollisionMode = Geometry
    Link_0 = TRG_RestartFountain
    Links = [ TRG_RestartFountain ]
    TriggerScript = Arco_Fountain_11Script
  }
  {
    Position = (-631.0389, -213.6476, 2805.963)
    Angles = (0, 0, 0)
    name = Zoo_MainBank02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    CollisionMode = Geometry
  }
  {
    Position = (871.3223, -213.6476, 2805.822)
    Angles = (0, 0, 0)
    name = Zoo_MainBank01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    CollisionMode = Geometry
  }
  {
    Position = (119.9999, -145.9245, 2280.015)
    Angles = (0, 0, 0)
    name = Sk3Ed_Fd1_20x30
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (610.0024, -102.4809, 1807.885)
    Angles = (0, 0, 0)
    name = Zoo_MainBank04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank04
    CollisionMode = Geometry
  }
  {
    Position = (-371.5565, -101.239, 1807.885)
    Angles = (0, 0, 0)
    name = Zoo_MainBank06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank06
    CollisionMode = Geometry
  }
  {
    Position = (853.5101, -255.9721, 3799.576)
    Angles = (0, -1.61887, 0)
    name = Zoo_sealpoolfloor_cw03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Link_0 = TRG_RestartFountain
    Links = [ TRG_RestartFountain ]
  }
  {
    Position = (-599.9468, -255.9721, 3788.986)
    Angles = (0, -1.61887, 0)
    name = Zoo_sealpoolfloor_cw
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Link_0 = TRG_RestartFountain
    Links = [ TRG_RestartFountain ]
  }
  {
    Position = (-1312.585, -122.1233, 3938.834)
    Angles = (0, 0, 0)
    name = zoo_hj_ParkingLotLight08
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1263.806, -255.2909, 4094.253)
    Angles = (0, 0, 0)
    name = PoleShadow
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (2919.583, -179.5052, 4650.692)
    Angles = (0, 0, 0)
    name = Zoo_Sign07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign07
    CollisionMode = Geometry
  }
  {
    Position = (2605.379, -143.6321, 1974.125)
    Angles = (0, -1.5708, 0)
    name = Zoo_Sign08
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2442.398, 310.6747, 2218.585)
    Angles = (0, 0, 0)
    name = Zoo_BirdSign_HJ
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    CollisionMode = Geometry
  }
  {
    Position = (-2322.249, 137.739, 4681.429)
    Angles = (0, -1.5708, 0)
    name = Zoo_FishSign_HJ01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner08
    CollisionMode = Geometry
  }
  {
    Position = (-159.9618, 5.49591, 3514.669)
    Angles = (0, 0, 0)
    name = zoo_BannerWireShadow
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5173.384, -241.782, 4928.032)
    Angles = (0, 0, 0)
    name = proset3_Funbox02
    Class = LevelGeometry
    TrickObject
  }
  {
    Position = (5271.335, -113.3771, 6575.882)
    Angles = (0, 0, 0)
    name = ElephantRock
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_G_GAP2_RestartNode ]
    TriggerScript = ElephantRockScript
  }
  {
    Position = (5654.979, -253.9187, 5400.004)
    Angles = (0, 0, 0)
    name = zoo_Liner03_hj
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (4912.685, -233.3679, 5001.02)
    Angles = (0, 0, 0)
    name = wire_shadow03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5448.708, -254.7014, 5160.003)
    Angles = (0, 0, 0)
    name = Zoo_Ground02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5509.428, -255.2657, 4962.384)
    Angles = (0, 0, 0)
    name = wire_shadow02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (5354.148, -254.2278, 5337.688)
    Angles = (0, 0, 0)
    name = wire_shadow01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-4215.409, -183.7971, 3982.712)
    Angles = (0, 0, 0)
    name = Zoo_AQUA_BackHills01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart02 ]
    TriggerScript = Zoo_AQUA_BackHills01Script
  }
  {
    Position = (2040, -256.6251, 6258.317)
    Angles = (0, 0, 0)
    name = Zoo_Ground03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart_Hills01 ]
    TriggerScript = Zoo_Ground03Script
  }
  {
    Position = (1429.3, -254.4416, 5905.49)
    Angles = (0, 1.82387, 0)
    name = TRG_Ped_TramDriver
    Class = Pedestrian
    type = Ped_ZooKeeper
    CreatedAtStart
    AbsentInNetGames
    SkeletonName = human
    AnimName = animload_human
    model = "levels\zoo\ped_zookeeper\ped_zookeeper.skin"
    SuspendDistance = 10000
    lod_dist1 = 80
    lod_dist2 = 150
    Extra_Anims = animload_ped_ranger
    TriggerScript = TRG_Ped_TramDriverScript
  }
  {
    Position = (-2439.998, 229.1944, 527.7502)
    Angles = (0, 0, 0)
    name = AVIARY_BirdRail02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch03
  }
  {
    Position = (-2698.15, 93.83487, 527.7502)
    Angles = (0, 0, 0)
    name = Zoo_AviaryRail04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch01
    CollisionMode = Geometry
  }
  {
    Position = (-2439.998, 161.7611, 527.7502)
    Angles = (0, 0, 0)
    name = AVIARY_BirdRail01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Aviary_Perch02
  }
  {
    Position = (-2436.835, 196.8778, 527.7502)
    Angles = (0, 0, 0)
    name = AVIARY_BirdWires
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (3070.771, -242.8532, 4393.853)
    Angles = (0, 0, 0)
    name = Zoo_Planter07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Planter07
    CollisionMode = Geometry
  }
  {
    Position = (-788.1534, -156.9235, 5626.539)
    Angles = (0, 0, 0)
    name = G_COMP_HippoRope01
    Class = LevelGeometry
    CollisionMode = Geometry
    Link_0 = Trg_Proset2_restartnode
    Links = [ Trg_Proset2_restartnode ]
  }
  {
    Position = (5963.521, -229.8773, 4746.329)
    Angles = (0, 0.85792, 0)
    name = fatbush_Lion03
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2450.28, 184.2081, -18.10902)
    Angles = (0, 0, 0)
    name = zoo_BirdSigns
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner01
    CollisionMode = Geometry
  }
  {
    Position = (-2440.7, -115.8543, -134.6038)
    Angles = (0, -0.6427, 0)
    name = fatbush_BirdBush01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-1426.495, 76.78932, 2747.526)
    Angles = (0, 0, 0)
    name = Zoo_Wire03
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Wire03
    CollisionMode = Geometry
  }
  {
    Position = (602.1407, -52.91143, 2397.358)
    Angles = (0, 0, 0)
    name = Zoo_EntRailWire
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank01
    CollisionMode = Geometry
  }
  {
    Position = (-357.8592, -52.91141, 2397.358)
    Angles = (0, 0, 0)
    name = Zoo_EntRailWire01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Main_Bank02
    CollisionMode = Geometry
  }
  {
    Position = (-339.413, 141.5458, 3837.533)
    Angles = (0, 0, 0)
    name = Zoo_BridgeCables
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables
    CollisionMode = Geometry
  }
  {
    Position = (579.79, 141.4515, 3837.652)
    Angles = (0, 0, 0)
    name = Zoo_BridgeCables01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_BridgeCables01
    CollisionMode = Geometry
  }
  {
    Position = (-2439.176, -176.2935, 735.6696)
    Angles = (0, 0, 0)
    name = AVIARY_Floor01
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2856.885, -103.9583, 527.7502)
    Angles = (0, 0, 0)
    name = Aviary_QP01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Aviary_QP01
  }
  {
    Position = (-2444.679, -122.4746, 527.7496)
    Angles = (0, 0, 0)
    name = Aviary_Spine
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Aviary_Spine
  }
  {
    Position = (-2021.465, -103.9583, 527.7502)
    Angles = (0, 0, 0)
    name = AVIARYQP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Aviary_QP02
  }
  {
    Position = (3000.567, -212.8063, -87.56779)
    Angles = (0, 0, 0)
    name = MONKEY_QP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject
    CollisionMode = Geometry
  }
  {
    Position = (5876.646, 129.2332, 5714.947)
    Angles = (0, 0, 0)
    name = Line04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1157.36, 2529.042, 7232.509)
    Angles = (0, 0, 0)
    name = Zoo_HippoBackyard
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = Zoo_HippoBackyardScript
  }
  {
    Position = (119.9999, -35.82084, -840.0008)
    Angles = (0, 0, 0)
    name = Zoo_EntGround02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-889.7814, 130.0664, 478.916)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart01 ]
    TriggerScript = Zoo_EntPlanter03Script
  }
  {
    Position = (-889.7159, 139.0649, -961.2987)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter04
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart01 ]
    TriggerScript = Zoo_EntPlanter04Script
  }
  {
    Position = (-593.6243, -21.5186, 478.9159)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter05
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    CollisionMode = Geometry
  }
  {
    Position = (-529.2037, -21.51866, -961.2986)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    CollisionMode = Geometry
  }
  {
    Position = (854.2214, -21.5186, 475.3627)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter07
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    CollisionMode = Geometry
  }
  {
    Position = (789.8008, -21.51866, -961.299)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter08
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    CollisionMode = Geometry
  }
  {
    Position = (-649.2037, 7.08563, -961.2986)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter09
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    CollisionMode = Geometry
  }
  {
    Position = (-672.4299, 7.08569, 478.9159)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter10
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter01
    CollisionMode = Geometry
  }
  {
    Position = (909.8008, 7.08563, -968.4048)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter11
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    CollisionMode = Geometry
  }
  {
    Position = (974.2214, 7.08569, 468.2569)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter12
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = EntPlanter02
    CollisionMode = Geometry
  }
  {
    Position = (5169.96, -10.75486, 2638.553)
    Angles = (0, 0, 0)
    name = Zoo_OuterHills
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (4035.825, -8.86208, 3765.917)
    Angles = (0, 0, 0)
    name = Zoo_GiraffePen01
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_RestartNode01 ]
    TriggerScript = Zoo_GiraffePen01Script
  }
  {
    Position = (1574.438, 16.88336, 7931.625)
    Angles = (0, 0, 0)
    name = Zoo_Hills02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart_Hills01 ]
    TriggerScript = Zoo_Hills02Script
  }
  {
    Position = (599.5193, -35.82094, 800.5272)
    Angles = (0, 0, 0)
    name = ZEnt_QP03r
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Entrance_Side02
  }
  {
    Position = (-6819.898, 688.4109, 1898.351)
    Angles = (0, 0, 0)
    name = Zoo_AviaryYard03
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartAviary02 ]
    TriggerScript = Zoo_AviaryYard03Script
  }
  {
    Position = (6485.515, 70.37706, 4848.455)
    Angles = (0, 0, 0)
    name = Zoo_LionCageRocks
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_RestartNodeLions ]
    TriggerScript = Zoo_LionCageRocksScript
  }
  {
    Position = (-2519.998, 135.4103, 7200.739)
    Angles = (0, 0, 0)
    name = Zoo_Hills01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = Zoo_Hills01Script
  }
  {
    Position = (1115.155, 211.3222, -961.299)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart01 ]
    TriggerScript = Zoo_EntPlanter01Script
  }
  {
    Position = (2507.964, 61.24251, 3013.536)
    Angles = (0, 0, 0)
    name = Zoo_Planter01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Link_0 = TRG_G_COMBO_RestartNode
    Links = [ TRG_G_COMBO_RestartNode ]
    TriggerScript = Zoo_Planter01Script
  }
  {
    Position = (1180.654, 211.3223, 475.3627)
    Angles = (0, 0, 0)
    name = Zoo_EntPlanter02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ TRG_Restart01 ]
    TriggerScript = Zoo_EntPlanter02Script
  }
  {
    Position = (2507.328, 262.7927, 9359.446)
    Angles = (0, 0, 0)
    name = zoo_hj_OuterArea
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart05 ]
    TriggerScript = zoo_hj_OuterAreaScript
  }
  {
    Position = (7312.939, 343.4904, 5282.271)
    Angles = (0, 0, 0)
    name = zoo_hj_OuterArea01
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_Restart05 ]
    TriggerScript = zoo_hj_OuterArea01Script
  }
  {
    Position = (17.59058, -339.8416, -377.4307)
    Angles = (0, 0, 0)
    name = Grass
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (122.275, 54.58698, 685.1385)
    Angles = (0, 0, 0)
    name = Zoo_Relfection01
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
  }
  {
    Position = (118.6514, -35.82084, -193.3383)
    Angles = (0, 0, 0)
    name = Zoo_XGrass
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-290.6404, -35.26638, -1500.32)
    Angles = (0, 0, 0)
    name = Zoo_EntBarrier
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-209.9664, 113.9707, 651.8051)
    Angles = (0, -3.14159, 0)
    name = ZEnt_QP02
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Entrance_Side01
  }
  {
    Position = (-2028.254, -230.7223, 6517.754)
    Angles = (0, 0, 0)
    name = Zoo_Handrail18
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail18
  }
  {
    Position = (-2635.457, -21.87366, 5879.25)
    Angles = (0, 0, 0)
    name = Zoo_AquaFrontDirt01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
    Links = [ Trg_Proset2_restartnode ]
    TriggerScript = Zoo_AquaFrontDirt01Script
  }
  {
    Position = (-2040.431, -228.7367, 7481.084)
    Angles = (0, 0, 0)
    name = Zoo_Handrail17
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Hippo_Handrail17
  }
  {
    Position = (-2033.204, -183.0767, 5873.229)
    Angles = (0, 0.7854, 0)
    name = SnackHutShadow
    Class = LevelGeometry
    CreatedAtStart
  }
  {
    Position = (-2068.482, -414.213, 4685.188)
    Angles = (0, 0, 0)
    name = LionCollision
    Class = LevelObject
    type = Normal
    CreatedAtStart
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
  }
  {
    Position = (5793.657, -255.9884, 5312.169)
    Angles = (0, 0, 0)
    name = TRG_TramNav29
    Class = Waypoint
    CreatedAtStart
    SpawnObjScript = Car_DecelForTurn01
    Links = [ TRG_TramNav11 ]
  }
  {
    Position = (-2316.674, -2582.335, 2879.222)
    Angles = (0, 0, 0)
    name = TRG_Invader_MonkeyNoises
    Class = GameObject
    type = Ghost
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_Invader_MonkeyNoisesScript
  }
  {
    Position = (3955.496, -156.9172, 7525.532)
    Angles = (0, 0, 0)
    name = ZEleph_Trench06
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = ZEleph_Trench06
  }
  {
    Position = (95.93049, -32.51287, 1310.626)
    Angles = (1.5708, -1.5708, 0)
    name = InvisoEntranceRailCollide
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-1975.319, -255.9169, 5000.758)
    Angles = (0, 0, 0)
    name = TRG_CHASE_Collision
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = TRG_CHASE_CollisionScript
  }
  {
    Position = (-1937.993, -255.9169, 4016.693)
    Angles = (0, 0, 0)
    name = TRG_CHASE_Collision01
    Class = LevelObject
    type = Normal
    AbsentInNetGames
    CollisionMode = Geometry
    SuspendDistance = 0
    lod_dist1 = 200
    lod_dist2 = 201
    TriggerScript = TRG_CHASE_Collision01Script
  }
  {
    Position = (1435.45, -49.47233, 2545.544)
    Angles = (0, 0, 0)
    name = TRG_Restart_Hut
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Hut"
  }
  {
    Position = (2882.895, -349.9782, 6479.017)
    Angles = (0, 0, 0)
    name = RhinoDown02_Collsion
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (2694.696, -349.9782, 6460.864)
    Angles = (0, 0, 0)
    name = RhinoDown01_Collsion
    Class = LevelGeometry
    CollisionMode = Geometry
  }
  {
    Position = (2448.285, -349.9782, 6469.566)
    Angles = (0, 0, 0)
    name = RhinoStartCollision01
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    TriggerScript = RhinoStartCollision01Script
  }
  {
    Position = (3148.349, -349.9782, 6469.566)
    Angles = (0, 0, 0)
    name = RhinoStartCollision02
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    TriggerScript = RhinoStartCollision02Script
  }
  {
    Position = (2088.607, -422.8685, 7232.533)
    Angles = (0, 0, -0.31416)
    name = InclinedRhinoCollision
    Class = LevelGeometry
    CreatedAtStart
    AbsentInNetGames
    CollisionMode = Geometry
    TriggerScript = InclinedRhinoCollisionScript
  }
  {
    Position = (5570.2, -164.1371, 4948.668)
    Angles = (0, -3.14159, 0)
    name = TRG_TrickSpot4_StartNode
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (5570.2, -2353.17, 4948.668)
    Angles = (0, -3.14159, 0)
    name = TRG_TrickSpot4_HideNode
    Class = Waypoint
    CreatedAtStart
  }
  {
    Position = (5216.472, -11.33833, 3659.203)
    Angles = (0, 0, 0)
    name = Zoo_GiraffePen02
    Class = LevelGeometry
    CreatedAtStart
    Links = [ TRG_RestartNode01 ]
    TriggerScript = Zoo_GiraffePen02Script
  }
  {
    Position = (118.9561, -6.42853, 3267.413)
    Angles = (0, 0, 0)
    name = WelcomeSigns04
    Class = LevelGeometry
    CreatedAtStart
    TrickObject Cluster = Zoo_Banner04
    CollisionMode = Geometry
  }
  {
    Position = (-1014.581, 95.95038, 2224.155)
    Angles = (0, 0, 0)
    name = TRG_1098
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-1993.594, 95.95039, 2224.155)
    Angles = (0, 0, 0)
    name = TRG_1099
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1098 ]
  }
  {
    Position = (-1993.593, 95.95038, 1715.774)
    Angles = (0, 0, 0)
    name = TRG_1100
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1101 ]
  }
  {
    Position = (-1014.581, 95.95036, 1716.755)
    Angles = (0, 0, 0)
    name = TRG_1101
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-3713.448, 95.95041, 2223.795)
    Angles = (0, 0, 0)
    name = TRG_1102
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1104 ]
  }
  {
    Position = (-3713.446, 95.95039, 1715.414)
    Angles = (0, 0, 0)
    name = TRG_1103
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1105 ]
  }
  {
    Position = (-2891.561, 95.95038, 2223.176)
    Angles = (0, 0, 0)
    name = TRG_1104
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2891.562, 95.95036, 1715.776)
    Angles = (0, 0, 0)
    name = TRG_1105
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_AviaryFront01
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2533.091, -132.7524, 5752.266)
    Angles = (1.5708, 0, 0)
    name = InvisoAquaBlocker01
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2533.091, -132.7524, 3622.712)
    Angles = (1.5708, 0, 0)
    name = InvisoAquaBlocker02
    Class = LevelGeometry
    CreatedAtStart
    CollisionMode = Geometry
  }
  {
    Position = (-2548.836, -2575.098, 2539.71)
    Angles = (0, 0, 0)
    name = TRG_MG_Poopie
    Class = GameObject
    type = Ghost
    CreatedAtStart
    AbsentInNetGames
    model = "none"
    SuspendDistance = 0
    lod_dist1 = 400
    lod_dist2 = 401
    TriggerScript = TRG_MG_PoopieScript
  }
  {
    Position = (5990.609, -171.7066, 5156.662)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion17
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign05
    TerrainType = TERRAIN_METALSMOOTH
  }
  {
    Position = (5990.609, -171.7066, 5022.207)
    Angles = (0, 0, 0.04363)
    name = TRG_RailSnackLion18
    Class = RailNode
    type = Metal
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign05
    TerrainType = TERRAIN_METALSMOOTH
    Links = [ TRG_RailSnackLion17 ]
  }
  {
    Position = (2986.811, -167.371, 4648.908)
    Angles = (0, 0, 0)
    name = TRG_1106
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign07
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (2852.356, -167.371, 4648.908)
    Angles = (0, 0, 0)
    name = TRG_1107
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TrickObject Cluster = Zoo_Sign07
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1106 ]
  }
  {
    Position = (-4865.995, -535.481, 3852.197)
    Angles = (0, 0, 0)
    name = TRG_1108
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1118 ]
  }
  {
    Position = (-4865.98, -535.481, 5523.458)
    Angles = (0, 0, 0)
    name = TRG_1109
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1108 ]
  }
  {
    Position = (-4146.093, -535.4811, 5539.634)
    Angles = (0, 0, 0)
    name = TRG_1110
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1120 ]
  }
  {
    Position = (-4146.128, -535.481, 5028.356)
    Angles = (0, 0, 0)
    name = TRG_1111
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1110 ]
  }
  {
    Position = (-4146.093, -535.4811, 3832.867)
    Angles = (0, 0, 0)
    name = TRG_1112
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1113 ]
  }
  {
    Position = (-4146.128, -535.481, 4341.433)
    Angles = (0, 0, 0)
    name = TRG_1113
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1122 ]
  }
  {
    Position = (-2374.461, -256.0769, 3722.941)
    Angles = (0, 0, 0)
    name = TRG_1114
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1125 ]
  }
  {
    Position = (-2688.531, -256.0769, 3723.003)
    Angles = (0, 0, 0)
    name = TRG_1115
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1114 ]
  }
  {
    Position = (-2689.456, -256.0769, 5645.865)
    Angles = (0, 0, 0)
    name = TRG_1116
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1117 ]
  }
  {
    Position = (-2375.958, -256.0769, 5645.804)
    Angles = (0, 0, 0)
    name = TRG_1117
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1127 ]
  }
  {
    Position = (-4859.904, -535.481, 3820.948)
    Angles = (0, 0, 0)
    name = TRG_1118
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-4859.952, -535.481, 5538.585)
    Angles = (0, 0, 0)
    name = TRG_1119
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1109 ]
  }
  {
    Position = (-4151.542, -535.4811, 5548.969)
    Angles = (0, 0, 0)
    name = TRG_1120
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-4150.285, -535.481, 5019.165)
    Angles = (0, 0, 0)
    name = TRG_1121
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1111 ]
  }
  {
    Position = (-4153.56, -535.481, 4355.411)
    Angles = (0, 0, 0)
    name = TRG_1122
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-4150.836, -535.4811, 3823.03)
    Angles = (0, 0, 0)
    name = TRG_1123
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1112 ]
  }
  {
    Position = (-2696.58, -256.0769, 3728.776)
    Angles = (0, 0, 0)
    name = TRG_1124
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1115 ]
  }
  {
    Position = (-2366.309, -256.0769, 3726.794)
    Angles = (0, 0, 0)
    name = TRG_1125
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (-2700.261, -256.0769, 5642.834)
    Angles = (0, 0, 0)
    name = TRG_1126
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
    Links = [ TRG_1116 ]
  }
  {
    Position = (-2366.156, -256.0769, 5641.335)
    Angles = (0, 0, 0)
    name = TRG_1127
    Class = RailNode
    type = Concrete
    CreatedAtStart
    TerrainType = TERRAIN_CONCSMOOTH
  }
  {
    Position = (4382.352, -259.2882, 3411.595)
    Angles = (0, 0, 0)
    name = TRG_Restart_Giraffe2
    Class = Restart
    type = Generic
    CreatedAtStart
    RestartName = "Giraffe"
  }
]
TriggerScripts =
[
  LoadTerrain
  TRG_G_COMPNOT_RailTable11Script
  TRG_G_COMPNOT_RailTable12Script
  TRG_G_COMPNOT_RailTable15Script
  TRG_Rail_PicnicNormal_07Script
  TRG_Rail_PicnicNormal_01Script
  TRG_Rail_PicnicNormal_03Script
  TRG_G_COMPNOT_RailTable01Script
  TRG_G_COMPNOT_RailTable07Script
  TRG_G_COMPNOT_RailTable04Script
  TRG_Rail_ZooMainHand08Script
  TRG_Rail_ZooMainHand07Script
  TRG_Rail_ZooMainHand17Script
  TRG_Rail_ZooMainHand16Script
  TRG_547Script
  TRG_559Script
  TRG_155Script
  TRGP_Teleport01Script
  TRG_742Script
  TRG_743Script
  TRG_745Script
  TRG_747Script
  TRG_749Script
  TRG_752Script
  TRG_754Script
  TRG_756Script
  TRG_840Script
  TRG_Ped_Trainer01Script
  TRG_G_COMBO_ProScript
  TRG_Goal_COMBO_BScript
  TRG_Goal_COMBO_MScript
  TRG_Goal_COMBO_OScript
  TRG_Goal_COMBO_O2Script
  TRG_G_SKATE_ProScript
  TRG_Goal_Letter_AScript
  TRG_Goal_Letter_EScript
  TRG_Goal_Letter_KScript
  TRG_Goal_Letter_TScript
  TRG_Goal_Letter_SScript
  TRG_G_HighCombo_ProScript
  TRGP_Zoo_BannerGap1Script
  TRGP_Zoo_BannerGap02Script
  TRGP_Zoo_BannerGap03Script
  TRGP_Zoo_BannerGap04Script
  TRGP_Zoo_BannerGap05Script
  TRGP_Zoo_BannerGap06Script
  TRGP_Zoo_BannerGap07Script
  TRGP_Zoo_BannerGap08Script
  trg_g_comp_Spectator01Script
  trg_g_comp_Spectator02Script
  trg_g_comp_Spectator03Script
  trg_g_comp_Spectator04Script
  trg_g_comp_Spectator05Script
  trg_g_comp_Spectator06Script
  trg_g_comp_Spectator07Script
  trg_g_comp_Spectator08Script
  TRG_G_RACE_ProScript
  TRG_G_PROLINE_ProScript
  TRG_Goal_Proline_BScript
  TRG_Goal_Proline_CScript
  TRG_Goal_Proline_MScript
  TRG_Goal_Proline_OScript
  TRG_G_COLLECT_ProScript
  TRGP_GapStart_Aqua01Script
  TRG_G_TS_PhotoGuyScript
  TRGP_GapEnd_Aqua02Script
  TRGP_GapStartWW01Script
  TRGP_GapStartWW02Script
  TRGP_GapStartBridgeScript
  TRGP_GapStartBridge01Script
  TRGP_GapStartShark01Script
  TRGP_GapEndShark01Script
  TRGP_GapStartShark03Script
  TRGP_GapEndShark04Script
  TRGP_GapStartFountainScript
  TRGP_GapEndFountain01Script
  TRGP_GapStart_Roof01Script
  TRGP_GapStart_Roof02Script
  TRGP_GapStart_Roof03Script
  TRGP_GapStart_Roof04Script
  TRGP_GapEnd_Bank02Script
  TRGP_GapStart_Bank02Script
  TRGP_GapStart_Bank01Script
  TRGP_GapEnd_Bank01Script
  TRGP_GapStart_Planter02Script
  TRGP_GapStart_Planter01Script
  TRGP_GapStart_Planter03Script
  TRGP_GapStart_Planter04Script
  TRGP_MiniGameHeight01Script
  TRGP_GapEnd_Bridge01Script
  TRGP_GapStartBridge02Script
  TRGP_GapStartBridgeRail01Script
  TRGP_GapStartBridgeRail02Script
  TRGP_GapStart_SnackBar01Script
  TRGP_GapEnd_SnackBar02Script
  TRGP_GapStart_LionLipScript
  TRGP_GapStartBridgeManualScript
  TRGP_GapStartBridgeManual01Script
  TRGP_GapStart_BackwoodsScript
  TRGP_GapStart_Backwoods01Script
  TRGP_GapStart_PopRockScript
  TRGP_GapStart_PopRock01Script
  TRGP_StartGap_BirdHouse01Script
  TRGP_StartGap_BirdHouse02Script
  TRGP_GapStart_MonkeyQPScript
  TRGP_GapStart_MonkeyQP01Script
  TRGP_GapStart_MonkeyQP02Script
  TRGP_GapStart_MonkeyQP03Script
  TRGP_GapStart_MonkeyQP04Script
  TRGP_GapStart_MonkeyQP05Script
  TRGP_StartGap_HippoPoolScript
  TRGP_EndGap_HippoPool02Script
  TRGP_EndGap_HippoPool01Script
  TRGP_StartGap_HippoPool02Script
  TRGP_GapStart_BridgeRoofScript
  TRGP_GapStart_BridgeRoof01Script
  TRGP_GapStart_LongPlanterScript
  TRGP_GapStart_LongPlanter01Script
  TRGP_GapStart_SnackBarScript
  TRGP_GapStart_SnackBar02Script
  TRGP_GapStart_Wave01Script
  TRGP_GapStart_ApeScript
  TRGP_GapEnd_Ape01Script
  TRGP_GapEnd_GorillaScript
  TRGP_GapStart_GorillaScript
  TRGP_GapStart_LongNeckScript
  TRGP_GapStart_LongNeck01Script
  TRGP_GapStart_LongPlanter02Script
  TRGP_GapStart_LongPlanter03Script
  TRGP_GapStart_Moat01Script
  TRGP_GapEnd_Moat02Script
  TRG_Ped_Elephant01Script
  TRG_Ped_Elephant02Script
  TRG_Ped_Elephant03Script
  TRG_Rail_PicnicDamage_02Script
  TRG_Rail_PicnicDamage_03Script
  TRG_Rail_PicnicDamage_07Script
  TRG_Hippo02Script
  TRG_Hippo03Script
  TRG_RhinoStanding01Script
  TRG_RhinoStanding02Script
  TRG_Rhino02Script
  TRG_Hippo_01Script
  TRG_G_COLLECT_Penguin01Script
  TRG_G_COLLECT_Penguin02Script
  TRG_G_COLLECT_Penguin03Script
  TRG_G_COLLECT_Penguin04Script
  TRG_G_COLLECT_Penguin05Script
  TRG_penguin_waddle_01Script
  TRG_penguin_02Script
  TRG_penguin_03Script
  TRG_penguin_04Script
  TRG_penguin_05Script
  TRG_penguin_06Script
  TRG_Elephant01Script
  TRG_Elephant02Script
  Zoo_HippoCollisionScript
  TRG_Elephant_StampedeScript
  TRG_Goal_Proline_O2Script
  TRG_Goal_COMBO_CScript
  TRG_Ped_Vendor01Script
  TRG_Ped_Vendor02Script
  TRG_Ped_Vendor03Script
  TRG_CASH_ICON_01Script
  TRG_CASH_ICON_02Script
  TRG_GorillaScript
  TRG_Elephant_StandingScript
  TRGP_ElephantStampedeScript
  TRG_RhinoCharging01Script
  TRG_RhinoCharging02Script
  TRG_Gorilla01Script
  TRG_CASH_ICON_03Script
  TRG_CASH_ICON_04Script
  TRG_Hippo06Script
  TRG_RailGrindBar01Script
  TRG_RailGrindBar02Script
  TRG_RailGrindBar09Script
  TRG_Seal01Script
  TRG_Seal02Script
  TRG_Seal03Script
  TRG_Lion01Script
  TRG_Lion02Script
  TRG_meerkat_01Script
  TRG_meerkat_03Script
  TRG_meerkat_04Script
  TRG_meerkat_06Script
  TRG_meerkat_09Script
  TRG_meerkat_10Script
  zoo_hj_build02Script
  TRG_CatchGorillaLooseScript
  TRG_CatchGorillaPODLeftScript
  TRG_CatchGorillaPODRightScript
  TRG_GorillaCaughtScript
  TRG_monkey_01Script
  TRG_monkey_02Script
  TRG_monkey_03Script
  TRG_monkey_04Script
  TRG_monkey_05Script
  TRG_monkey_06Script
  TRG_monkey_07Script
  TRG_monkey_08Script
  TRG_monkey_09Script
  TRG_monkey_10Script
  TRG_Hippo07Script
  TRG_Hippo08Script
  TRGP_HippoLovin01Script
  Zoo_Poop01Script
  Zoo_Poop02Script
  TRG_Ped_Monkey_05Script
  TRG_Ped_Monkey_03Script
  TRG_Ped_Monkey_02Script
  TRG_Ped_Hippo_03Script
  TRG_Ped_Hippo_01Script
  TRG_Ped_Generic13Script
  TRG_Ped_Generic14Script
  TRG_Ped_Generic15Script
  TRG_Ped_Generic19Script
  TRG_RhinoDown01Script
  TRG_RhinoDown02Script
  TRG_RhinoManagerScript
  TRG_TramScript
  TRG_Rhino_KeeperScript
  TRGP_LionKillScript
  Zoo_BreakawayCageScript
  TRGP_Teleport02Script
  TRGP_LeavingArea02Script
  TRG_FloatingLog02Script
  TRG_FloatingLog03Script
  Zoo_HippoCollision01Script
  TRG_FloatingLog08Script
  Zoo_HippoCollision04Script
  TRG_Hippo_04Script
  TRG_FloatingLog09Script
  TRG_FloatingLog10Script
  TRG_FloatingLog11Script
  TRG_Elephant_CollisionScript
  TRGP_LoseGoalHighCombo2Script
  TRG_G_TS2_PhotoGuyScript
  TRG_GorillaManagerScript
  TRG_Bird01Script
  TRG_Bird02Script
  TRG_Bird03Script
  TRG_Kaboom_EggCreatorScript
  TRG_EggMoney01Script
  TRG_EggMoney02Script
  TRG_EggMoney03Script
  TRG_G_JUDGE_COMPScript
  TRG_Ped_KennyScript
  TRG_Kenny_CollisionScript
  Zoo_Kenny_CollisionScript
  TRG_Ped_Kenny_HeelflipScript
  TRGP_TeleportZookeeperScript
  TRGP_TeleportZookeeper01Script
  TRG_Invader_Monkey01Script
  TRG_Invader_Monkey02Script
  TRG_Invader_Monkey03Script
  TRG_Poop_ControllerScript
  Zoo_SnackBarsScript
  TRG_Race_MonkeyScript
  TRG_Ped_Security_01Script
  TRG_Ped_Security_02Script
  TRG_Race_MonkeyStartScript
  TRG_Elephant_Trainer_ShootScript
  TRG_Ped_SecurityAlert01Script
  TRG_Ped_SecurityAlert02Script
  TRG_Race_MonkeyCaughtScript
  TRG_Ped_Tram_SecurityScript
  TRG_Giraffe01Script
  TRG_Giraffe02Script
  Zoo_ParkingLot01Script
  TRG_BirdNoisesScript
  TRGP_CreateBirdNoisesScript
  TRG_MonkeyNoisesScript
  TRGP_CreateMonkeyNoisesScript
  TRG_LionNoisesScript
  TRG_Elephant_RearingScript
  TRG_PenguinNoisesScript
  TRGP_CreatePenguinNoisesScript
  Zoo_ParkingLot04Script
  TRG_Ped_Kenny_HardflipScript
  dt_watersurface01Script
  Zoo_LionTopTrimScript
  Zoo_LionQP02Script
  Zoo_LionQP01Script
  Lion_moundScript
  TRG_SnackMonkeyScript
  TRG_EggLayer01Script
  TRG_EggLayer02Script
  TRG_EggLayer03Script
  TRG_Bird04Script
  TRG_Bird05Script
  TRG_Bird06Script
  TRG_Bird07Script
  TRG_Bird08Script
  TRG_Bird09Script
  TRG_Bird11Script
  TRG_Bird14Script
  TRG_Bird15Script
  TRG_Bird16Script
  TRG_Bird17Script
  TRG_MG_BirdCounterScript
  TRG_G_HighCombo2_RestartNodeScript
  TRGP_GapStart_ElephantRockScript
  TRGP_GapEnd_ElephantRockScript
  Zoo_TurnStyleRoofScript
  Zoo_HippoPoolBottomScript
  Zoo_HippoPoolBottom02Script
  Zoo_HippoWater02Script
  G_COMPNOT_Bob_Zoo_Ground03Script
  Zoo_HippoWater03Script
  TRG_Ped_Hippo_04Script
  Zoo_HippoWater05Script
  TRG_Flag_BlueScript
  TRG_Flag_GreenScript
  TRG_Flag_RedScript
  TRG_Flag_YellowScript
  TRG_penguin_waddle_02Script
  TRG_penguin_waddle_03Script
  TRG_penguin_waddle_04Script
  TRGP_PlasticNoiseScript
  TRGP_TurnstyleNoiseScript
  AQUA_PenguinAreaScript
  TRGP_MiniGameHeight02Script
  TRG_Shark01Script
  TRG_Shark02Script
  TRG_Shark03Script
  BounceDoor02Script
  BounceDoor03Script
  DoorRotate01Script
  BounceDoor01Script
  BounceDoor04Script
  DoorRotate04Script
  DoorRotate02Script
  DoorRotate03Script
  Zoo_Tram_Sign_MoveScript
  Zoo_Tram_Sign_StartScript
  Zoo_BreakAwayCage01Script
  Zoo_BreakAwayCage02Script
  Zoo_BreakAwayCage03Script
  Zoo_BreakAwayCage04Script
  Zoo_Poop03Script
  TRGP_LeavingCompScript
  TRGP_LeavingComp01Script
  Zoo_BigTankWaterScript
  Zoo_Aqua_BigTankScript
  Zoo_hj_AquariumBuild01Script
  TRG_NetGameInitScript
  Zoo_Aqua_BigTank01Script
  Zoo_hj_AquariumBuild02Script
  Zoo_hj_AquariumBuild03Script
  TRG_Proximity_AQUAScript
  TRG_Proximity_AVIARYScript
  TRG_Proximity_MONKEYScript
  G_COLLECT2_StartGap01Script
  TRG_G_COLLECT2_ProScript
  G_COLLECT2_StartGap02Script
  G_COLLECT2_StartGap03Script
  TRG_Skitch_CheckerScript
  TRG_G_TS3_RestartNodeScript
  TRG_G_TS3_PhotoguyScript
  TRG_G_SPECIAL_RestartNodeScript
  TRG_Outro_Lion_01Script
  TRG_Outro_Lion_02Script
  TRGP_GapStart_SpecialScript
  TRGP_GapEnd_SpecialScript
  TRG_G_COUNTER_ProScript
  TRG_CHASE_Lion01Script
  TRG_CHASE_Lion02Script
  TRG_Chase_ManagerScript
  TRG_Chase_EffectsScript
  TRGP_LoopPolyStart01Script
  TRG_HippoLovinScript
  TRG_HippoLovin01Script
  TRGP_LoopPolyEnd02Script
  TRG_Ped_TramRider01Script
  BobChallenge1_TRGP_LoopCheckScript
  BobChallenge1_TRGP_LoopPolyEndScript
  TRG_G_COUNTER_Loop_ChallengeObjScript
  BobChallenge1_TRGP01Script
  BobChallenge1_TRGP02Script
  BobChallenge2_TRGP01Script
  BobChallenge2_TRGP02Script
  BobChallenge3_TRGP01Script
  BobChallenge3_TRGP02Script
  TRG_Text_ChaseScript
  BobChallenge2_TRGP_LoopCheckScript
  BobChallenge3_TRGP_LoopCheckScript
  BobChallenge2_TRGP_LoopPolyEndScript
  BobChallenge3_TRGP_LoopPolyEndScript
  G_Counter_Loop_BailScript
  G_COLLECT2_StartGap04Script
  TRG_InitializerScript
  TRG_Elephant_Turd_DummyScript
  TRG_Elephant_Turd_Dummy01Script
  TRG_Elephant_Turd_Dummy02Script
  Zoo_MainBank03Script
  Zoo_HippoBackWallScript
  Zoo_GiraffePen04Script
  ZRhino_Trench07Script
  ZRhino_Trench08Script
  ZEleph_Trench07Script
  TRG_CTF_BLUEScript
  TRG_CTF_GREENScript
  TRG_CTF_REDScript
  TRG_CTF_YELLOWScript
  TRG_CASH_ICON_05Script
  TRG_CASH_ICON_06Script
  TRG_CASH_ICON_07Script
  TRG_CASH_ICON_08Script
  TRG_CASH_ICON_09Script
  TRG_CASH_ICON_10Script
  TRG_CASH_ICON_11Script
  TRG_CASH_ICON_12Script
  TRG_CASH_ICON_13Script
  TRG_CASH_ICON_14Script
  TRG_CASH_ICON_15Script
  TRG_CASH_ICON_16Script
  TRG_CASH_ICON_17Script
  TRG_CASH_ICON_18Script
  TRG_CASH_ICON_19Script
  TRG_CASH_ICON_20Script
  TRG_CASH_ICON_21Script
  TRG_CASH_ICON_22Script
  TRG_CASH_ICON_23Script
  TRG_CASH_ICON_24Script
  TRG_CASH_ICON_25Script
  TRG_CTF_BLUE_BASEScript
  TRG_CTF_GREEN_BASEScript
  TRG_CTF_RED_BASEScript
  TRG_CTF_YELLOW_BASEScript
  TRG_MG_KaboomScript
  TRG_Egg01Script
  TRG_Egg02Script
  TRG_Egg03Script
  TRG_Egg04Script
  TRG_Egg05Script
  TRG_Egg06Script
  BushCollision01Script
  BushCollision02Script
  BushCollision03Script
  BushCollision04Script
  BushCollision05Script
  BushCollision06Script
  BushCollision07Script
  BushCollision08Script
  BushCollision09Script
  BushCollision10Script
  BushCollision11Script
  BigbirdTree07Script
  BigbirdTree10Script
  rhinofatbush29Script
  fatbush12Script
  fatbush13Script
  fatbush11Script
  fatbush28Script
  fatbush14Script
  fatbush20Script
  fatbush17Script
  fatbush23Script
  fatbush22Script
  fatbush25Script
  fatbush16Script
  fatbush15Script
  fatbush18Script
  fatbush19Script
  fatbush21Script
  fatbush24Script
  fatbush26Script
  fatbush27Script
  BushCollision12Script
  Elephant_Turd01Script
  Elephant_Turd02Script
  Elephant_Turd03Script
  TRG_Poopie05Script
  TRG_Poopie01Script
  TRG_Poopie06Script
  TRG_Poopie11Script
  TRG_Poopie07Script
  TRG_Poopie09Script
  TRG_Poopie03Script
  TRG_Poopie08Script
  TRG_Poopie10Script
  TRG_Poopie04Script
  TRG_Poopie02Script
  G_COMP_Gound02Script
  G_COMPNOT_Bob_Zoo_HippoWater01Script
  G_COMPNOT_Bob_Zoo_HippoWater04Script
  G_COMP_HippoWater01Script
  G_COMP_HippoWater04Script
  G_COMP_BridgeWaterScript
  G_COMPNOT_Bob_BridgeWaterScript
  BobChallenge1_Loop01Script
  G_Counter_Loop02Script
  BobChallenge2_Loop01Script
  BobChallenge3_Loop01Script
  MovingLoop01Script
  MovingLoop02Script
  Zoo_EntPlanter02bScript
  TreeTop01Script
  TreeTop03Script
  TreeTopScript
  TreeTop02Script
  TRG_1085Script
  TRGP_GapStart_OverHillsScript
  TRGP_GapEnd_OverHillsScript
  BirdBaseScript
  ZEleph_Trench03Script
  Zoo_IvyPatchScript
  ZEleph_Trench05Script
  ZRhino_Trench02Script
  ZRhino_Trench05Script
  Zoo_AviaryYard02Script
  Zoo_AviaryYard01Script
  AVIARY_YardScript
  Zoo_hj_AquariumTopBuildScript
  ZEnt_MainEntrance01Script
  Zoo_AviaryYard07Script
  ZRhino_Trench06Script
  Zoo_LionCageRocks01Script
  Zoo_LionCageRocks02Script
  GiraffeCollision01Script
  TRG_Hippo09Script
  TRG_Hippo10Script
  TRG_GiantGatorScript
  Arco_Fountain_11Script
  ElephantRockScript
  Zoo_AQUA_BackHills01Script
  Zoo_Ground03Script
  TRG_Ped_TramDriverScript
  Zoo_HippoBackyardScript
  Zoo_EntPlanter03Script
  Zoo_EntPlanter04Script
  Zoo_GiraffePen01Script
  Zoo_Hills02Script
  Zoo_AviaryYard03Script
  Zoo_LionCageRocksScript
  Zoo_Hills01Script
  Zoo_EntPlanter01Script
  Zoo_Planter01Script
  Zoo_EntPlanter02Script
  zoo_hj_OuterAreaScript
  zoo_hj_OuterArea01Script
  Zoo_AquaFrontDirt01Script
  TRG_Invader_MonkeyNoisesScript
  TRG_CHASE_CollisionScript
  TRG_CHASE_Collision01Script
  RhinoStartCollision01Script
  RhinoStartCollision02Script
  InclinedRhinoCollisionScript
  Zoo_GiraffePen02Script
  TRG_MG_PoopieScript
]
script TRG_G_COMPNOT_RailTable11Script
  Zoo_Gap_PicnicPop2_1_3
endscript
script TRG_G_COMPNOT_RailTable12Script
  Zoo_Gap_PicnicPop2_1_3
endscript
script TRG_G_COMPNOT_RailTable15Script
  Zoo_Gap_PicnicPop2_1_3
endscript
script TRG_Rail_PicnicNormal_07Script
  Zoo_Gap_Picnic1_2_3
endscript
script TRG_Rail_PicnicNormal_01Script
  Zoo_Gap_Picnic1_2_3
endscript
script TRG_Rail_PicnicNormal_03Script
  Zoo_Gap_Picnic1_2_3
endscript
script TRG_G_COMPNOT_RailTable01Script
  Zoo_Gap_Picnic3_1_2
endscript
script TRG_G_COMPNOT_RailTable07Script
  Zoo_Gap_Picnic3_1_2
endscript
script TRG_G_COMPNOT_RailTable04Script
  Zoo_Gap_Picnic3_1_2
endscript
script TRG_Rail_ZooMainHand08Script
  Zoo_Gap_HandrailHopEnd
endscript
script TRG_Rail_ZooMainHand07Script
  Zoo_Gap_HandrailHopStart
endscript
script TRG_Rail_ZooMainHand17Script
  Zoo_Gap_HandrailHopEnd
endscript
script TRG_Rail_ZooMainHand16Script
  Zoo_Gap_HandrailHopStart
endscript
script TRG_547Script
  Zoo_Gap_ZooRoofEnd
endscript
script TRG_559Script
  Zoo_Gap_ZooRoofEnd
endscript
script TRG_155Script
  Zoo_Gap_LikeMonkeyEnd
endscript
script TRGP_Teleport01Script
  Zoo_Tram_Script
endscript
script TRGP_Teleport02Script
  Zoo_Tram_Script2
endscript
script TRG_742Script
  Zoo_LionLipGapEnd
endscript
script TRG_743Script
  Zoo_LionLipGapEnd
endscript
script TRG_745Script
  Zoo_GapEnd_WaveLow
endscript
script TRG_747Script
  Zoo_GapEnd_WaveMid
endscript
script TRG_749Script
  Zoo_GapEnd_WaveHigh
endscript
script TRG_752Script
  Zoo_GapEnd_WaveLow
endscript
script TRG_754Script
  Zoo_GapEnd_WaveMid
endscript
script TRG_756Script
  Zoo_GapEnd_WaveHigh
endscript
script TRG_840Script
  Zoo_TrickspotContinueTrigger1
endscript
script TRG_Ped_Trainer01Script
  Zoo_Elephant_Keeper
endscript
script TRG_G_COMBO_ProScript
  GenericPro
endscript
script TRG_Goal_COMBO_BScript
  COMBO_Letter
endscript
script TRG_Goal_COMBO_MScript
  COMBO_Letter
endscript
script TRG_Goal_COMBO_OScript
  COMBO_Letter
endscript
script TRG_Goal_COMBO_O2Script
  COMBO_Letter
endscript
script TRG_G_SKATE_ProScript
  GenericPro
endscript
script TRG_Goal_Letter_AScript
  SKATE_Letter
endscript
script TRG_Goal_Letter_EScript
  SKATE_Letter
endscript
script TRG_Goal_Letter_KScript
  SKATE_Letter
endscript
script TRG_Goal_Letter_TScript
  SKATE_Letter
endscript
script TRG_Goal_Letter_SScript
  SKATE_Letter
endscript
script TRG_G_HighCombo_ProScript
  GenericPro
endscript
script TRGP_Zoo_BannerGap1Script
  Zoo_BannerGap1
endscript
script TRGP_Zoo_BannerGap02Script
  DuplicateTrigger
endscript
script TRGP_Zoo_BannerGap03Script
  DuplicateTrigger
endscript
script TRGP_Zoo_BannerGap04Script
  Zoo_BannerGap2
endscript
script TRGP_Zoo_BannerGap05Script
  DuplicateTrigger
endscript
script TRGP_Zoo_BannerGap06Script
  Zoo_BannerGap3
endscript
script TRGP_Zoo_BannerGap07Script
  DuplicateTrigger
endscript
script TRGP_Zoo_BannerGap08Script
  Zoo_BannerGap4
endscript
script trg_g_comp_Spectator01Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator02Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator03Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator04Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator05Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator06Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator07Script
  Zoo_Ped_Elephant
endscript
script trg_g_comp_Spectator08Script
  Zoo_Ped_Elephant
endscript
script TRG_G_RACE_ProScript
  GenericPro
endscript
script TRG_G_PROLINE_ProScript
  GenericPro
endscript
script TRG_Goal_Proline_BScript
  COMBO_Letter
endscript
script TRG_Goal_Proline_CScript
  COMBO_Letter
endscript
script TRG_Goal_Proline_MScript
  COMBO_Letter
endscript
script TRG_Goal_Proline_OScript
  COMBO_Letter
endscript
script TRG_G_COLLECT_ProScript
  GenericPro
endscript
script TRGP_GapStart_Aqua01Script
  Zoo_TrickspotEntranceTrigger1
endscript
script TRG_G_TS_PhotoGuyScript
  GenericPro
endscript
script TRGP_GapEnd_Aqua02Script
  Zoo_TrickspotExitTrigger1
endscript
script TRGP_GapStartWW01Script
  Zoo_Gap_Wave2Wave
endscript
script TRGP_GapStartWW02Script
  Zoo_Gap_Wave2Wave
endscript
script TRGP_GapStartBridgeScript
  Zoo_Gap_BridgeTransfer
endscript
script TRGP_GapStartBridge01Script
  DuplicateTrigger
endscript
script TRGP_GapStartShark01Script
  Zoo_Gap_Start_CancelGround
endscript
script TRGP_GapEndShark01Script
  Zoo_Gap_SharkTank
endscript
script TRGP_GapStartShark03Script
  Zoo_Gap_Start_CancelGround
endscript
script TRGP_GapEndShark04Script
  Zoo_Gap_SharkTank
endscript
script TRGP_GapStartFountainScript
  Zoo_Gap_Start_CancelGround
endscript
script TRGP_GapEndFountain01Script
  Zoo_Gap_ArfArf
endscript
script TRGP_GapStart_Roof01Script
  Zoo_Gap_WelcomeToTheZoo
endscript
script TRGP_GapStart_Roof02Script
  DuplicateTrigger
endscript
script TRGP_GapStart_Roof03Script
  Zoo_Gap_ExhibitsOpen
endscript
script TRGP_GapStart_Roof04Script
  DuplicateTrigger
endscript
script TRGP_GapEnd_Bank02Script
  Zoo_Gap_BankGap
endscript
script TRGP_GapStart_Bank02Script
  Zoo_Gap_Start_CancelGroundRail
endscript
script TRGP_GapStart_Bank01Script
  Zoo_Gap_Start_CancelGround
endscript
script TRGP_GapEnd_Bank01Script
  Zoo_Gap_BankGap
endscript
script TRGP_GapStart_Planter02Script
  DuplicateTrigger
endscript
script TRGP_GapStart_Planter01Script
  Zoo_Gap_GrindPlanter
endscript
script TRGP_GapStart_Planter03Script
  DuplicateTrigger
endscript
script TRGP_GapStart_Planter04Script
  Zoo_Gap_GrindPlanter
endscript
script TRGP_MiniGameHeight01Script
  if GoalManager_GoalExists name = Zoo_Goal_minigame_height
    GoalManager_ActivateGoal name = Zoo_Goal_minigame_height
  endif
endscript
script TRGP_GapEnd_Bridge01Script
  DuplicateTrigger
endscript
script TRGP_GapStartBridge02Script
  Zoo_Gap_TakeBridge
endscript
script TRGP_GapStartBridgeRail01Script
  Zoo_Gap_GrindOver
endscript
script TRGP_GapStartBridgeRail02Script
  DuplicateTrigger
endscript
script TRGP_GapStart_SnackBar01Script
  Zoo_Gap_Start_PureAir
endscript
script TRGP_GapEnd_SnackBar02Script
  Zoo_Gap_SnackBarHop
endscript
script TRGP_GapStart_LionLipScript
  Zoo_LionLipGapStart
endscript
script TRGP_GapStartBridgeManualScript
  DuplicateTrigger
endscript
script TRGP_GapStartBridgeManual01Script
  Zoo_Gap_ManualOver
endscript
script TRGP_GapStart_BackwoodsScript
  Zoo_Gap_BackwoodsStart
endscript
script TRGP_GapStart_Backwoods01Script
  Zoo_Gap_BackwoodsEnd
endscript
script TRGP_GapStart_PopRockScript
  Zoo_Gap_PopRock
endscript
script TRGP_GapStart_PopRock01Script
  DuplicateTrigger
endscript
script TRGP_StartGap_BirdHouse01Script
  Zoo_Gap_BirdhouseRail
endscript
script TRGP_StartGap_BirdHouse02Script
  DuplicateTrigger
endscript
script TRGP_GapStart_MonkeyQPScript
  Zoo_Gap_HearNoEvil
endscript
script TRGP_GapStart_MonkeyQP01Script
  DuplicateTrigger
endscript
script TRGP_GapStart_MonkeyQP02Script
  Zoo_Gap_SeeNoEvil
endscript
script TRGP_GapStart_MonkeyQP03Script
  DuplicateTrigger
endscript
script TRGP_GapStart_MonkeyQP04Script
  Zoo_Gap_SpeakNoEvil
endscript
script TRGP_GapStart_MonkeyQP05Script
  DuplicateTrigger
endscript
script TRGP_StartGap_HippoPoolScript
  Zoo_Gap_Start_CancelGroundManual
endscript
script TRGP_EndGap_HippoPool02Script
  Zoo_Gap_HippoPool
endscript
script TRGP_EndGap_HippoPool01Script
  Zoo_Gap_HippoPool
endscript
script TRGP_StartGap_HippoPool02Script
  Zoo_Gap_Start_CancelGroundManual
endscript
script TRGP_GapStart_BridgeRoofScript
  Zoo_Gap_BridgeRoof
endscript
script TRGP_GapStart_BridgeRoof01Script
  DuplicateTrigger
endscript
script TRGP_GapStart_LongPlanterScript
  Zoo_Gap_LongPlanter
endscript
script TRGP_GapStart_LongPlanter01Script
  DuplicateTrigger
endscript
script TRGP_GapStart_SnackBarScript
  Zoo_Gap_Fries
endscript
script TRGP_GapStart_SnackBar02Script
  DuplicateTrigger
endscript
script TRGP_GapStart_Wave01Script
  Zoo_GapStart_Wave
endscript
script TRGP_GapStart_ApeScript
  Zoo_Gap_Start_CancelGroundManual
endscript
script TRGP_GapEnd_Ape01Script
  Zoo_Gap_Ape
endscript
script TRGP_GapEnd_GorillaScript
  Zoo_Gap_Gorilla
endscript
script TRGP_GapStart_GorillaScript
  Zoo_Gap_Start_CancelGroundManual
endscript
script TRGP_GapStart_LongNeckScript
  Zoo_Gap_LongNeck
endscript
script TRGP_GapStart_LongNeck01Script
  DuplicateTrigger
endscript
script TRGP_GapStart_LongPlanter02Script
  DuplicateTrigger
endscript
script TRGP_GapStart_LongPlanter03Script
  Zoo_Gap_LongPlanter
endscript
script TRGP_GapStart_Moat01Script
  Zoo_Gap_Start_PureAir
endscript
script TRGP_GapEnd_Moat02Script
  Zoo_Gap_BigMoat
endscript
script TRG_Ped_Elephant01Script
  Zoo_Ped_Elephant
endscript
script TRG_Ped_Elephant02Script
  Zoo_Ped_Elephant
endscript
script TRG_Ped_Elephant03Script
  Zoo_Ped_Elephant
endscript
script TRG_Rail_PicnicDamage_02Script
  Zoo_Gap_Picnic1_2_3
endscript
script TRG_Rail_PicnicDamage_03Script
  Zoo_Gap_Picnic1_2_3
endscript
script TRG_Rail_PicnicDamage_07Script
  Zoo_Gap_Picnic1_2_3
endscript
script TRG_Hippo02Script
  Zoo_Hippo_Noisy
endscript
script TRG_Hippo03Script
  Zoo_Hippo_Swim
endscript
script TRG_RhinoStanding01Script
  Zoo_Rhino_Standing
endscript
script TRG_RhinoStanding02Script
  Zoo_Rhino_Standing
endscript
script TRG_Rhino02Script
  Obj_PlayAnim anim = InclineIdle cycle
endscript
script TRG_Hippo_01Script
  Zoo_Hippo_Noisy
endscript
script TRG_G_COLLECT_Penguin01Script
  Zoo_Penguin_Walk flag = got_1
endscript
script TRG_G_COLLECT_Penguin02Script
  Zoo_Penguin_Walk flag = got_2
endscript
script TRG_G_COLLECT_Penguin03Script
  Zoo_Penguin_Walk flag = got_3
endscript
script TRG_G_COLLECT_Penguin04Script
  Zoo_Penguin_Walk flag = got_4
endscript
script TRG_G_COLLECT_Penguin05Script
  Zoo_Penguin_Walk flag = got_5
endscript
script TRG_penguin_waddle_01Script
  Zoo_Penguin_Waddle
endscript
script TRG_penguin_02Script
  Zoo_Penguin_Idle
endscript
script TRG_penguin_03Script
  Zoo_Penguin_Waddle
endscript
script TRG_penguin_04Script
  Zoo_Penguin_Idle
endscript
script TRG_penguin_05Script
  Zoo_Penguin_Idle
endscript
script TRG_penguin_06Script
  Zoo_Penguin_Waddle
endscript
script TRG_Elephant01Script
  Zoo_Elephant_Walk
endscript
script TRG_Elephant02Script
  Zoo_Elephant_Chillin
endscript
script Zoo_HippoCollisionScript
  if Triggertype TRIGGER_THROUGH
    if not GetFlag flag = 0
      SetFlag flag = 0
      MakeSkaterGoto HippoPlant
      begin
        wait 2 seconds
        break
      repeat
      UnsetFlag flag = 0
    endif
  endif
endscript
script TRG_Elephant_StampedeScript
  Zoo_Elephant_Stampede
endscript
script TRG_Goal_Proline_O2Script
  COMBO_Letter
endscript
script TRG_Goal_COMBO_CScript
  COMBO_Letter
endscript
script TRG_Ped_Vendor01Script
  Zoo_Ped_Worker
endscript
script TRG_Ped_Vendor02Script
  Zoo_Ped_Worker2
endscript
script TRG_Ped_Vendor03Script
  GenericPro
endscript
script TRG_CASH_ICON_01Script
  Init_Cash_Icon name = TRG_CASH_ICON_01
endscript
script TRG_CASH_ICON_02Script
  Init_Cash_Icon name = TRG_CASH_ICON_02
endscript
script TRG_GorillaScript
  Zoo_Gorilla_Walk
endscript
script TRG_Elephant_StandingScript
  Zoo_Elephant_Standing
endscript
script TRGP_ElephantStampedeScript
  Zoo_Gap_ElephantHop
endscript
script TRG_RhinoCharging01Script
  Zoo_Rhino_Charging
endscript
script TRG_RhinoCharging02Script
  Zoo_Rhino_Charging2
endscript
script TRG_Gorilla01Script
  Zoo_Gorilla
endscript
script TRG_CASH_ICON_03Script
  Init_Cash_Icon name = TRG_CASH_ICON_03
endscript
script TRG_CASH_ICON_04Script
  Init_Cash_Icon name = TRG_CASH_ICON_04
endscript
script TRG_Hippo06Script
  Zoo_Hippo_Noisy
endscript
script TRG_RailGrindBar01Script
  Zoo_Gorilla_Catch_Left
endscript
script TRG_RailGrindBar02Script
endscript
script TRG_RailGrindBar09Script
  Zoo_Gorilla_Catch_Right
endscript
script TRG_Seal01Script
  Zoo_Seal
endscript
script TRG_Seal02Script
  Zoo_Seal_Swim
endscript
script TRG_Seal03Script
  Zoo_Seal
endscript
script TRG_Lion01Script
  Zoo_Lion_Walk score = 5000 speed = 2
endscript
script TRG_Lion02Script
  Zoo_Lion_Walk score = 10000 speed = 4
endscript
script TRG_meerkat_01Script
  Zoo_Meerkat
endscript
script TRG_meerkat_03Script
  Zoo_Meerkat
endscript
script TRG_meerkat_04Script
  Zoo_Meerkat
endscript
script TRG_meerkat_06Script
  Zoo_Meerkat
endscript
script TRG_meerkat_09Script
  Zoo_Meerkat
endscript
script TRG_meerkat_10Script
  Zoo_Meerkat
endscript
script zoo_hj_build02Script
  sk3_killskater bail
endscript
script TRG_CatchGorillaLooseScript
  Zoo_Gorilla_Walk_Big
endscript
script TRG_CatchGorillaPODLeftScript
  Zoo_GorillaPOD
endscript
script TRG_CatchGorillaPODRightScript
  Zoo_GorillaPOD
endscript
script TRG_GorillaCaughtScript
  Zoo_Gorilla_Walk_Big
endscript
script TRG_monkey_01Script
  Zoo_Monkey_Fling poop = Zoo_Poop01
endscript
script TRG_monkey_02Script
  Zoo_Monkey
endscript
script TRG_monkey_03Script
  Zoo_Monkey
endscript
script TRG_monkey_04Script
  Zoo_Monkey
endscript
script TRG_monkey_05Script
  Zoo_Monkey
endscript
script TRG_monkey_06Script
  Zoo_Monkey_Walk
endscript
script TRG_monkey_07Script
  Zoo_Monkey_Walk
endscript
script TRG_monkey_08Script
  Zoo_Monkey_Walk
endscript
script TRG_monkey_09Script
  Zoo_Monkey_Fling poop = Zoo_Poop02
endscript
script TRG_monkey_10Script
  Zoo_Monkey_Fling poop = Zoo_Poop03
endscript
script TRG_Hippo07Script
  Zoo_Hippo_Eat
endscript
script TRG_Hippo08Script
  Obj_PlayAnim anim = Idle cycle
endscript
script TRGP_HippoLovin01Script
  Zoo_Hippo_Lovin
endscript
script Zoo_Poop01Script
  Zoo_Poo_Drip
endscript
script Zoo_Poop02Script
  Zoo_Poo_Drip
endscript
script TRG_Ped_Monkey_05Script
  Zoo_Ped_Elephant
endscript
script TRG_Ped_Monkey_03Script
  Zoo_Ped_Elephant
endscript
script TRG_Ped_Monkey_02Script
  CPF_PedGeneric Baby Avoid NoMove
endscript
script TRG_Ped_Hippo_03Script
  Zoo_Ped_Elephant
endscript
script TRG_Ped_Hippo_01Script
  Zoo_Ped_Elephant
endscript
script TRG_Ped_Generic13Script
  CPF_PedGeneric Friendly Fall
endscript
script TRG_Ped_Generic14Script
  CPF_PedGeneric Friendly Fall
endscript
script TRG_Ped_Generic15Script
  Zoo_Ped_Stroller_Walk
endscript
script TRG_Ped_Generic19Script
  Zoo_Ped_Elephant
endscript
script TRG_RhinoDown01Script
  Zoo_RhinoDown
endscript
script TRG_RhinoDown02Script
  Zoo_RhinoDown
endscript
script TRG_RhinoManagerScript
  Zoo_RhinoManager
endscript
script TRG_TramScript
  Zoo_Tram
endscript
script TRG_Rhino_KeeperScript
  Zoo_MG_RhinoBet
endscript
script TRGP_LionKillScript
  Zoo_KillSkater_Lions
endscript
script Zoo_BreakawayCageScript
  Zoo_BreakawayCage name = Zoo_BreakawayCage
endscript
script TRGP_LeavingArea02Script
  sk3_killskater
endscript
script TRG_FloatingLog02Script
  Zoo_Floating_Log
endscript
script TRG_FloatingLog03Script
  Zoo_Floating_Log
endscript
script Zoo_HippoCollision01Script
  if Triggertype TRIGGER_THROUGH
    if not GetFlag flag = 0
      SetFlag flag = 0
      MakeSkaterGoto HippoPlant
      begin
        wait 10 frames
        break
      repeat
      UnsetFlag flag = 0
    endif
  endif
endscript
script TRG_FloatingLog08Script
  Zoo_Floating_Log
endscript
script Zoo_HippoCollision04Script
  if Triggertype TRIGGER_THROUGH
    if not GetFlag flag = 0
      SetFlag flag = 0
      MakeSkaterGoto HippoPlant
      begin
        wait 10 frames
        break
      repeat
      UnsetFlag flag = 0
    endif
  endif
endscript
script TRG_Hippo_04Script
  Zoo_Hippo_Noisy
endscript
script TRG_FloatingLog09Script
  Zoo_Floating_Log2
endscript
script TRG_FloatingLog10Script
  Zoo_Floating_Log
endscript
script TRG_FloatingLog11Script
  Zoo_Floating_Log2
endscript
script TRG_Elephant_CollisionScript
  Zoo_Elephant_Collision
endscript
script TRGP_LoseGoalHighCombo2Script
  Zoo_LoseHighCombo2
endscript
script TRG_G_TS2_PhotoGuyScript
  GenericPro
endscript
script TRG_GorillaManagerScript
  Zoo_Gorilla_Init
endscript
script TRG_Bird01Script
  Zoo_Cockatoo
endscript
script TRG_Bird02Script
  Zoo_Cockatoo
endscript
script TRG_Bird03Script
  Zoo_Cockatoo
endscript
script TRG_Kaboom_EggCreatorScript
  Kaboom_Make_Eggs
endscript
script TRG_EggMoney01Script
  Goal_Money
endscript
script TRG_EggMoney02Script
  Goal_Money
endscript
script TRG_EggMoney03Script
  Goal_Money
endscript
script TRG_G_JUDGE_COMPScript
  GenericPro
endscript
script TRG_Ped_KennyScript
  Zoo_Kenny
endscript
script TRG_Kenny_CollisionScript
  zoo_crap
endscript
script Zoo_Kenny_CollisionScript
  Zoo_Kenny_Gap
endscript
script TRG_Ped_Kenny_HeelflipScript
  Obj_SpawnScript Zoo_Kenny_FinishGoal_Heelflip
  AddGoalArrow
  Zoo_Kenny_Run
endscript
script TRGP_TeleportZookeeperScript
  if InNetGame
  else
    TeleportSkaterToNode nodename = TRG_Restart_Giraffe2
    TeleportSkaterToNode nodename = TRG_Restart_ZooKeeper
  endif
endscript
script TRGP_TeleportZookeeper01Script
  TeleportSkaterToNode nodename = TRG_Restart_Giraffe
endscript
script TRG_Invader_Monkey01Script
  Zoo_Monkey_Walk
endscript
script TRG_Invader_Monkey02Script
  Zoo_Monkey_Walk
endscript
script TRG_Invader_Monkey03Script
  Zoo_Monkey_Walk
endscript
script TRG_Poop_ControllerScript
  Zoo_Poop_Controller
endscript
script Zoo_SnackBarsScript
  Zoo_Gap_StartElephant
endscript
script TRG_Race_MonkeyScript
  Zoo_Monkey_Race
endscript
script TRG_Ped_Security_01Script
  Zoo_AddGoalArrow
  Obj_PlayAnim anim = Ped_M_Idle2 cycle
endscript
script TRG_Ped_Security_02Script
  Zoo_AddGoalArrow
  Obj_PlayAnim anim = Ped_M_Idle2 cycle
endscript
script TRG_Race_MonkeyStartScript
  Obj_PlayAnim anim = Idle cycle
endscript
script TRG_Elephant_Trainer_ShootScript
  Zoo_ElephantTrainer_Shoot
endscript
script TRG_Ped_SecurityAlert01Script
  Zoo_Ped_Security_Alert
endscript
script TRG_Ped_SecurityAlert02Script
  Zoo_Ped_Security_Alert
endscript
script TRG_Race_MonkeyCaughtScript
  Obj_PlayAnim anim = Idle cycle
endscript
script TRG_Ped_Tram_SecurityScript
  Obj_PlayAnim anim = Ped_M_Idle2 cycle
endscript
script TRG_Giraffe01Script
  Zoo_Giraffe_Walk
endscript
script TRG_Giraffe02Script
  Zoo_Giraffe_Tree
endscript
script Zoo_ParkingLot01Script
  sk3_killskater bail
endscript
script TRG_BirdNoisesScript
  Zoo_BirdNoises
endscript
script TRGP_CreateBirdNoisesScript
  Zoo_CreateBirdNoises
endscript
script TRG_MonkeyNoisesScript
  Zoo_MonkeyNoises
endscript
script TRGP_CreateMonkeyNoisesScript
  Zoo_CreateMonkeyNoises
endscript
script TRG_LionNoisesScript
  Zoo_LionNoises
endscript
script TRG_Elephant_RearingScript
  Zoo_Elephant_Rearing
endscript
script TRG_PenguinNoisesScript
  Zoo_PenguinNoises
endscript
script TRGP_CreatePenguinNoisesScript
  Zoo_CreatePenguinNoises
endscript
script Zoo_ParkingLot04Script
  sk3_killskater bail
endscript
script TRG_Ped_Kenny_HardflipScript
  Obj_SpawnScript Zoo_Kenny_FinishGoal_Hardflip
  AddGoalArrow
  Zoo_Kenny_Run
endscript
script dt_watersurface01Script
  SK3_KillSkater_Water
endscript
script Zoo_LionTopTrimScript
  sk3_killskater bail
endscript
script Zoo_LionQP02Script
  Zoo_Gap_StartLions
endscript
script Zoo_LionQP01Script
  Zoo_Gap_StartLions
endscript
script Lion_moundScript
  sk3_killskater bail
endscript
script TRG_SnackMonkeyScript
  Obj_PlayAnim anim = Idle cycle
endscript
script TRG_EggLayer01Script
  Zoo_Cockatoo_Egg
endscript
script TRG_EggLayer02Script
  Zoo_Cockatoo_Egg
endscript
script TRG_EggLayer03Script
  Zoo_Cockatoo_Egg
endscript
script TRG_Bird04Script
  Zoo_Cockatoo
endscript
script TRG_Bird05Script
  Zoo_Cockatoo
endscript
script TRG_Bird06Script
  Zoo_Cockatoo
endscript
script TRG_Bird07Script
  Zoo_Cockatoo
endscript
script TRG_Bird08Script
  Zoo_Cockatoo
endscript
script TRG_Bird09Script
  Zoo_Cockatoo
endscript
script TRG_Bird11Script
  Zoo_Cockatoo
endscript
script TRG_Bird14Script
  Zoo_Cockatoo
endscript
script TRG_Bird15Script
  Zoo_Cockatoo
endscript
script TRG_Bird16Script
  Zoo_Cockatoo
endscript
script TRG_Bird17Script
  Zoo_Cockatoo
endscript
script TRG_MG_BirdCounterScript
  CockatooCounter
endscript
script TRG_G_HighCombo2_RestartNodeScript
  printf "Drop In Bitch"
  MakeSkaterGoto DropIn
endscript
script TRGP_GapStart_ElephantRockScript
  Zoo_ElephantRockGap
endscript
script TRGP_GapEnd_ElephantRockScript
  DuplicateTrigger
endscript
script Zoo_TurnStyleRoofScript
  Zoo_Gap_ZooRoof
endscript
script Zoo_HippoPoolBottomScript
  Zoo_Hippo_Island
endscript
script Zoo_HippoPoolBottom02Script
  Zoo_Hippo_Island
endscript
script Zoo_HippoWater02Script
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
  endif
  SK3_KillSkater_Water
endscript
script G_COMPNOT_Bob_Zoo_Ground03Script
  sk3_killskater bail
endscript
script Zoo_HippoWater03Script
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
  endif
  SK3_KillSkater_Water
endscript
script TRG_Ped_Hippo_04Script
  CPF_PedGeneric Baby Avoid NoMove
endscript
script Zoo_HippoWater05Script
  SK3_KillSkater_Water
endscript
script TRG_Flag_BlueScript
  Team_Flag blue
endscript
script TRG_Flag_GreenScript
  Team_Flag green
endscript
script TRG_Flag_RedScript
  Team_Flag red
endscript
script TRG_Flag_YellowScript
  Team_Flag yellow
endscript
script TRG_penguin_waddle_02Script
  Zoo_Penguin_Waddle
endscript
script TRG_penguin_waddle_03Script
  Zoo_Penguin_Waddle
endscript
script TRG_penguin_waddle_04Script
  Zoo_Penguin_Waddle
endscript
script TRGP_PlasticNoiseScript
  PlayStream HitPlasticStrips_rd2 vol = 50
endscript
script TRGP_TurnstyleNoiseScript
  PlayStream HitGates vol = 25
endscript
script AQUA_PenguinAreaScript
  SK3_KillSkater_Water
endscript
script TRGP_MiniGameHeight02Script
  GoalManager_DeActivateGoal name = Zoo_Goal_minigame_height
endscript
script TRG_Shark01Script
  Zoo_Shark_Swim_Big
endscript
script TRG_Shark02Script
  Zoo_Shark_Swim
endscript
script TRG_Shark03Script
  Zoo_Shark_Swim
endscript
script BounceDoor02Script
  Zoo_Door_Fly
endscript
script BounceDoor03Script
  Zoo_Door_Fly
endscript
script DoorRotate01Script
  Zoo_Door_Rotate
endscript
script BounceDoor01Script
  Zoo_Door_Fly
endscript
script BounceDoor04Script
  Zoo_Door_Fly
endscript
script DoorRotate04Script
  Zoo_Door_Rotate
endscript
script DoorRotate02Script
  Zoo_Door_Rotate
endscript
script DoorRotate03Script
  Zoo_Door_Rotate
endscript
script Zoo_Tram_Sign_MoveScript
  Zoo_Tram_Sign
endscript
script Zoo_Tram_Sign_StartScript
  Zoo_Tram_Sign_Knock
endscript
script Zoo_BreakAwayCage01Script
  Zoo_BreakawayCage name = Zoo_BreakAwayCage01
endscript
script Zoo_BreakAwayCage02Script
  Zoo_BreakawayCage name = Zoo_BreakAwayCage02
endscript
script Zoo_BreakAwayCage03Script
  Zoo_BreakawayCage name = Zoo_BreakAwayCage03
endscript
script Zoo_BreakAwayCage04Script
  Zoo_BreakawayCage name = Zoo_BreakAwayCage04
endscript
script Zoo_Poop03Script
  Zoo_Poo_Drip
endscript
script TRGP_LeavingCompScript
  goal_comp_leave_area goal_id = Zoo_Goal_Comp
endscript
script TRGP_LeavingComp01Script
  goal_comp_enter_area goal_id = Zoo_Goal_Comp
endscript
script Zoo_BigTankWaterScript
  SK3_KillSkater_Water
endscript
script Zoo_Aqua_BigTankScript
  sk3_killskater
endscript
script Zoo_hj_AquariumBuild01Script
  sk3_killskater bail
endscript
script TRG_NetGameInitScript
  Zoo_NetGameInit
endscript
script Zoo_Aqua_BigTank01Script
  sk3_killskater
endscript
script Zoo_hj_AquariumBuild02Script
  sk3_killskater bail
endscript
script Zoo_hj_AquariumBuild03Script
  sk3_killskater bail
endscript
script TRG_Proximity_AQUAScript
  if Inside
    Visible prefix = "AQUA"
    Create prefix = "TRG_penguin_waddle_"
  else
    Invisible prefix = "AQUA"
    Kill prefix = "TRG_penguin_waddle_"
  endif
endscript
script TRG_Proximity_AVIARYScript
  if Inside
    Visible prefix = "AVIARY"
  else
    Invisible prefix = "AVIARY"
  endif
endscript
script TRG_Proximity_MONKEYScript
  if Inside
    Visible prefix = "MONKEY"
  else
    Invisible prefix = "MONKEY"
  endif
endscript
script G_COLLECT2_StartGap01Script
  Zoo_Goal_collect2_got_1
endscript
script TRG_G_COLLECT2_ProScript
  GenericPro
endscript
script G_COLLECT2_StartGap02Script
  Zoo_Goal_collect2_got_2
endscript
script G_COLLECT2_StartGap03Script
  Zoo_Goal_collect2_got_3
endscript
script TRG_Skitch_CheckerScript
  ZOO_Skitch_Checker
endscript
script TRG_G_TS3_RestartNodeScript
  MakeSkaterGoto DropIn
endscript
script TRG_G_TS3_PhotoguyScript
  GenericPro
endscript
script TRG_G_SPECIAL_RestartNodeScript
  printf "Drop In Bitch"
  MakeSkaterGoto DropIn
endscript
script TRG_Outro_Lion_01Script
  Zoo_Lion_Outro
endscript
script TRG_Outro_Lion_02Script
  Zoo_Lion_Outro
endscript
script TRGP_GapStart_SpecialScript
  ZOO_goal_special_StartGap
endscript
script TRGP_GapEnd_SpecialScript
  ZOO_goal_special_EndGap
endscript
script TRG_G_COUNTER_ProScript
  GenericPro
endscript
script TRG_CHASE_Lion01Script
  Zoo_Chase_Lion_Waiting
endscript
script TRG_CHASE_Lion02Script
  Zoo_Chase_Lion_Waiting
endscript
script TRG_Chase_ManagerScript
  Zoo_Chase_Manager
endscript
script TRG_Chase_EffectsScript
  Zoo_Chase_Effects
endscript
script TRGP_LoopPolyStart01Script
  TwoWayLoopCheck
endscript
script TRG_HippoLovinScript
  Zoo_Hippo_Lovin_Wait
endscript
script TRG_HippoLovin01Script
  Zoo_Hippo_Lovin_Wait
endscript
script TRGP_LoopPolyEnd02Script
  TwoWayLoopCheck
endscript
script TRG_Ped_TramRider01Script
  Zoo_Gorilla_Tram
endscript
script BobChallenge1_TRGP_LoopCheckScript
  TwoWayLoopCheck
endscript
script BobChallenge1_TRGP_LoopPolyEndScript
  TwoWayLoopCheck
endscript
script TRG_G_COUNTER_Loop_ChallengeObjScript
  Zoo_BobChallengeManager
endscript
script BobChallenge1_TRGP01Script
  Zoo_BobChallenge1_Gaps1_1
endscript
script BobChallenge1_TRGP02Script
  Zoo_BobChallenge1_Gaps1_2
endscript
script BobChallenge2_TRGP01Script
  Zoo_BobChallenge2_Gaps1_1
endscript
script BobChallenge2_TRGP02Script
  Zoo_BobChallenge2_Gaps1_2
endscript
script BobChallenge3_TRGP01Script
  Zoo_BobChallenge3_Gaps1_2
endscript
script BobChallenge3_TRGP02Script
  Zoo_BobChallenge3_Gaps1_1
endscript
script TRG_Text_ChaseScript
  Zoo_Chase_Text
endscript
script BobChallenge2_TRGP_LoopCheckScript
  TwoWayLoopCheck
endscript
script BobChallenge3_TRGP_LoopCheckScript
  TwoWayLoopCheck
endscript
script BobChallenge2_TRGP_LoopPolyEndScript
  TwoWayLoopCheck
endscript
script BobChallenge3_TRGP_LoopPolyEndScript
  TwoWayLoopCheck
endscript
script G_Counter_Loop_BailScript
  if not IsAlive name = TRG_SkaterBailed
    Create name = TRG_SkaterBailed
  endif
endscript
script G_COLLECT2_StartGap04Script
  Zoo_Goal_collect2_got_4
endscript
script TRG_InitializerScript
  Zoo_Initialize
endscript
script TRG_Elephant_Turd_DummyScript
  Zoo_Elephant_Turd_Creator_Wait turd = Elephant_Turd01
endscript
script TRG_Elephant_Turd_Dummy01Script
  Zoo_Elephant_Turd_Creator_Wait turd = Elephant_Turd02
endscript
script TRG_Elephant_Turd_Dummy02Script
  Zoo_Elephant_Turd_Creator_Wait turd = Elephant_Turd03
endscript
script Zoo_MainBank03Script
  sk3_killskater bail
endscript
script Zoo_HippoBackWallScript
  sk3_killskater bail
endscript
script Zoo_GiraffePen04Script
  sk3_killskater bail
endscript
script ZRhino_Trench07Script
  sk3_killskater bail
endscript
script ZRhino_Trench08Script
  sk3_killskater bail
endscript
script ZEleph_Trench07Script
  sk3_killskater bail
endscript
script TRG_CTF_BLUEScript
  Team_Flag blue
endscript
script TRG_CTF_GREENScript
  Team_Flag green
endscript
script TRG_CTF_REDScript
  Team_Flag red
endscript
script TRG_CTF_YELLOWScript
  Team_Flag yellow
endscript
script TRG_CASH_ICON_05Script
  Init_Cash_Icon name = TRG_CASH_ICON_05
endscript
script TRG_CASH_ICON_06Script
  Init_Cash_Icon name = TRG_CASH_ICON_06
endscript
script TRG_CASH_ICON_07Script
  Init_Cash_Icon name = TRG_CASH_ICON_07
endscript
script TRG_CASH_ICON_08Script
  Init_Cash_Icon name = TRG_CASH_ICON_08
endscript
script TRG_CASH_ICON_09Script
  Init_Cash_Icon name = TRG_CASH_ICON_09
endscript
script TRG_CASH_ICON_10Script
  Init_Cash_Icon name = TRG_CASH_ICON_10
endscript
script TRG_CASH_ICON_11Script
  Init_Cash_Icon name = TRG_CASH_ICON_11
endscript
script TRG_CASH_ICON_12Script
  Init_Cash_Icon name = TRG_CASH_ICON_12
endscript
script TRG_CASH_ICON_13Script
  Init_Cash_Icon name = TRG_CASH_ICON_13
endscript
script TRG_CASH_ICON_14Script
  Init_Cash_Icon name = TRG_CASH_ICON_14
endscript
script TRG_CASH_ICON_15Script
  Init_Cash_Icon name = TRG_CASH_ICON_15
endscript
script TRG_CASH_ICON_16Script
  Init_Cash_Icon name = TRG_CASH_ICON_16
endscript
script TRG_CASH_ICON_17Script
  Init_Cash_Icon name = TRG_CASH_ICON_17
endscript
script TRG_CASH_ICON_18Script
  Init_Cash_Icon name = TRG_CASH_ICON_18
endscript
script TRG_CASH_ICON_19Script
  Init_Cash_Icon name = TRG_CASH_ICON_19
endscript
script TRG_CASH_ICON_20Script
  Init_Cash_Icon name = TRG_CASH_ICON_20
endscript
script TRG_CASH_ICON_21Script
  Init_Cash_Icon name = TRG_CASH_ICON_21
endscript
script TRG_CASH_ICON_22Script
  Init_Cash_Icon name = TRG_CASH_ICON_22
endscript
script TRG_CASH_ICON_23Script
  Init_Cash_Icon name = TRG_CASH_ICON_23
endscript
script TRG_CASH_ICON_24Script
  Init_Cash_Icon name = TRG_CASH_ICON_24
endscript
script TRG_CASH_ICON_25Script
  Init_Cash_Icon name = TRG_CASH_ICON_25
endscript
script TRG_CTF_BLUE_BASEScript
  Team_Flag_Base blue
endscript
script TRG_CTF_GREEN_BASEScript
  Team_Flag_Base green
endscript
script TRG_CTF_RED_BASEScript
  Team_Flag_Base red
endscript
script TRG_CTF_YELLOW_BASEScript
  Team_Flag_Base yellow
endscript
script TRG_MG_KaboomScript
  Zoo_MG_EggDrop
endscript
script TRG_Egg01Script
  Kaboom_Egg
endscript
script TRG_Egg02Script
  Kaboom_Egg
endscript
script TRG_Egg03Script
  Kaboom_Egg
endscript
script TRG_Egg04Script
  Kaboom_Egg
endscript
script TRG_Egg05Script
  Kaboom_Egg
endscript
script TRG_Egg06Script
  Kaboom_Egg
endscript
script BushCollision01Script
  Playsound bonkbush
endscript
script BushCollision02Script
  Playsound bonkbush
endscript
script BushCollision03Script
  Playsound bonkbush
endscript
script BushCollision04Script
  Playsound bonkbush
endscript
script BushCollision05Script
  Playsound bonkbush
endscript
script BushCollision06Script
  Playsound bonkbush
endscript
script BushCollision07Script
  Playsound bonkbush
endscript
script BushCollision08Script
  Playsound bonkbush
endscript
script BushCollision09Script
  Playsound bonkbush
endscript
script BushCollision10Script
  Playsound bonkbush
endscript
script BushCollision11Script
  Playsound bonkbush
endscript
script BigbirdTree07Script
  random( @ ) @Playsound bonkbush
endscript
script BigbirdTree10Script
  random( @ ) @Playsound bonkbush
endscript
script rhinofatbush29Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush12Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush13Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush11Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush28Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush14Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush20Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush17Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush23Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush22Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush25Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush16Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush15Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush18Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush19Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush21Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush24Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush26Script
  random( @ ) @Playsound bonkbush
endscript
script fatbush27Script
  random( @ ) @Playsound bonkbush
endscript
script BushCollision12Script
  Playsound bonkbush
endscript
script Elephant_Turd01Script
  Zoo_Elephant_Turd
endscript
script Elephant_Turd02Script
  Zoo_Elephant_Turd
endscript
script Elephant_Turd03Script
  Zoo_Elephant_Turd
endscript
script TRG_Poopie05Script
  Zoo_Poopie
endscript
script TRG_Poopie01Script
  Zoo_Poopie
endscript
script TRG_Poopie06Script
  Zoo_Poopie
endscript
script TRG_Poopie11Script
  Zoo_Poopie
endscript
script TRG_Poopie07Script
  Zoo_Poopie
endscript
script TRG_Poopie09Script
  Zoo_Poopie
endscript
script TRG_Poopie03Script
  Zoo_Poopie
endscript
script TRG_Poopie08Script
  Zoo_Poopie
endscript
script TRG_Poopie10Script
  Zoo_Poopie
endscript
script TRG_Poopie04Script
  Zoo_Poopie
endscript
script TRG_Poopie02Script
  Zoo_Poopie
endscript
script G_COMP_Gound02Script
  sk3_killskater bail
endscript
script G_COMPNOT_Bob_Zoo_HippoWater01Script
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
  endif
  SK3_KillSkater_Water
endscript
script G_COMPNOT_Bob_Zoo_HippoWater04Script
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
  endif
  SK3_KillSkater_Water
endscript
script G_COMP_HippoWater01Script
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
    SK3_KillSkater_Water
  else
    if GoalManager_GoalIsActive name = Zoo_Goal_Comp
      SK3_KillSkater_Water nodename = Trg_G_COMP_restartnode
    else
      SK3_KillSkater_Water
    endif
  endif
endscript
script G_COMP_HippoWater04Script
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
    SK3_KillSkater_Water
  else
    if GoalManager_GoalIsActive name = Zoo_Goal_Comp
      SK3_KillSkater_Water nodename = Trg_G_COMP_restartnode
    else
      SK3_KillSkater_Water
    endif
  endif
endscript
script G_COMP_BridgeWaterScript
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
  endif
  SK3_KillSkater_Water
endscript
script G_COMPNOT_Bob_BridgeWaterScript
  if GoalManager_GoalIsActive name = Zoo_goal_Horse
    GoalManager_LoseGoal name = Zoo_goal_Horse
  endif
  SK3_KillSkater_Water
endscript
script BobChallenge1_Loop01Script
  if Triggertype TRIGGER_SKATE_ONTO
    printf "skate_onto"
    if not IsAlive name = TRG_SkaterLanded
      Create name = TRG_SkaterLanded
      printf "create skaterLanded"
    endif
  endif
endscript
script G_Counter_Loop02Script
  if Triggertype TRIGGER_SKATE_ONTO
    printf "skate_onto"
    if not IsAlive name = TRG_SkaterLanded
      Create name = TRG_SkaterLanded
      printf "create skaterLanded"
    endif
  endif
endscript
script BobChallenge2_Loop01Script
  if Triggertype TRIGGER_SKATE_ONTO
    printf "skate_onto"
    if not IsAlive name = TRG_SkaterLanded
      Create name = TRG_SkaterLanded
      printf "create skaterLanded"
    endif
  endif
endscript
script BobChallenge3_Loop01Script
  if Triggertype TRIGGER_SKATE_ONTO
    printf "skate_onto"
    if not IsAlive name = TRG_SkaterLanded
      Create name = TRG_SkaterLanded
      printf "create skaterLanded"
    endif
  endif
endscript
script MovingLoop01Script
  Zoo_MovingLoop nodename = BobChallenge2_Loop
endscript
script MovingLoop02Script
  Zoo_MovingLoop nodename = BobChallenge3_Loop
endscript
script Zoo_EntPlanter02bScript
  sk3_killskater bail
endscript
script TreeTop01Script
  random( @ ) @Playsound bonkbush
endscript
script TreeTop03Script
  random( @ ) @Playsound bonkbush
endscript
script TreeTopScript
  random( @ ) @Playsound bonkbush
endscript
script TreeTop02Script
  random( @ ) @Playsound bonkbush
endscript
script TRG_1085Script
  Zoo_Gap_LikeMonkey
endscript
script TRGP_GapStart_OverHillsScript
  Zoo_Gap_Start_PureAir
endscript
script TRGP_GapEnd_OverHillsScript
  Zoo_Gap_OverHills
endscript
script BirdBaseScript
  sk3_killskater bail
endscript
script ZEleph_Trench03Script
  sk3_killskater bail
endscript
script Zoo_IvyPatchScript
  sk3_killskater bail
endscript
script ZEleph_Trench05Script
  sk3_killskater bail
endscript
script ZRhino_Trench02Script
  sk3_killskater bail
endscript
script ZRhino_Trench05Script
  sk3_killskater bail
endscript
script Zoo_AviaryYard02Script
  sk3_killskater bail
endscript
script Zoo_AviaryYard01Script
  sk3_killskater bail
endscript
script AVIARY_YardScript
  sk3_killskater bail
endscript
script Zoo_hj_AquariumTopBuildScript
  sk3_killskater bail
endscript
script ZEnt_MainEntrance01Script
  Zoo_Gap_BoxOffice
endscript
script Zoo_AviaryYard07Script
  sk3_killskater bail
endscript
script ZRhino_Trench06Script
  sk3_killskater bail
endscript
script Zoo_LionCageRocks01Script
  sk3_killskater bail
endscript
script Zoo_LionCageRocks02Script
  sk3_killskater bail
endscript
script GiraffeCollision01Script
  Obj_LockToObject ObjectName = TRG_Giraffe01 (0, 0, 0)
endscript
script TRG_Hippo09Script
  Zoo_Hippo_Swim
endscript
script TRG_Hippo10Script
  Zoo_Hippo_Aquarium
endscript
script TRG_GiantGatorScript
  Zoo_GiantGator
endscript
script Arco_Fountain_11Script
  sk3_killskater
endscript
script ElephantRockScript
  sk3_killskater bail
endscript
script Zoo_AQUA_BackHills01Script
  sk3_killskater bail
endscript
script Zoo_Ground03Script
  sk3_killskater bail
endscript
script TRG_Ped_TramDriverScript
  Zoo_TramDriver myTram = TRG_Tram
endscript
script Zoo_HippoBackyardScript
  sk3_killskater bail
endscript
script Zoo_EntPlanter03Script
  sk3_killskater bail
endscript
script Zoo_EntPlanter04Script
  sk3_killskater bail
endscript
script Zoo_GiraffePen01Script
  sk3_killskater bail
endscript
script Zoo_Hills02Script
  sk3_killskater bail
endscript
script Zoo_AviaryYard03Script
  sk3_killskater bail
endscript
script Zoo_LionCageRocksScript
  sk3_killskater bail
endscript
script Zoo_Hills01Script
  sk3_killskater bail
endscript
script Zoo_EntPlanter01Script
  sk3_killskater bail
endscript
script Zoo_Planter01Script
  sk3_killskater bail
endscript
script Zoo_EntPlanter02Script
  sk3_killskater bail
endscript
script zoo_hj_OuterAreaScript
  sk3_killskater bail
endscript
script zoo_hj_OuterArea01Script
  sk3_killskater bail
endscript
script Zoo_AquaFrontDirt01Script
  sk3_killskater bail
endscript
script TRG_Invader_MonkeyNoisesScript
  Zoo_MonkeyNoises
endscript
script TRG_CHASE_CollisionScript
  Obj_LockToObject ObjectName = TRG_CHASE_Lion01 (0, 0, 0)
endscript
script TRG_CHASE_Collision01Script
  Obj_LockToObject ObjectName = TRG_CHASE_Lion02 (0, 0, 0)
endscript
script RhinoStartCollision01Script
  Zoo_RhinoBonk
endscript
script RhinoStartCollision02Script
  Zoo_RhinoBonk
endscript
script InclinedRhinoCollisionScript
  Zoo_RhinoBonk
endscript
script Zoo_GiraffePen02Script
  sk3_killskater bail
endscript
script TRG_MG_PoopieScript
  Zoo_MG_MonkeyPoo
endscript
script LoadTerrain
  SetTerrainDefault
  SetTerrainConcSmooth
  SetTerrainMetalSmooth
  SetTerrainWood
  SetTerrainBrick
  SetTerrainTile
  SetTerrainAsphalt
  SetTerrainGrass
  SetTerrainDirt
  SetTerrainDirtPacked
endscript
script load_level_anims
  animload_human
  if not InNetGame
    animload_ped_LT
  endif
  if not InNetGame
    animload_anl_hippo
  endif
  if not InNetGame
    animload_anl_rhino
  endif
  if not InNetGame
    animload_anl_penguin
  endif
  if not InNetGame
    animload_anl_elephant
  endif
  if not InNetGame
    animload_anl_gorilla
  endif
  if not InNetGame
    animload_anl_seal
  endif
  if not InNetGame
    animload_anl_lion
  endif
  if not InNetGame
    animload_anl_meerkat
  endif
  if not InNetGame
    animload_anl_monkey
  endif
  if not InNetGame
    animload_ped_baby
  endif
  if not InNetGame
    animload_Ped_TP
  endif
  if not InNetGame
    animload_ped_st
  endif
  if not InNetGame
    animload_anl_cockatoo
  endif
  if not InNetGame
    animload_Ped_Judge
  endif
  if not InNetGame
    animload_ped_ZM
  endif
  if not InNetGame
    animload_ped_ET
  endif
  if not InNetGame
    animload_ped_BP
  endif
  if not InNetGame
    animload_anl_giraffe
  endif
  if not InNetGame
    animload_anl_shark
  endif
  if not InNetGame
    animload_ped_photo
  endif
  if not InNetGame
    animload_Ped_Egg
  endif
  if not InNetGame
    animload_anl_gator
  endif
  if not InNetGame
    animload_ped_ranger
  endif
endscript
script LoadCameras
  LoadAsset "levels\zoo\PROSET1_VIEWCAM.ska" PROSET1_VIEWCAM
  LoadAsset "levels\zoo\PROSET2_VIEWCAM.ska" PROSET2_VIEWCAM
  LoadAsset "levels\zoo\PROSET3_VIEWCAM.ska" PROSET3_VIEWCAM
  LoadAsset "levels\zoo\G_COMP_ViewCam.ska" G_COMP_ViewCam
  LoadAsset "levels\zoo\G_HS_CameraStart.ska" G_HS_CameraStart
  LoadAsset "levels\zoo\G_GAP_CameraStart.ska" G_GAP_CameraStart
  LoadAsset "levels\zoo\G_COMBO_CameraStart.ska" G_COMBO_CameraStart
  LoadAsset "levels\zoo\G_PROLINE_CameraStart.ska" G_PROLINE_CameraStart
  LoadAsset "levels\zoo\G_HS_CameraSuccess.ska" G_HS_CameraSuccess
  LoadAsset "levels\zoo\G_PS_CameraSuccess.ska" G_PS_CameraSuccess
  LoadAsset "levels\zoo\G_PS_CameraStart.ska" G_PS_CameraStart
  LoadAsset "levels\zoo\G_SS_CameraSuccess.ska" G_SS_CameraSuccess
  LoadAsset "levels\zoo\G_SS_CameraStart.ska" G_SS_CameraStart
  LoadAsset "levels\zoo\G_HighCombo_CameraSuccess.ska" G_HighCombo_CameraSuccess
  LoadAsset "levels\zoo\G_HighCombo_CameraStart.ska" G_HighCombo_CameraStart
  LoadAsset "levels\zoo\G_SKATE_CameraStart.ska" G_SKATE_CameraStart
  LoadAsset "levels\zoo\G_SKATE_CameraSuccess.ska" G_SKATE_CameraSuccess
  LoadAsset "levels\zoo\G_COMBO_CameraSuccess.ska" G_COMBO_CameraSuccess
  LoadAsset "levels\zoo\G_TS_CameraSuccess.ska" G_TS_CameraSuccess
  LoadAsset "levels\zoo\G_PROLINE_CameraSuccess.ska" G_PROLINE_CameraSuccess
  LoadAsset "levels\zoo\G_GAP_CameraSuccess.ska" G_GAP_CameraSuccess
  LoadAsset "levels\zoo\G_RACE_CameraStart.ska" G_RACE_CameraStart
  LoadAsset "levels\zoo\G_RACE_CameraSuccess.ska" G_RACE_CameraSuccess
  LoadAsset "levels\zoo\G_COLLECT_CameraSuccess.ska" G_COLLECT_CameraSuccess
  LoadAsset "levels\zoo\PROSET4_VIEWCAM.ska" PROSET4_VIEWCAM
  LoadAsset "levels\zoo\PROSET5_VIEWCAM.ska" PROSET5_VIEWCAM
  LoadAsset "levels\zoo\CAM_GORILLA.ska" CAM_GORILLA
  LoadAsset "levels\zoo\CAM_HIPPO.ska" CAM_HIPPO
  LoadAsset "levels\zoo\G_TETRIS_CameraStart.ska" G_TETRIS_CameraStart
  LoadAsset "levels\zoo\G_TETRIS_CameraSuccess.ska" G_TETRIS_CameraSuccess
  LoadAsset "levels\zoo\G_COLLECT_CameraStart.ska" G_COLLECT_CameraStart
  LoadAsset "levels\zoo\CAM_RHINO.ska" CAM_RHINO
  LoadAsset "levels\zoo\G_HORSE_CameraSuccess.ska" G_HORSE_CameraSuccess
  LoadAsset "levels\zoo\G_HORSE_CameraStart.ska" G_HORSE_CameraStart
  LoadAsset "levels\zoo\G_HighCombo2_CameraSuccess.ska" G_HighCombo2_CameraSuccess
  LoadAsset "levels\zoo\G_HighCombo2_CameraStart.ska" G_HighCombo2_CameraStart
  LoadAsset "levels\zoo\G_TS2_CameraStart.ska" G_TS2_CameraStart
  LoadAsset "levels\zoo\G_TS2_CameraSuccess.ska" G_TS2_CameraSuccess
  LoadAsset "levels\zoo\CAM_MG_Kaboom.ska" CAM_MG_Kaboom
  LoadAsset "levels\zoo\G_COMP_CameraStart.ska" G_COMP_CameraStart
  LoadAsset "levels\zoo\G_COMP_CameraSuccess.ska" G_COMP_CameraSuccess
  LoadAsset "levels\zoo\G_TS_CameraStart.ska" G_TS_CameraStart
  LoadAsset "levels\zoo\CAM_MG_Invaders.ska" CAM_MG_Invaders
  LoadAsset "levels\zoo\CAM_ELEPHANT.ska" CAM_ELEPHANT
  LoadAsset "levels\zoo\CAM_ELEPHANT2.ska" CAM_ELEPHANT2
  LoadAsset "levels\zoo\G_SPECIAL_CameraSuccess.ska" G_SPECIAL_CameraSuccess
  LoadAsset "levels\zoo\G_SPECIAL_CameraStart.ska" G_SPECIAL_CameraStart
  LoadAsset "levels\zoo\CAM_SNACKBAR.ska" CAM_SNACKBAR
  LoadAsset "levels\zoo\G_COUNTERCOMBO_CameraStart.ska" G_COUNTERCOMBO_CameraStart
  LoadAsset "levels\zoo\G_COUNTERCOMBO_CameraSuccess.ska" G_COUNTERCOMBO_CameraSuccess
  LoadAsset "levels\zoo\G_GAP2_CameraSuccess.ska" G_GAP2_CameraSuccess
  LoadAsset "levels\zoo\G_GAP2_CameraStart.ska" G_GAP2_CameraStart
  LoadAsset "levels\zoo\G_TS3_CameraSuccess.ska" G_TS3_CameraSuccess
  LoadAsset "levels\zoo\G_TS3_CameraStart.ska" G_TS3_CameraStart
  LoadAsset "levels\zoo\G_COLLECT2_CameraSuccess.ska" G_COLLECT2_CameraSuccess
  LoadAsset "levels\zoo\G_COLLECT2_CameraStart.ska" G_COLLECT2_CameraStart
  LoadAsset "levels\zoo\G_TS4_CameraSuccess.ska" G_TS4_CameraSuccess
  LoadAsset "levels\zoo\G_TS4_CameraStart.ska" G_TS4_CameraStart
  LoadAsset "levels\zoo\G_COUNTER_CameraMid.ska" G_COUNTER_CameraMid
  LoadAsset "levels\zoo\MapGuy_ViewCam.ska" MapGuy_ViewCam
endscript
script LoadObjectAnims
endscript
