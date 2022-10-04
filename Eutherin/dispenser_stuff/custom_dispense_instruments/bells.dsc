dispenser_instrument_Bell:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 1001
  display name: <&b>Bells
  flags:
    custom_dispense: note
    pitch: 0.5
    instrument: Bell
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
        - Gold_ingot|air|stick
        - Gold_block|air|Gold_block
        - Stick|air|Gold_ingot
  data:
    recipe_book_category: decor.instrument.bells

  lore:
  - <&6>Current Pitch<&co> <&e>F♯ <&6>(<&e>0.5<&6>)
