meta:
  id: w3_w3l
  file-extension: w3l
  endian: le
  encoding: UTF-8
  imports:
    - w3id
seq:
  - type: w3id
    id: file_id

  - type: u4
    id: version

  - type: strz
    id: unit_light_filename

  - type: strz
    id: terrain_light_filename

  - type: u4
    id: use_custom_unit_light

  - type: u4
    id: use_custom_terrain_light

  - type: u4
    id: use_custom_both_lights
  # this is only true if you initially went to Both and checked
  # "Enable Custom Light" options, if you did both unit and terrain individually, it's off