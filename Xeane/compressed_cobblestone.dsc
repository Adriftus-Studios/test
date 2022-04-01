compressed_cobblestone:
  type: item
  material: cobblestone
  display name: Compressed Cobblestone
  data:
    recipe_book_category: blocks
  recipes:
    1:
      type: shaped
      input:
      - cobblestone|cobblestone|cobblestone
      - cobblestone|cobblestone|cobblestone
      - cobblestone|cobblestone|cobblestone
    2:
      type: shapeless
      input: double_compressed_cobblestone
      quantity: 9

double_compressed_cobblestone:
  type: item
  material: cobblestone
  display name: Double Compressed Cobblestone
  data:
    recipe_book_category: blocks
  recipes:
    1:
      type: shaped
      input:
      - compressed_cobblestone|compressed_cobblestone|compressed_cobblestone
      - compressed_cobblestone|compressed_cobblestone|compressed_cobblestone
      - compressed_cobblestone|compressed_cobblestone|compressed_cobblestone
    2:
      type: shapeless
      input: triple_compressed_cobblestone
      quantity: 9

triple_compressed_cobblestone:
  type: item
  material: cobblestone
  display name: Triple Compressed Cobblestone
  data:
    recipe_book_category: blocks
  recipes:
    1:
      type: shaped
      input:
      - double_compressed_cobblestone|double_compressed_cobblestone|double_compressed_cobblestone
      - double_compressed_cobblestone|double_compressed_cobblestone|double_compressed_cobblestone
      - double_compressed_cobblestone|double_compressed_cobblestone|double_compressed_cobblestone
    2:
      type: shapeless
      input: quadruple_compressed_cobblestone
      quantity: 9

quadruple_compressed_cobblestone:
  type: item
  material: cobblestone
  display name: Quadruple Compressed Cobblestone
  data:
    recipe_book_category: blocks
  recipes:
    1:
      type: shaped
      input:
      - triple_compressed_cobblestone|triple_compressed_cobblestone|triple_compressed_cobblestone
      - triple_compressed_cobblestone|triple_compressed_cobblestone|triple_compressed_cobblestone
      - triple_compressed_cobblestone|triple_compressed_cobblestone|triple_compressed_cobblestone