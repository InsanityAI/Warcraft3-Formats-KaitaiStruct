meta:
  id: w3_w3e
  file-extension: w3e
  endian: le
  bit-endian: le
  imports:
    - w3id
seq:
  - id: file_id
    type: w3id
  - id: version
    type: u4
  - id: tileset
    type: u1
    enum: tileset
    if: _root.version >= 7
  - id: use_custom_tileset
    type: u4
    if: _root.version >= 7
  - id: num_tile_id
    type: u4
  - id: tile_id
    type: w3id
    repeat: expr
    repeat-expr: num_tile_id
  - id: num_cliff_tile_id
    type: u4
  - id: cliff_tile_id
    type: w3id
    repeat: expr
    repeat-expr: num_cliff_tile_id
  - id: map_width
    type: u4
  - id: map_height
    type: u4
  - id: center_offset_x
    type: f4
    if: _root.version >= 10
  - id: center_offset_y
    type: f4
    if: _root.version >= 10
  - id: tile_node_new
    type: tile_node_new
    repeat: expr
    repeat-expr: map_width * map_height
    if: _root.version >= 11
  - id: tile_node_old
    type: tile_node_new
    repeat: expr
    repeat-expr: map_width * map_height
    if: _root.version < 11
types:
  tile_node_old:
    seq:
      - id: cliff_texture
        type: 
          switch-on: _root.version
          cases:
            10: u1
            _: u4
      - id: cliff_variation
        type: 
          switch-on: _root.version
          cases:
            10: u1
            _: u4
      - id: x_raw
        type: f4
        if: _root.version < 8
      - id: y_raw
        type: f4
        if: _root.version < 8
      - id: ground_height_f
        type: f4
        if: _root.version < 8
      - id: ground_height_raw
        type: s4
        if: _root.version >= 8
      - id: water_height_raw
        type: s2
        if: _root.version >= 8
      - id: cliff_level
        type: u1
      - id: ground_texture
        type: u1
      - id: ground_variation
        type: u1
      - id: flags
        type: tile_flags
      - id: water_height_f
        type: f4
    instances:
      x: 
        value: 128 * (_index % _root.map_width) + _root.center_offset_x
      y:
        value: 128 * (_index / _root.map_width) + _root.center_offset_y
      ground_height:
        value: (ground_height_raw - 8192 + cliff_level * 512) / 4
      water_height:
        value: (water_height_raw - 8192 + cliff_level * 512) / 4
  tile_node_new:
    seq:
      - id: ground_height_raw
        type: u2
      - id: water_height_raw
        type: b14
      - id: is_edge_boundary
        type: b2
      - id: ground_texture
        type: 
          switch-on: _root.version
          cases:
            0: b4
            1: b4
            2: b4
            3: b4
            4: b4
            5: b4
            6: b4
            7: b4
            8: b4
            9: b4
            10: b4
            11: b4
            _: b6
      - id: flags
        type: tile_flags
        if: _root.version >= 12
      - id: ground_variation
        type: b5
      - id: cliff_variation
        type: b3
      - id: cliff_level
        type: b4
      - id: cliff_texture
        type: b4
    instances:
      ground_height:
        value: (ground_height_raw - 8192 + cliff_level * 512) / 4
      water_height:
        value: (water_height_raw - 8192 + cliff_level * 512) / 4
  tile_flags:
    seq:
      - id: ramp
        type: b1
      - id: blight
        type: b1
      - id: water
        type: b1
      - id: boundary_2
        type: b1
      - id: rest
        type: b6
        if: _root.version >=12
      - id: rest_old_b
        type: b4
        if: _root.version < 11
      - id: rest_old_old
        type: b24
        if: _root.version < 10
enums:
  tileset:
    0x41: ashenvale
    0x42: barrens
    0x43: felwood
    0x44: dungeon
    0x46: lordaeron_fall
    0x47: underground
    0x49: icecrown
    0x4a: dalaran_ruins
    0x4b: black_citadel
    0x4c: lordaeron_summer
    0x4e: northrend
    0x4f: outland
    0x50: cityscape_ruins
    0x51: village_fall
    0x52: lordaeron_capital_ruins
    0x56: village
    0x57: lordaeron_winter
    0x58: dalaran
    0x59: cityscape
    0x5a: sunken_ruins
    0x65: lordaeron_capital
    0x75: undercity