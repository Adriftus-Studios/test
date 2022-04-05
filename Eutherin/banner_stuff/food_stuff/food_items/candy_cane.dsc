custom_food_candy_cane:
  material: bread
  debug: false
  display name: <&f>Candy Cane
  mechanisms:
    custom_model_data: 2
  type: item
  data:
    amount: 3
    saturation: 2
  recipes:
    1:
      type: shapeless
      output_quantity: 1
      hide_in_recipebook: false
      input: sugar|sugar|sugar|snow_block|snow_block|wheat

candy_cane_event:
  type: world
  debug: false
  events:
    on player consumes custom_food_candy_cane:
      - cast SPEED amplifier:0 <player> duration:200t
