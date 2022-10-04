dispenser_instrument_Bass:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 1006
  display name: <&b>Bass
  flags:
    custom_dispense: note
    pitch: 0.5
    instrument: Bass
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
        - oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/crimson_planks/warped_planks|air|air
        - Air|stick|air
        - oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/crimson_planks/warped_planks|string|oak_planks/spruce_planks/birch_planks/jungle_planks/acacia_planks/dark_oak_planks/crimson_planks/warped_planks
  data:
    recipe_book_category: decor.instrument.bass
  lore:
  - <&6>Current Pitch<&co> <&e>F♯ <&6>(<&e>0.5<&6>)
