meta:
  id: w3_w3r
  file-extension: w3r
  endian: le
  bit-endian: le
  encoding: utf-8
  imports:
    - w3id
    - w3color
seq:
  - type: u4
    id: version

  - type: u4
    id: num_region

  - type: region
    id: region
    repeat: expr
    repeat-expr: num_region
types:
  region:
    seq:
      - type:
          switch-on: _root.version
          cases:
            0: rect_int
            1: rect_int
            _: rect_float
        id: rect

      - type: strz
        id: name

      - type: u4
        id: id

      - if: _root.version >= 3
        type: w3id
        id: weather_id

      - if: _root.version >= 4
        type: strz
        id: ambient_sound

      - if: _root.version >= 5
        type: w3color
        id: color

      - if: _root.version >= 7
        type: u4
        id: block_camera

      - if: _root.version >= 7
        type: u4
        id: alpha_tile_minimap_color

  rect_float:
    seq:
      - type: f4
        id: left

      - type: f4
        id: bottom

      - type: f4
        id: right

      - type: f4
        id: top
  rect_int:
    seq:
      - type: s4
        id: left

      - type: s4
        id: bottom

      - type: s4
        id: right

      - type: s4
        id: top
