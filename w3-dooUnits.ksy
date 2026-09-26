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
  - type: w3id
    id: file_id

  - type: u4
    id: version

  - if: _root.version >= 5
    type: u4
    id: sub_version

  - type: u4
    id: num_unit

  - type: unit
    id: unit
    repeat: expr
    repeat-expr: num_unit

types:
  unit:
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

      - type: f4
        id: scale_x

      - type: f4
        id: scale_y

      - type: f4
        id: scale_z

      - if: _root.use_skin != 0
        type: w3id
        id: skin_id

      - type: u4
        id: group_id

      - if: _root.version >= 6
        type: flags
        id: flags
        size: 1

      - type: u2
        id: owner_index

      - type: u4
        id: is_uprooted

      - type: u4
        id: life

      - type: u4
        id: mana

      - if: _root.sub_version >= 11
        type: u4
        id: dropped_item_set_ptr

      - type: u4
        id: num_dropped_item_set

      - type: random_set
        id: dropped_item_set
        repeat: expr
        repeat-expr: num_dropped_item_set
      - if: _root.sub_version >= 2
        type: u4
        id: resources_amount

      - if: _root.sub_version >= 3
        type: f4
        id: target_aquisition

      - if: _root.sub_version >= 5
        type: u4
        id: hero_level

      - if: _root.sub_version >= 10
        type: u4
        id: hero_strength

      - if: _root.sub_version >= 10
        type: u4
        id: hero_agility

      - if: _root.sub_version >= 10
        type: u4
        id: hero_intelligence

      - type: u4
        id: num_inventory_item

      - type: inventory_item
        id: inventory_item
        repeat: expr
        repeat-expr: num_inventory_item

      - type: u4
        id: num_ability_mod

      - type: ability_mod
        id: ability_mod
        repeat: expr
        repeat-expr: num_ability_mod

      - type: random
        id: random

      - if: _root.sub_version >= 9
        type: u4
        id: color

      - if: _root.sub_version >= 9
        type: u4
        id: waygate

      - if: _root.sub_version >= 4
        type: u4
        id: unit_id

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
        doc: units cannot be preplaced in border tiles, always 0

      - type: b1
        id: not_used_in_script
        doc: always true, this is primarily useful for game when reading .doo, not Units.doo, perhaps it should be called "ignore_doodad_during_doodad_spawning

      - type: b1
        id: fixed_z

      - type: b1
        id: use_model_axes

  inventory_item:
    seq:
      - type: u4
        id: slot

      - type: w3id
        id: id

  ability_mod:
    seq:
      - type: w3id
        id: id

      - type: u4
        id: autocast_active
        enum: autocast_active

      - type: u4
        id: level

  random:
    seq:
      - if: _root.sub_version == 7
        type: random_set
        id: old_random_building_item

      - if: _root.sub_version >= 8
        type: u4
        id: random_type

      - if: _root.sub_version >= 8
        type:
          switch-on: random_type
          cases:
            0: random_building_item
            1: w3i_group
            2: random_set
        id: new_random_value

    instances:
      value:
        value: >
          _root.sub_version == 7 ? 
          old_random_building_item : 
          new_random_value
  random_building_item:
    seq:
      - type: b24
        id: level

      - type: u1
        id: item_class

  w3i_group:
    seq:
      - type: u4
        id: index

      - type: u4
        id: column_index

  random_set:
    seq:
      - type: u4
        id: num_objects

      - type: random_object
        id: random_objects
        repeat: expr
        repeat-expr: num_objects

  random_object:
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

enums:
  autocast_active:
    0: inactive
    1: active
