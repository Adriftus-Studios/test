custom_food_cheesytacotortillachips:
  type: item
  debug: false
  material: apple
  display name: <&a>Cheesy Taco Tortilla Chips
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>12<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 491
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_food_cornmeal|custom_ingredient_cookingoilitem|custom_food_cheese|custom_crop_spiceleaf