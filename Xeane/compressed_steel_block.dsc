uncompressed_steel_block:
  type: item
  material: feather
  recipes:
    1:
      type: shapeless
      input: compressed_steel_block
      output_quantity: 9

steel_block:
  type: item
  material: feather
  display name: <&r>Steel Block
  mechanisms:
    custom_model_data: 2000
  data:
    recipe_book_category: blocks.steel_block1
  recipes:
    1:
      type: shaped
      input:
        - steel_ingot|steel_ingot|steel_ingot
        - steel_ingot|steel_ingot|steel_ingot
        - steel_ingot|steel_ingot|steel_ingot

compressed_steel_block:
  type: item
  material: feather
  display name: <&f>Compressed Steel Block
  mechanisms:
    custom_model_data: 2000
    hides: ENCHANTS
  enchantments:
  - sharpness:1
  lore:
    - "<&7>9 Steel Block"
  data:
    recipe_book_category: blocks.steel_block1
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shapeless
      input: double_compressed_steel_block
      output_quantity: 9
    2:
      type: shaped
      input:
      - steel_block|steel_block|steel_block
      - steel_block|steel_block|steel_block
      - steel_block|steel_block|steel_block

double_compressed_steel_block:
  type: item
  material: feather
  display name: <&f>Double Compressed Steel Block
  mechanisms:
    custom_model_data: 2000
    hides: ENCHANTS
  enchantments:
  - sharpness:2
  lore:
    - "<&7>81 Steel Blocks"
  data:
    recipe_book_category: blocks.steel_block2
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shapeless
      input: triple_compressed_steel_block
      output_quantity: 9
    2:
      type: shaped
      input:
      - compressed_steel_block|compressed_steel_block|compressed_steel_block
      - compressed_steel_block|compressed_steel_block|compressed_steel_block
      - compressed_steel_block|compressed_steel_block|compressed_steel_block

triple_compressed_steel_block:
  type: item
  material: feather
  display name: <&f>Triple Compressed Steel Block
  mechanisms:
    custom_model_data: 2000
    hides: ENCHANTS
  enchantments:
  - sharpness:3
  lore:
    - "<&7>729 Steel Blocks"
  data:
    recipe_book_category: blocks.steel_block3
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shapeless
      input: quadruple_compressed_steel_block
      output_quantity: 9
    2:
      type: shaped
      input:
      - double_compressed_steel_block|double_compressed_steel_block|double_compressed_steel_block
      - double_compressed_steel_block|double_compressed_steel_block|double_compressed_steel_block
      - double_compressed_steel_block|double_compressed_steel_block|double_compressed_steel_block

quadruple_compressed_steel_block:
  type: item
  material: feather
  display name: <&f>Quadruple Compressed Steel Block
  mechanisms:
    custom_model_data: 2000
    hides: ENCHANTS
  enchantments:
  - sharpness:4
  lore:
    - "<&7>6561 Steel Blocks"
  data:
    recipe_book_category: blocks.steel_block4
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_steel_block|triple_compressed_steel_block|triple_compressed_steel_block
      - triple_compressed_steel_block|triple_compressed_steel_block|triple_compressed_steel_block
      - triple_compressed_steel_block|triple_compressed_steel_block|triple_compressed_steel_block