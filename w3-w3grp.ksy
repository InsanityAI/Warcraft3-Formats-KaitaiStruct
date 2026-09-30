meta:
  id: w3_w3grp
  file-extension: w3grp
  endian: le
  bit-endian: le
  encoding: utf-8
seq:
  - type: u4
    id: version
  - type: chunk
    id: chunk1
  - type: chunk
    id: chunk2

types:
  chunk:
    seq:
      - type: u4
        id: group_count
      - type: group
        id: groups
        repeat: expr
        repeat-expr: group_count
  group:
    seq:
      - type: u4
        id: group_id
      - type: strz
        id: group_name
