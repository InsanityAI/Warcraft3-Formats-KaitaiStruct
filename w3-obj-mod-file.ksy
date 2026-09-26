meta:
  id: w3_obj_mod_file
  endian: le
  bit-endian: le
  encoding: utf-8
  imports:
    - w3id
params:
  - type: u1
    id: use_extended
seq:
  - type: u4
    id: version

  - type: objects_chunk
    id: default_objects_chunk

  - type: objects_chunk
    id: custom_objects_chunk
types:
  objects_chunk:
    seq:
      - type: u4
        id: num_object

      - type: obj
        id: object
        repeat: expr
        repeat-expr: num_object
  obj:
    seq:
      - type: w3id
        id: base_id

      - type: w3id
        id: new_id

      - type: num_set
        id: num_set

      - type: set
        id: set
        repeat: expr
        repeat-expr: num_set.count
  num_set:
    seq:
      - if: _root.version >= 3
        type: u4
        id: num_set
    instances:
      count:
        value: "_root.version >= 3 ? num_set : 1"
  set:
    seq:
      - if: _root.version >= 3
        type: u4
        id: set_flag

      - type: u4
        id: num_mod

      - type: mod
        id: mod
        repeat: expr
        repeat-expr: num_mod
  mod:
    seq:
      - type: w3id
        id: id

      - type: u4
        id: value_type
        enum: value_types

      - if: _root.use_extended != 0
        type: u4
        id: level_or_variation

      - if: _root.use_extended != 0
        type: u4
        id: data_pointer

      - type:
          switch-on: value_type
          cases:
            value_types::int: u4
            value_types::real: f4
            value_types::unreal: f4
            _: strz
        id: value

      - if: _root.version >= 1
        type: w3id
        id: end_token

enums:
  value_types:
    0: int
    1: real
    2: unreal
    3: string
