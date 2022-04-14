custom_food_tortillachips:
  type: item
  debug: false
  material: apple
  display name: <&a>Tortilla Chips
  data:
    amount: 8
    saturation: 10
  lore:
  - <&e>Hunger: <&f>8 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>10 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 171
  recipes:
    1:
      type: shapeless
      input: cooking_tool_cuttingboard|custom_food_tortilla|custom_ingredient_saltitem|custom_crop_lime