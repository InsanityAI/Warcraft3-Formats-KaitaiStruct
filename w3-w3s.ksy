meta:
  id: w3_w3s
  file-extension: w3s
  endian: le
  bit-endian: le
  encoding: utf-8
seq:
  - id: version
    type: u4
  - id: num_sound
    type: u4
  - id: sound
    type: sound
    repeat: expr
    repeat-expr: num_sound
types:
  sound:
    seq:
      - id: name
        type: strz
        doc: Variable name for scripts, Always prefixed with 'gg_snd_'
      - id: path
        type: strz 
        doc: Filepath of the sound
      - id: eax
        type: strz
        doc: Effect dropdown value, must be either; DefaultEAXON, CombatSoundsEAX, KotoDrumsEAX, SpellsEAX, MissilesEAX, HeroAcksEAX, DoodadsEAX
      - id: flags
        size: 4
        type: flags
      - id: fade_in_rate
        type: u4
        doc: Default value 0
      - id: fade_out_rate
        type: u4
        doc: Default value 0
      - id: volume
        type: u4
        doc: Default value 0
      - id: pitch
        type: f4
        doc: Default value 1.0
      - id: pitch_variance
        type: f4
        doc: Default value UINTMAX as float
      - id: priority
        type: u4
        doc: Default value 10
      - id: channel
        type: s4
        doc: Default value -1
        enum: channel
      - id: min_distance
        type: f4
        doc: Default value UINTMAX as float
      - id: max_distance
        type: f4
        doc: Default value UINTMAX as float
      - id: cutoff_distance
        type: f4
        doc: Default value 10000.0
      - id: cone_inside
        type: f4
        doc: Default value UINTMAX as float
      - id: cone_outside
        type: f4
        doc: Default value UINTMAX as float
      - id: cone_outside_volume
        type: s4
        doc: Default value -1
      - id: cone_orientation_x
        type: f4
        doc: Default value UINTMAX as float
      - id: cone_orientation_y
        type: f4
        doc: Default value UINTMAX as float
      - id: cone_orientation_z
        type: f4
        doc: Default value UINTMAX as float
      - id: var_name
        type: strz
        doc: Same as name
        if: _root.version >= 2
      - id: internal_sound_name
        type: strz
        doc: Label SLK
        if: _root. version >= 2
      - id: sound_path
        type: strz
        doc: Same as path
        if:  _root.version >= 2
      - id: dialogue_id
        type: s4
        doc: default value -1
        if:  _root.version >= 2
      - id: production_comment
        type: strz
        doc: always empty
        if:  _root.version >= 2
      - id: speaker_name_id
        type: s4
        doc: default value -1
        if:  _root.version >= 2
      - id: listener_name
        type: strz
        doc: always empty
        if:  _root.version >= 2
      - id: asset_flags
        type: u4
        doc: Unknown flags - unused, default value 0
        if:  _root.version >= 2
      - id: speaker_unit_id
        type: strz
        doc: always empty, according to conversations.json, it should be a FourCC code, but it acts as a string
        if:  _root.version >= 2
      - id: animation_label
        type: strz
        doc: always empty
        if:  _root.version >= 2
      - id: animation_group
        type: strz
        doc: always empty
        if:  _root.version >= 2
      - id: animation_set_filepath
        type: strz
        doc: always empty
        if:  _root.version >= 2
      - id: animation_set_filepath_is_map_relative
        type: u4
        doc: default value 1
        if:  _root.version >= 3
  flags:
    seq:
      - id: is_looping
        type: b1
      - id: is_3d
        type: b1
      - id: stop_when_out_of_range
        type: b1
      - id: is_music
        type: b1
      - id: is_imported
        type: b1
      - id: rest
        type: b3
enums:
  channel:
    -1: default # general
    0: general
    1: unit_selection
    2: unit_acknowledgement
    3: unit_movement
    4: unit_ready
    5: combat
    6: error
    7: music
    8: user_interface
    9: movement_looping
    10: ambient
    11: animation
    12: building
    13: birth
    14: fire
    15: legacy_midi
    16: cinematic_general
    17: cinematic_ambient
    18: cinematic_music
    19: cinematic_dialogue
    20: cinematic_sfx1
    21: cinematic_sfx2
    22: cinematic_sfx3