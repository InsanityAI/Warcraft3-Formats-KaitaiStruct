meta:
  id: w3_w3i
  file-extension: w3i
  endian: le
  bit-endian: le
  encoding: utf-8
  imports:
    - w3id
    - w3color
seq:
  - type: u4
    id: version
    doc: The version of the format.

  - type: u4
    id: saves
    if: version >= 16
    doc: How many times the map was saved in the editor.

  - type: u4
    id: editor_version
    if: version >= 16
    doc: What version of the editor was used to make this file.

  - type: game_version
    id: game_version
    if: version >= 27
    doc: For what version of the game this file was made.

  - type: strz
    id: map_name_raw

  - type: strz
    id: author

  - type: strz
    id: description

  - type: strz
    id: recommended_players
    if: version >= 8

  - if: version <= 3
    type: unknown_v0_to_v3
    id: unknown_v0_to_v3

  - if: version > 3 and version <= 8
    type: unknown_v4_to_v8
    id: unknown_v4_to_v8

  - type: camera_bounds
    id: camera_bounds

  - if: version >= 14
    type: margins
    id: margins

  - if: version >= 1
    type: u4
    id: map_width

  - if: version >= 1
    type: u4
    id: map_height

  - if: version >= 2 and version <= 8
    type: u4
    id: unknown_v3_int1

  - if: version >= 2
    type: flags
    id: flags
    size: 4

  - if: version >= 8
    type: u1
    id: tileset
    enum: tileset

  - type: loading_screen
    id: loading_screen

  - if: version >= 17
    type: u4
    id: game_data_set
    enum: game_data_set

  - if: version <= 17
    type: strz
    id: unknown_path

  - if: version >= 13
    type: prologue_screen
    id: prologue_screen

  - if: version >= 19
    type: fog
    id: fog

  - if: version >= 21
    type: w3id
    id: global_weather_id

  - if: version >= 22
    type: strz
    id: sound_environment

  - if: version >= 23
    type: str
    id: light_environment
    size: 1

  - if: version >= 25
    type: w3color
    id: water_color

  - if: version >= 28
    type: u4
    id: script_language1

  - if: version >= 29
    type: graphics_modes
    id: supported_graphics_modes
    size: 4

  - if: version >= 30
    type: u4
    id: game_data_version
    enum: game_data_version

  - if: version >= 32
    type: u4
    id: default_cam_distance

  - if: version >= 32
    type: u4
    id: default_max_cam_distance

  - if: version >= 33
    type: u4
    id: default_min_cam_distance

  - if: version >= 34
    type: u4
    id: hd_water_min_opacity

  - if: version >= 34
    type: u4
    id: hd_water_max_opacity

  - if: version >= 34
    type: u4
    id: hd_water_reflectivity

  - if: version >= 34
    type: u4
    id: hd_water_emissivity

  - if: version >= 34
    type: u4
    id: hd_water_edge_softness

  - if: version >= 34
    type: u4
    id: hd_water_waves_vertex_displacement

  - if: version >= 34
    type: u4
    id: hd_water_waves_normal_map_strength

  - if: version >= 34
    type: w3color
    id: hd_water_color

  - if: version >= 35
    type: u4
    id: hd_water_envmap_reflectivity

  - if: version >= 38
    type: w3color
    id: alpha_tile_minimap_color

  - type: players_chunk
    id: players_chunk

  - type: forces_chunk
    id: forces_chunk

  - if: version >= 6
    type: upgrades_chunk
    id: upgrades_chunk

  - if: version >= 7
    type: techs_chunk
    id: techs_chunk

  - if: version >= 12
    type: random_unit_tables_chunk
    id: random_unit_tables_chunk

  - if: version >= 24
    type: random_item_tables_chunk
    id: random_item_tables_chunk

  - if: version == 26 or version == 27
    type: u4
    id: script_language2

