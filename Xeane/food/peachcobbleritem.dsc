custom_food_peachcobbler:
  type: item
  debug: false
  material: apple
  display name: <&a>Peach Cobbler
  data:
    amount: 9
    saturation: 11
  lore:
  - <&e>Hunger: <&f>9 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>11 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 978
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_peach|sugar|custom_ingredient_doughitem