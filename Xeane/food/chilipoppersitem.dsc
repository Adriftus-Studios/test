custom_food_chilipoppers:
  type: item
  debug: false
  material: apple
  display name: <&a>Chili Poppers
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 524
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_chilipepper|custom_ingredient_batteritem|custom_food_cheese