dispenser_instrument_Cow_Bell:
  type: item
  material: feather
  mechanisms:
    custom_model_data: 1002
  display name: <&b>Cow Bell
  flags:
    custom_dispense: note
    pitch: 0.5
    instrument: Cow_Bell
  lore:
  - <&6>Current Pitch<&co> <&e>F♯ <&6>(<&e>0.5<&6>)
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
        - air|copper_block|air
        - copper_block|gold_ingot|copper_block
        - copper_block|gold_nugget|copper_block
  data:
    recipe_book_category: decor.instrument.cow_bell
