copper_shovel:
  type: item
  material: iron_shovel
  flags:
    custom_durability:
      max: 200
      current: 0
  mechanisms:
    custom_model_data: 1
  display name: <&f>Copper shovel
  recipes:
    1:
      type: shaped
      output_quantity: 1
      input:
      - air|copper_ingot|air
      - air|stick|air
      - air|stick|air

