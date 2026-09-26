meta:
  id: w3_doo
  file-extension: doo
  endian: le
  bit-endian: le
  imports:
    - w3id
    - w3color
params:
  - id: use_skin
    type: u1
seq:
  - type: w3id
    id: file_id

  - type: u4
    id: version

  - if: version >= 5
    type: u4
    id: sub_version
    
  - type: u4
    id: num_doodad

  - type: doodad
    id: doodad
    repeat: expr
    repeat-expr: num_doodad

  - if: version >= 3
    type: u4
    id: special_doodad_version
    
  - if: version >= 3
    type: u4
    id: num_special_doodad
    
  - if: version >= 3
    type: special_doodad
    id: special_doodad
    repeat: expr
    repeat-expr: num_special_doodad
    
types:
  doodad:
    seq:
      - type: w3id
        id: id

      - type: u4
        id: variation

      - type: f4
        id: x

      - type: f4
        id: y

      - type: f4
        id: z

      - type: f4
        id: angle
        doc: in radians

      - type: f4
        id: scale_x

      - type: f4
        id: scale_y

      - type: f4
        id: scale_z

      - if: _root.use_skin != 0
        type: w3id
        id: skin_id

      - if: _root.version >= 13
        type: s4
        id: group_id

      - if: _root.version >= 6
        type: flags
        id: flags
        size: 1

      - type: u1
        id: life

      - if: _root.version >= 7
        type: s4
        id: random_item_set_ptr

      - if: _root.version >= 7
        type: u4
        id: num_item_set

      - type: item_set
        id: item_set
        repeat: expr
        repeat-expr: num_item_set

      - if: _root.version >= 13
        type: s4
        id: color

      - if: _root.version >= 4
        type: u4
        id: editor_id

      - if: _root.version >= 13
        type: f4
        id: roll

      - if: _root.version >= 13
        type: f4
        id: pitch

      - if: _root.version >= 13
        type: u4
        id: num_lights

      - if: _root.version >= 13
        type: light
        id: light
        repeat: expr
        repeat-expr: num_lights

  flags:
    seq:
      - type: b1
        id: in_unplayable_area

      - type: b1
        id: not_used_in_script

      - type: b1
        id: fixed_z

      - type: b1
        id: use_model_axes

  item_set:
    seq:
      - type: u4
        id: num_item

      - type: item
        id: item
        repeat: expr
        repeat-expr: num_item
  item:
    seq:
      - type: w3id
        id: id

      - type: u4
        id: chance

  light:
    seq:
      - type: u4
        id: index

      - type: u4
        id: is_shadow_casting

      - type: w3color
        id: color

      - type: f4
        id: intensity

      - type: f4
        id: shadow_casting_start

      - type: f4
        id: shadow_casting_end

      - type: f4
        id: quadratic_falloff

      - type: f4
        id: linear_falloff

      - type: f4
        id: damping

  special_doodad:
    seq:
      - type: w3id
        id: id

      - type: u4
        id: variation

      - type: u4
        id: x

      - type: u4
        id: y
