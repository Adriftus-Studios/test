custom_food_honey_bun:
  material: bread
  debug: false
  display name: <&f>Honey Bun
  mechanisms:
    custom_model_data: 1
  type: item
  data:
    amount: 8
    saturation: 3
  recipes:
    1:
      hide_in_recipebook: false
      type: shaped
      output_quantity: 1
      input:
      - air|honey_bottle|air
      - wheat|wheat|wheat
      - air|air|air
    2:
      hide_in_recipebook: false
      type: shaped
      output_quantity: 1
      input:
      - air|honey_bottle|air
      - air|bread|air
      - air|air|air
    3:
      hide_in_recipebook: false
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - air|honey_bottle|air
      - air|bread|air
    4:
      hide_in_recipebook: false
      type: shaped
      output_quantity: 1
      input:
      - air|air|air
      - air|honey_bottle|air
      - wheat|wheat|wheat
