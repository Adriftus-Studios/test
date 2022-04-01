compressed_cobblestone:
  type: item
  material: cobblestone
  display name: <&f>Compressed Cobblestone
  lore:
    - "<&7>9 Cobblestone"
  data:
    recipe_book_category: blocks
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shapeless
      input: double_compressed_cobblestone
      quantity: 9
    2:
      type: shaped
      input:
      - cobblestone|cobblestone|cobblestone
      - cobblestone|cobblestone|cobblestone
      - cobblestone|cobblestone|cobblestone

double_compressed_cobblestone:
  type: item
  material: cobblestone
  display name: <&f>Double Compressed Cobblestone
  lore:
    - "<&7>81 Cobblestone"
  data:
    recipe_book_category: blocks
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shapeless
      input: triple_compressed_cobblestone
      quantity: 9
    2:
      type: shaped
      input:
      - compressed_cobblestone|compressed_cobblestone|compressed_cobblestone
      - compressed_cobblestone|compressed_cobblestone|compressed_cobblestone
      - compressed_cobblestone|compressed_cobblestone|compressed_cobblestone

triple_compressed_cobblestone:
  type: item
  material: cobblestone
  display name: <&f>Triple Compressed Cobblestone
  lore:
    - "<&7>729 Cobblestone"
  data:
    recipe_book_category: blocks
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shapeless
      input: quadruple_compressed_cobblestone
      quantity: 9
    2:
      type: shaped
      input:
      - double_compressed_cobblestone|double_compressed_cobblestone|double_compressed_cobblestone
      - double_compressed_cobblestone|double_compressed_cobblestone|double_compressed_cobblestone
      - double_compressed_cobblestone|double_compressed_cobblestone|double_compressed_cobblestone

quadruple_compressed_cobblestone:
  type: item
  material: cobblestone
  display name: <&f>Quadruple Compressed Cobblestone
  lore:
    - "<&7>6561 Cobblestone"
  data:
    recipe_book_category: blocks
  flags:
    right_click_script: cancel
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_cobblestone|triple_compressed_cobblestone|triple_compressed_cobblestone
      - triple_compressed_cobblestone|triple_compressed_cobblestone|triple_compressed_cobblestone
      - triple_compressed_cobblestone|triple_compressed_cobblestone|triple_compressed_cobblestone