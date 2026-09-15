meta:
  id: w3_doo_units
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
  - id: file_id
    type: w3id
  - id: version
    type: u4
  - id: sub_version
    type: u4
    if: _root.version >= 5
  - id: num_unit
    type: u4
  - id: unit
    type: unit
    repeat: expr
    repeat-expr: num_unit
types:
  unit:
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
      - id: group_id
        type: u4
        if: _root.use_skin != 0
      - id: flags
        type: flags
        if: _root.version >= 6
      - id: owner_index
        type: u2
      - id: is_uprooted
        type: u4
      - id: life
        type: u4
      - id: mana
        type: u4
      - id: dropped_item_set_ptr
        type: u4
        if: _root.sub_version >= 11
      - id: num_dropped_item_set
        type: u4
      - id: dropped_item_set
        type: random_set
        repeat: expr
        repeat-expr: num_dropped_item_set
      - id: resources_amount
        type: u4
        if: _root.sub_version >= 2
      - id: target_aquisition
        type: f4
        if: _root.sub_version >= 3
      - id: hero_level
        type: u4
        if: _root.sub_version >= 5
      - id: hero_strength
        type: u4
        if: _root.sub_version >= 10
      - id: hero_agility
        type: u4
        if: _root.sub_version >= 10
      - id: hero_intelligence
        type: u4
        if: _root.sub_version >= 10
      - id: num_inventory_item
        type: u4
      - id: inventory_item
        type: inventory_item
        repeat: expr
        repeat-expr: num_inventory_item
      - id: num_ability_mod
        type: u4
      - id: ability_mod
        type: ability_mod
        repeat: expr
        repeat-expr: num_ability_mod
      - id: random
        type: random
      - id: color
        type: u4
        if: _root.sub_version >= 9
      - id: waygate
        type: u4
        if: _root.sub_version >= 9
      - id: unit_id
        type: u4
        if: _root.sub_version >= 4
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
  flags:
    seq:
      - id: in_unplayable_area
        type: b1
      - id: not_used_in_script
        type: b1
      - id: fixed_z
        type: b1
      - id: use_model_axes
        type: b1
      - id: rest
        type: b4
  inventory_item:
    seq:
      - id: slot
        type: u4
      - id: id
        type: w3id
  ability_mod:
    seq:
      - id: id
        type: w3id
      - id: autocast_active
        type: u4
        enum: autocast_active
      - id: level
        type: u4
  random:
    seq:
      # if subversion == 7
      #   random_set
      # else


      - id: random_type
        type: u4
      - id: value
        type:
          switch-on: random_type
          cases:
            0: random_building_item
            1: w3i_group
            2: random_set
  random_building_item:
    seq:
      - id: level
        type: b24
      - id: item_class
        type: u1
  w3i_group:
    seq:
      - id: index
        type: u4
      - id: column_index
        type: u4
  random_set:
    seq:
      - id: num_objects
        type: u4
      - id: random_objects
        type: random_object
        repeat: expr
        repeat-expr: num_objects
  random_object:
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
      - id: color
        type: w3color
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
enums:
  autocast_active:
    0: inactive
    1: active