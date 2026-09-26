meta:
  id: w3_w3e
  file-extension: w3e
  endian: le
  bit-endian: le
  imports:
    - w3id
seq:
  - type: w3id
    id: file_id

  - type: u4
    id: version

  - if: _root.version >= 7
    type: u1
    id: tileset
    enum: tileset

  - if: _root.version >= 7
    type: u4
    id: use_custom_tileset

  - type: u4
    id: num_tile_id

  - type: w3id
    id: tile_id
    repeat: expr
    repeat-expr: num_tile_id

  - type: u4
    id: num_cliff_tile_id

  - type: w3id
    id: cliff_tile_id
    repeat: expr
    repeat-expr: num_cliff_tile_id

  - type: u4
    id: map_width

  - type: u4
    id: map_height

  - if: _root.version >= 10
    type: f4
    id: center_offset_x

  - if: _root.version >= 10
    type: f4
    id: center_offset_y

  - if: _root.version >= 11
    type: tile_node_new
    id: tile_node_new
    repeat: expr
    repeat-expr: map_width * map_height

  - if: _root.version < 11
    type: tile_node_new
    id: tile_node_old
    repeat: expr
    repeat-expr: map_width * map_height

types:
  tile_node_old:
    seq:
      - type:
          switch-on: _root.version
          cases:
            10: u1
            _: u4
        id: cliff_texture

      - type:
          switch-on: _root.version
          cases:
            10: u1
            _: u4
        id: cliff_variation

      - if: _root.version < 8
        type: f4
        id: x_raw

      - if: _root.version < 8
        type: f4
        id: y_raw

      - if: _root.version < 8
        type: f4
        id: ground_height_f

      - if: _root.version >= 8
        type: s4
        id: ground_height_raw

      - if: _root.version >= 8
        type: s2
        id: water_height_raw

      - type: u1
        id: cliff_level

      - type: u1
        id: ground_texture

      - type: u1
        id: ground_variation

      - type: tile_flags
        id: flags
        size: '_root.version == 11 ? 1 : 4'

      - type: f4
        id: water_height_f

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
      - type: u2
        id: ground_height_raw

      - type: b14
        id: water_height_raw

      - type: b2
        id: is_edge_boundary

      - type:
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
        id: ground_texture

      - if: _root.version >= 12
        type: tile_flags
        id: flags

      - type: b5
        id: ground_variation

      - type: b3
        id: cliff_variation

      - type: b4
        id: cliff_level

      - type: b4
        id: cliff_texture

    instances:
      ground_height:
        value: (ground_height_raw - 8192 + cliff_level * 512) / 4
      water_height:
        value: (water_height_raw - 8192 + cliff_level * 512) / 4
  tile_flags:
    seq:
      - type: b1
        id: ramp

      - type: b1
        id: blight

      - type: b1
        id: water

      - type: b1
        id: boundary_2

      - if: _root.version >=12
        type: b6
        id: rest

enums:
  tileset:
    0x41: ashenvale #A
    0x42: barrens #B
    0x43: felwood #C
    0x44: dungeon #D
    0x46: lordaeron_fall #F
    0x47: underground #G
    0x49: icecrown #I
    0x4a: dalaran_ruins #J
    0x4b: black_citadel #K
    0x4c: lordaeron_summer #L
    0x4e: northrend #N
    0x4f: outland #O
    0x50: cityscape_ruins #P
    0x51: village_fall #Q
    0x52: lordaeron_capital_ruins #R
    0x56: village #V
    0x57: lordaeron_winter #W
    0x58: dalaran #X
    0x59: cityscape #Y
    0x5a: sunken_ruins #Z
    0x65: lordaeron_capital #e
    0x75: undercity #u
