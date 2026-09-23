meta:
  id: w3_w3c
  file-extension: w3c
  endian: le
  bit-endian: le
  encoding: utf-8
params:
  - id: is_1_32_plus
    type: u1
seq:
  - id: version
    type: u4
  - id: num_camera
    type: u4
  - id: camera
    type: camera
    repeat: expr
    repeat-expr: num_camera
types:
  camera:
    seq:
      - id: target_x
        type: f4
      - id: target_y
        type: f4
      - id: target_z
        type: f4
      - id: angle
        type: f4
      - id: angle_of_attack
        type: f4
      - id: distance
        type: f4
      - id: roll
        type: f4
      - id: field_of_view
        type: f4
      - id: far_clipping
        type: f4
      - id: near_clipping
        type: f4
      - id: local_pitch
        type: f4
        if: _root.is_1_32_plus != 0
      - id: local_yaw
        type: f4
        if: _root.is_1_32_plus != 0
      - id: local_roll
        type: f4
        if: _root.is_1_32_plus != 0
      - id: dof_distance
        type: f4
        if: _root.version >= 3
      - id: dof_scale
        type: f4
        if: _root.version >= 3
      - id: pos_absolute_z
        type: f4
        if: _root.version >= 3
      - id: name
        type: strz
      - id: free_camera
        type: u4
        if: _root.version >= 3