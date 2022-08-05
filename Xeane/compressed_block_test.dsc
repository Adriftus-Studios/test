compressed_clay:
  type: item
  material: clay
  display name: <&f>Compressed Clay
  mechanisms:
    hides: ENCHANTS
  enchantments:
  - sharpness:1
  lore:
    - "<&7>9 Clay"
  data:
    recipe_book_category: blocks.clay1
  flags:
    on_place: cancel
  recipes:
    1:
      type: shapeless
      input: double_compressed_clay
      output_quantity: 9
    2:
      type: shaped
      input:
      - clay|clay|clay
      - clay|clay|clay
      - clay|clay|clay