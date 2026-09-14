meta:
  id: w3_doo
  file-extension: doo
  endian: le
  imports:
    - w3id
params:
  - id: use_skin
    type: u1
seq:
  - id: file_id
    type: w3id
  - id: version
    type: u4
  - id: sub_version
    type: u4
  - id: num_doodad
    type: u4
  - id: doodad
    type: doodad
    repeat: expr
    repeat-expr: num_doodad
  - id: special_doodad_version
    type: u4
  - id: num_special_doodad
    type: u4
  - id: special_doodad
    type: special_doodad
    repeat: expr
    repeat-expr: num_special_doodad
types:
  doodad:
    seq:
      - id: id
        type: w3id
      - id: variation
        type: u4
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
      - id: angle
        type: f4
      - id: scale_x
        type: f4
      - id: scale_y
        type: f4
      - id: scale_z
        type: f4
      - id: skin_id
        type: w3id
        if: _root.use_skin != 0
      - id: group_id
        type: u4
        if: _root.version >= 13
      - id: flags
        type: u1
      - id: life
        type: u1
      - id: random_item_set_ptr
        type: u4
        if: _root.version >= 8
      - id: num_item_set
        type: u4
        if: _root.version >= 8
      - id: item_set
        type: item_set
        repeat: expr
        repeat-expr: num_item_set
      - id: unknown
        type: u4
        if: _root.version >= 13
      - id: editor_id
        type: u4
        if: _root.version >= 8
      - id: roll
        type: f4
        if: _root.version >= 13
      - id: pitch
        type: f4
        if: _root.version >= 13
      - id: num_lights
        type: u4
        if: _root.version >= 13
      - id: light
        type: light
        repeat: expr
        repeat-expr: num_lights
        if: _root.version >= 13
  item_set:
    seq:
      - id: num_item
        type: u4
      - id: item
        type: item
        repeat: expr
        repeat-expr: num_item
  item:
    seq:
      - id: id
        type: w3id
      - id: chance
        type: u4
  light:
    seq:
      - id: index
        type: u4
      - id: is_shadow_casting
        type: u4
      - id: color_blue
        type: u1
      - id: color_green
        type: u1
      - id: color_red
        type: u1
      - id: color_alpha
        type: u1
      - id: intensity
        type: f4
      - id: shadow_casting_start
        type: f4
      - id: shadow_casting_end
        type: f4
      - id: quadratic_falloff
        type: f4
      - id: linear_falloff
        type: f4
      - id: damping
        type: f4
  special_doodad:
    seq:
      - id: id
        type: w3id
      - id: variation
        type: u4
      - id: x
        type: u4
      - id: y
        type: u4