types:
  point_2d:
    seq:
      - type: f4
        id: x

      - type: f4
        id: y

  game_version:
    seq:
      - type: u4
        id: major

      - type: u4
        id: minor

      - type: u4
        id: revision

      - type: u4
        id: build

  unknown_v0_to_v3:
    seq:
      - type: u1
        id: unknown_v0_byte1

      - type: f4
        id: unknown_v0_float1

  unknown_v4_to_v8:
    seq:
      - type: f4
        id: unknown_v4_float1

      - type: u1
        id: unknown_v4_byte1

      - type: f4
        id: unknown_v4_float2

      - type: f4
        id: unknown_v4_float3

      - type: f4
        id: unknown_v4_float4

      - type: u4
        id: unknown_v4_int1

  camera_bounds:
    seq:
      - type: point_2d
        id: camera_bound_bottom_left

      - type: point_2d
        id: camera_bound_top_right

      - type: point_2d
        id: camera_bound_top_left

      - type: point_2d
        id: camera_bound_bottom_right

  margins:
    seq:
      - type: s4
        id: left

      - type: s4
        id: right

      - type: s4
        id: bottom

      - type: s4
        id: top

  flags:
    seq:
      - type: b1
        id: hide_minimap_on_preview_screens

      - type: b1
        id: change_ally_priorities

      - type: b1
        id: melee

      - type: b1
        id: non_default_tileset_map_size_large_never_been_reduced_to_medium

      - type: b1
        id: unexplored_areas_partially_visible

      - type: b1
        id: fixed_player_parameters_for_custom_teams

      - type: b1
        id: use_custom_teams

      - type: b1
        id: use_custom_techs

      - type: b1
        id: use_custom_abilities

      - type: b1
        id: use_custom_upgrades

      - type: b1
        id: map_properties_menu_opened_at_least_once

      - type: b1
        id: show_water_waves_on_cliff_shores

      - type: b1
        id: show_water_waves_on_rolling_shores

      - type: b1
        id: use_terrain_fog

      - type: b1
        id: tft_required

      - type: b1
        id: use_item_classification_system

      - type: b1
        id: custom_water_tinting

      - type: b1
        id: use_accurate_probabilities_for_calculation

      - type: b1
        id: use_custom_ability_skin

      - type: b1
        id: disable_deny_icon

      - type: b1
        id: override_default_zoom_level

      - type: b1
        id: override_maximum_zoom_level

      - type: b1
        id: override_minimum_zoom_level

      - type: b1
        id: override_hd_water_color

      - type: b1
        id: alpha_tile_default_minimap_color

      - type: b1
        id: dynamic_minimap

  loading_screen:
    seq:
      - if: _root.version >= 17
        type: s4
        id: loading_screen_index

      - if: _root.version >= 37
        type: u4
        id: race_crest
        enum: player_hud

      - if: _root.version >= 10 and _root.version != 18 and _root.version != 19
        type: strz
        id: custom_loading_screen_path

      - if: _root.version >= 10
        type: strz
        id: loading_screen_text

      - if: _root.version >= 11
        type: strz
        id: loading_screen_title

      - if: _root.version >= 11
        type: strz
        id: loading_screen_subtitle
  prologue_screen:
    seq:
      - if: _root.version != 18 and _root.version != 19
        type: strz
        id: prologue_screen_path

      - type: strz
        id: prologue_screen_text

      - type: strz
        id: prologue_screen_title

      - type: strz
        id: prologue_screen_subtitle

  fog:
    seq:
      - type: u4
        id: fog_type
        enum: fog_type

      - type: f4
        id: fog_z_start

      - type: f4
        id: fog_z_end

      - type: f4
        id: fog_density

      - type: w3color
        id: fog_color

      - if: _root.version >= 36
        type: f4
        id: fog_height_start

      - if: _root.version >= 36
        type: f4
        id: fog_height_end

      - if: _root.version >= 36
        type: f4
        id: fog_linear_start

      - if: _root.version >= 36
        type: f4
        id: fog_linear_end

      - if: _root.version >= 39
        type: f4
        id: fog_max_opacity

      - if: _root.version >= 39
        type: u4
        id: draw_fog_over_sky

  graphics_modes:
    seq:
      - type: b1
        id: sd

      - type: b1
        id: hd

      - type: b1
        id: de

  players_chunk:
    seq:
      - type: u4
        id: num_player

      - type: player
        id: player
        repeat: expr
        repeat-expr: num_player

  player:
    seq:
      - type: u4
        id: num

      - type: u4
        id: controller
        enum: player_controller

      - type: u4
        id: race
        enum: player_race

      - if: _root.version >= 37
        type: u4
        id: hud
        enum: player_hud

      - type: u4
        id: fixed_position

      - type: strz
        id: name

      - type: point_2d
        id: position

      - if: _root.version >= 5
        type: player_bitmap
        id: ally_low_priority

      - if: _root.version >= 5
        type: player_bitmap
        id: ally_high_priority

      - if: _root.version >= 31
        type: player_bitmap
        id: enemy_low_priority

      - if: _root.version >= 31
        type: player_bitmap
        id: enemy_high_priority

  forces_chunk:
    seq:
      - type: u4
        id: num_force

      - type: force
        id: force
        repeat: expr
        repeat-expr: num_force
  force:
    seq:
      - type: force_flags
        id: flags
        size: 4

      - type: player_bitmap
        id: players

      - type: strz
        id: name

  force_flags:
    seq:
      - type: b1
        id: allied

      - type: b1
        id: allied_victory

      - type: b1
        id: share_vision

      - type: b1
        id: share_unit_control

      - type: b1
        id: share_advanced_unit_control

  player_bitmap:
    seq:
      - type: player_bitmap_bits
        id: bits
        size: 4

  player_bitmap_bits:
    seq:
      - type: b1
        id: is_member
        repeat: expr
        repeat-expr: 32

  upgrades_chunk:
    seq:
      - type: u4
        id: num_upgrade

      - type: upgrade
        id: upgrade
        repeat: expr
        repeat-expr: num_upgrade

  upgrade:
    seq:
      - type: u4
        id: players

      - type: w3id
        id: id

      - type: u4
        id: level

      - type: u4
        id: availability

  techs_chunk:
    seq:
      - type: u4
        id: num_tech

      - type: tech
        id: tech
        repeat: expr
        repeat-expr: num_tech

  tech:
    seq:
      - type: u4
        id: players

      - type: w3id
        id: id

  random_unit_tables_chunk:
    seq:
      - type: u4
        id: num_table

      - type: random_unit_table
        id: table
        repeat: expr
        repeat-expr: num_table

  random_unit_table:
    seq:
      - type: u4
        id: index

      - type: strz
        id: name

      - type: u4
        id: num_column_type

      - type: u4
        id: column_type
        enum: random_unit_table_column_type
        repeat: expr
        repeat-expr: num_column_type

      - type: u4
        id: num_row

      - type: random_unit_table_row
        id: row
        repeat: expr
        repeat-expr: num_row

  random_unit_table_row:
    seq:
      - type: u4
        id: chance

      - type: w3id
        id: id
        repeat: expr
        repeat-expr: _parent.num_column_type

  random_item_tables_chunk:
    seq:
      - type: u4
        id: num_table

      - type: random_item_table
        id: table
        repeat: expr
        repeat-expr: num_table

  random_item_table:
    seq:
      - type: u4
        id: num

      - type: strz
        id: name

      - type: u4
        id: num_set

      - type: item_set
        id: set
        repeat: expr
        repeat-expr: num_set

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
      - type: u4
        id: chance
        doc: Chance this item will be rolled.

      - type: w3id
        id: id
        doc: FourCC of the item, can be iRND for random item.

