meta:
  id: w3_w3l
  file-extension: w3l
  endian: le
  imports:
    - w3id
seq:
  - id: file_id
    type: w3id
  - id: version
    type: u4
  - id: unit_light_filename
    type: strz
    encoding: UTF-8
  - id: terrain_light_filename
    type: strz
    encoding: UTF-8
  - id: use_custom_unit_light
    type: u4
  - id: use_custom_terrain_light
    type: u1
  - id: unknown2
    type: u1
  - id: unknown3
    type: u1
  - id: unknown4
    type: u1
  - id: use_custom_both_lights 
  # this is only true if you initially went to Both and checked
  # "Enable Custom Light" options, if you did both unit and terrain individually, it's off
    type: u4