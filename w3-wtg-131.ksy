meta:
  id: w3_wtg_131
  file-extension: wtg
  endian: le
  bit-endian: le
  encoding: utf-8
  imports:
    - w3id
seq:
  - type: w3id
    id: file_id
  - type: u4
    id: subversion
  - type: u4
    id: version
    
    # Headers
  - type: u4
    id: num_header
  - type: u4
    id: num_removed_header    
  - type: u4
    id: removed_header_ids
    repeat: expr
    repeat-expr: num_removed_header

    # Libraries
  - type: u4
    id: num_library
  - type: u4
    id: num_removed_library    
  - type: u4
    id: removed_library_ids
    repeat: expr
    repeat-expr: num_removed_library

    # Categories
  - type: u4
    id: num_category
  - type: u4
    id: num_removed_category
  - type: u4
    id: removed_category_ids
    repeat: expr
    repeat-expr: num_removed_category

    # Triggers
  - type: u4
    id: num_trig
  - type: u4
    id: num_removed_trig
  - type: u4
    id: removed_trig_ids
    repeat: expr
    repeat-expr: num_removed_trig

    # Comments
  - type: u4
    id: num_comment
  - type: u4
    id: num_removed_comment
  - type: u4
    id: removed_comment_ids
    repeat: expr
    repeat-expr: num_removed_comment

    # Scripts
  - type: u4
    id: num_script
  - type: u4
    id: num_removed_script
  - type: u4
    id: removed_script_ids
    repeat: expr
    repeat-expr: num_removed_script

    # Variables
  - type: u4
    id: num_var_element
  - type: u4
    id: num_removed_var
  - type: u4
    id: removed_var_ids
    repeat: expr
    repeat-expr: num_removed_var

    # Unknown element
  - type: u4
    id: num_unknown_element
  - type: u4
    id: num_removed_unknown_ele
  - type: u4
    id: removed_unknown_ele_ids
    repeat: expr
    repeat-expr: num_removed_unknown_ele

  - type: u4
    id: variable_format_version
  - type: u4
    id: num_existing_var
  - type: variable
    id: existing_var
    repeat: expr
    repeat-expr: num_existing_var

  - type: u4
    id: num_element
    doc: While technically can be substituted with a sum of previous element counts, this value is more accurate
  - type: element
    id: element
    repeat: expr
    repeat-expr: num_element
types:
  element:
    seq:
      - id: type
        type: u4
        enum: element_type

      - if: (type == element_type::header) or (type == element_type::library) or (type == element_type::category)
        type: container
        id: container

      - if: (type == element_type::trig)
        type: content
        id: content

      - id: var
        type: variable_element
        if: (type == element_type::var)
  container:
    seq:
      - type: u4
        id: id
        
      - type: strz
        id: name
        
      - if: _root.version >= 7
        type: u4
        id: is_comment
        
      - if: _root.subversion >= 0x80000000
        type: u4
        id: is_expanded
        
      - if: _root.subversion >= 0x80000000
        type: u4
        id: parent_id
  variable:
    seq:
      - type: strz
        id: name

      - type: strz
        id: type

      - type: u4
        id: is_user_defined

      - type: u4
        id: is_array

      - if: _root.variable_format_version >= 2
        type: u4
        id: array_size

      - if: _root.variable_format_version != 0
        type: u4
        id: is_initialized

      - type: strz
        id: initial_value

      - if: _root.subversion >= 0x80000000
        type: u4
        id: id

      - if: _root.subversion >= 0x80000000
        type: u4
        id: parent_id
  content:
    seq:
      - type: strz
        id: name
        
      - type: strz
        id: description

      - if: _root.version >= 5
        type: u4
        id: is_comment

      - if: _root.subversion >= 0x80000001
        id: id
        type: u4

      - type: u4
        id: is_enabled

      - type: u4
        id: is_custom_script
        
      - if: _root.version >= 2
        type: u4
        id: is_initially_off

      - if: _root.version >= 4
        type: u4
        id: run_on_init
        
      - type: u4
        id: parent_id
        
      - type: u4
        id: num_eca
        
      - type: eca
        id: eca
        repeat: expr
        repeat-expr: num_eca
  variable_element:
    seq:
      - type: u4
        id: id
        
      - type: strz
        id: name
        
      - id: parent_id
        type: u4
  eca:
    seq:
      - type: u4
        id: type
        enum: eca_type

      - type: strz
        id: name

      - if: _root.version >= 3
        type: u4
        id: is_enabled

      # kaitai problem section - unknown amount of parameters
        
      - id: param
        type: param
        repeat: expr
        repeat-expr: 0

      # kaitai problem section

      - if: _root.version >= 6
        type: u4
        id: eca_count
      - if: _root.version >= 6
        type: eca_wrapper
        id: statements
        repeat: expr
        repeat-expr: eca_count
        
  eca_wrapper: 
    seq:
      - type: u4
        id: type
        enum: eca_type
      
      - type: u4
        id: group_index
      
      - type: eca
        id: eca
  param:
    seq:
      - type: s4
        id: param_type
        enum: param_type
        
      - type: strz
        id: value
        
      - type: u4
        id: has_statement
        
      - if: has_statement != 0
        type: eca
        id: statement

      - type: u4
        id: is_array
        
      - if: is_array != 0
        type: param
        id: array_index
enums:
  element_type:
    1: header
    2: library
    4: category
    8: trig
    16: comment
    32: script
    64: var
  param_type:
    -1: invalid
    0: preset
    1: variable
    2: function
    3: string
  eca_type:
    0: event
    1: condition
    2: action
    3: call