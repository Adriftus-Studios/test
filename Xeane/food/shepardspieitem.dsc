custom_food_shepardspie:
  type: item
  debug: false
  material: apple
  display name: <&a>Shepard's Pie
  data:
    amount: 13
    saturation: 16
  lore:
  - <&e>Hunger: <&f>13 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>16 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1125
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|mutton|potato|carrot|custom_ingredient_doughitem|custom_crop_peas