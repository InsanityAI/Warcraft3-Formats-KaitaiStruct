meta:
  id: w3_w3r
  file-extension: w3r
  endian: le
  imports:
    - w3id
    - w3str
    - w3color
seq:
  - id: version
    type: u4
  - id: num_region
    type: u4
  - id: region
    type: region
    repeat: expr
    repeat-expr: num_region
types:
  region:
    seq:
      - id: rect
        type: 
          switch-on: _root.version
          cases:
            0: rect_int
            1: rect_int
            _: rect_float
      - id: name
        type: w3str
      - id: id
        type: u4
      - id: weather_id
        type: w3id
        if: _root.version >= 3
      - id: ambient_sound
        type: w3str
        if: _root.version >= 4
      - id: color
        type: w3color
      - id: block_camera
        type: u4
        if: _root.version >= 7
      - id: alpha_tile_minimap_color
        type: u4
        if: _root.version >= 7
  rect_float:
    seq:
      - id: left
        type: f4
      - id: bottom
        type: f4
      - id: right
        type: f4
      - id: top
        type: f4
  rect_int:
    seq:
      - id: left
        type: s4
      - id: bottom
        type: s4
      - id: right
        type: s4
      - id: top
        type: s4