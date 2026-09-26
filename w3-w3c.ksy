meta:
  id: w3_w3c
  file-extension: w3c
  endian: le
  bit-endian: le
  encoding: utf-8
params:
  - type: u1
    id: is_1_32_plus
seq:
  - type: u4
    id: version

  - type: u4
    id: num_camera

  - type: camera
    id: camera
    repeat: expr
    repeat-expr: num_camera
types:
  camera:
    seq:
      - type: f4
        id: target_x

      - type: f4
        id: target_y

      - type: f4
        id: target_z

      - type: f4
        id: angle

      - type: f4
        id: angle_of_attack

      - type: f4
        id: distance

      - type: f4
        id: roll

      - type: f4
        id: field_of_view

      - type: f4
        id: far_clipping

      - type: f4
        id: near_clipping

      - if: _root.is_1_32_plus != 0
        type: f4
        id: local_pitch

      - if: _root.is_1_32_plus != 0
        type: f4
        id: local_yaw

      - if: _root.is_1_32_plus != 0
        type: f4
        id: local_roll

      - if: _root.version >= 3
        type: f4
        id: dof_distance

      - if: _root.version >= 3
        type: f4
        id: dof_scale

      - if: _root.version >= 3
        type: f4
        id: pos_absolute_z

      - type: strz
        id: name

      - if: _root.version >= 3
        type: u4
        id: free_camera
