custom_food_juniperberrypie:
  type: item
  debug: false
  material: apple
  display name: <&a>Juniperberry Pie
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 804
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_juniperberry|sugar|custom_ingredient_doughitem