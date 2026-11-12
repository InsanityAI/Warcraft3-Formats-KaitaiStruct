meta:
  id: w3_w3f
  file-extension: w3f
  endian: le
  bit-endian: le
  encoding: utf-8
  imports:
    - w3color
seq:
  - type: u4
    id: version

  - type: u4
    id: saves

  - type: u4
    id: editor_version

  - type: strz
    id: name

  - type: strz
    id: difficulty

  - type: strz
    id: author

  - type: strz
    id: description

  - type: flags
    size: 4
    id: campaign_flags

  - type: u4
    id: background_screen_index

  - type: strz
    id: background_screen_path

  - type: strz
    id: minimap_picture_path

  - type: u4
    id: ambient_sound_index

  - type: strz
    id: custom_ambient_sound_path

  - type: fog
    id: fog

  - type: u4
    id: cursor_race_index

  - type: u4
    id: num_map

  - type: w3_map
    id: map
    repeat: expr
    repeat-expr: num_map

  - type: u4
    id: num_map_order

  - type: w3_map_order
    id: map_order
    repeat: expr
    repeat-expr: num_map_order
types:
  fog:
    seq:
      - if: _root.version >= 1
        type: u4
        id: fog_type
        enum: fog_type
    
      - if: _root.version >= 1
        type: f4
        id: fog_z_start

      - if: _root.version >= 1
        type: f4
        id: fog_z_end

      - if: _root.version >= 1
        type: f4
        id: fog_density

      - if: _root.version >= 1
        type: w3color
        id: fog_color
  
      - if: _root.version >= 3
        type: u4
        id: unknown

      - if: _root.version >= 3
        type: f4
        id: fog_height_start

      - if: _root.version >= 3
        type: f4
        id: fog_height_end

      - if: _root.version >= 3
        type: f4
        id: fog_linear_start

      - if: _root.version >= 3
        type: f4
        id: fog_linear_end

      - if: _root.version >= 3
        type: f4
        id: fog_max_opacity

      - if: _root.version >= 3
        type: u4
        id: draw_fog_over_sky
    enums:
      fog_type:
        0: linear
        1: exp
        2: exp2
        3: height
        4: new_exp
        5: new_exp2
  flags:
    seq:
      - type: b1
        id: is_variable_difficulty

      - type: b1
        id: is_expansion
  map_flags:
    seq:
      - type: b1
        id: is_visible
      - type: b1
        id: is_cinematic
  w3_map:
    seq:
      - type: map_flags
        size: 4
        id: visibility

      - type: strz
        id: chapter_title

      - type: strz
        id: map_title

      - type: strz
        id: path
  w3_map_order:
    seq:
      - type: u1
        id: padding
        doc: 'Always 0'

      - type: strz
        id: path