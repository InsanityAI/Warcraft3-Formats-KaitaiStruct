meta:
  id: w3_wct
  file-extension: wct
  endian: le
  bit-endian: le
  encoding: utf-8
seq:
  - type: u4
    id: version

  - if: version >= 0x80000000
    type: u4
    id: subversion

  - if: version >= 1
    type: strz
    id: head_comment

  # new scripts

  - if: version >= 0x80000003
    type: trigger
    id: trigger_new
    repeat: eos
  
  # ancient scripts

  - if: version < 0x80000000
    type: u4
    id: trigger_ancient_count

  - if: version < 0x80000000
    type: trigger
    id: trigger_ancient
    repeat: expr
    repeat-expr: trigger_ancient_count

  # old scripts

  - if: version >= 0x80000000 and version < 0x80000003
    type: u4
    id: trigger_custom_script_old_count

  - if: version >= 0x80000000 and version < 0x80000003
    type: trigger
    id: trigger_custom_script_old
    repeat: expr
    repeat-expr: trigger_custom_script_old_count

  - if: version >= 0x80000000 and version < 0x80000003
    type: u4
    id: custom_script_old_count

  - if: version >= 0x80000000 and version < 0x80000003
    type: trigger
    id: custom_script_old
    repeat: expr
    repeat-expr: custom_script_old_count

  - if: version >= 0x80000000 and version < 0x80000002
    type: u4
    id: unknown_custom_script_old_count

  - if: version >= 0x80000000 and version < 0x80000002
    type: trigger
    id: unknown_custom_script_old
    repeat: expr
    repeat-expr: unknown_custom_script_old_count

types:
  trigger:
    seq:
      - type: u4
        id: length

      - type: str
        size: length
        id: content
