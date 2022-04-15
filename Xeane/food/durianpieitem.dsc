custom_food_durianpie:
  type: item
  debug: false
  material: apple
  display name: <&a>Durian Pie
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 624
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_durian|sugar|custom_ingredient_doughitem