enums:
  tileset:
    0x41: ashenvale #A
    0x42: barrens #B
    0x43: felwood #C
    0x44: dungeon #D
    0x46: lordaeron_fall #F
    0x47: underground #G
    0x49: icecrown #I
    0x4a: dalaran_ruins #J
    0x4b: black_citadel #K
    0x4c: lordaeron_summer #L
    0x4e: northrend #N
    0x4f: outland #O
    0x50: cityscape_ruins #P
    0x51: village_fall #Q
    0x52: lordaeron_capital_ruins #R
    0x56: village #V
    0x57: lordaeron_winter #W
    0x58: dalaran #X
    0x59: cityscape #Y
    0x5a: sunken_ruins #Z
    0x65: lordaeron_capital #e
    0x75: undercity #u
  game_data_set:
    0: default
    1: custom
    2: melee
  fog_type:
    0: linear
    1: exp
    2: exp2
    3: height
    4: new_exp
    5: new_exp2
  script_language:
    0: jass
    1: lua
  game_data_version:
    0: roc
    1: tft
    2: fk
  player_controller:
    0: none
    1: human
    2: cpu
    3: neutral
    4: rescuable
  player_race:
    0: selectable
    1: human
    2: orc
    3: undead
    4: night_elf
  player_hud:
    64: selected_race
    1: human
    2: orc
    8: undead
    4: night_elf
    128: forsaken
  random_unit_table_column_type:
    0: unit_table
    1: building_table
    2: item_table
instances:
  script_language:
    value: "script_language2 ? script_language2 : script_language1"
    enum: script_language
