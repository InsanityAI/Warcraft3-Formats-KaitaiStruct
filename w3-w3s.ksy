meta:
  id: w3_w3s
  file-extension: w3s
  endian: le
  bit-endian: le
  encoding: utf-8
seq:
  - type: u4
    id: version

  - type: u4
    id: num_sound

  - type: sound
    id: sound
    repeat: expr
    repeat-expr: num_sound

types:
  sound:
    seq:
      - type: strz
        id: name
        doc: Variable name for scripts, Always prefixed with 'gg_snd_'

      - type: strz
        id: path
        doc: Filepath of the sound

      - type: strz
        id: eax
        doc: Effect dropdown value, must be either; DefaultEAXON, CombatSoundsEAX, KotoDrumsEAX, SpellsEAX, MissilesEAX, HeroAcksEAX, DoodadsEAX

      - type: flags
        id: flags
        size: 4

      - type: u4
        id: fade_in_rate
        doc: Default value 0

      - type: u4
        id: fade_out_rate
        doc: Default value 0

      - type: u4
        id: volume
        doc: Default value 0

      - type: f4
        id: pitch
        doc: Default value 1.0

      - type: f4
        id: pitch_variance
        doc: Default value UINTMAX as float

      - type: u4
        id: priority
        doc: Default value 10

      - type: s4
        id: channel
        doc: Default value -1

        enum: channel
      - type: f4
        id: min_distance
        doc: Default value UINTMAX as float

      - type: f4
        id: max_distance
        doc: Default value UINTMAX as float

      - type: f4
        id: cutoff_distance
        doc: Default value 10000.0

      - type: f4
        id: cone_inside
        doc: Default value UINTMAX as float

      - type: f4
        id: cone_outside
        doc: Default value UINTMAX as float

      - type: s4
        id: cone_outside_volume
        doc: Default value -1

      - type: f4
        id: cone_orientation_x
        doc: Default value UINTMAX as float

      - type: f4
        id: cone_orientation_y
        doc: Default value UINTMAX as float

      - type: f4
        id: cone_orientation_z
        doc: Default value UINTMAX as float

      - if: _root.version >= 2
        type: strz
        id: var_name
        doc: Same as name

      - if: _root. version >= 2
        type: strz
        id: internal_sound_name
        doc: Label SLK

      - if: _root.version >= 2
        type: strz
        id: sound_path
        doc: Same as path

      - if: _root.version >= 2
        type: s4
        id: dialogue_id
        doc: default value -1

      - if: _root.version >= 2
        type: strz
        id: production_comment
        doc: always empty

      - if: _root.version >= 2
        type: s4
        id: speaker_name_id
        doc: default value -1

      - if: _root.version >= 2
        type: strz
        id: listener_name
        doc: always empty

      - if: _root.version >= 2
        type: u4
        id: asset_flags
        doc: Unknown flags - unused, default value 0

      - if: _root.version >= 2
        type: strz
        id: speaker_unit_id
        doc: always empty, according to conversations.json, it should be a FourCC code, but it acts as a string

      - if: _root.version >= 2
        type: strz
        id: animation_label
        doc: always empty

      - if: _root.version >= 2
        type: strz
        id: animation_group
        doc: always empty

      - if: _root.version >= 2
        type: strz
        id: animation_set_filepath
        doc: always empty

      - if: _root.version >= 3
        type: u4
        id: animation_set_filepath_is_map_relative
        doc: default value 1

  flags:
    seq:
      - type: b1
        id: is_looping

      - type: b1
        id: is_3d

      - type: b1
        id: stop_when_out_of_range

      - type: b1
        id: is_music

      - type: b1
        id: is_imported

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
