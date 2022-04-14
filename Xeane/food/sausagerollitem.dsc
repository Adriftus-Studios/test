custom_food_sausageroll:
  type: item
  debug: false
  material: apple
  display name: <&a>Sausage Roll
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>14 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1119
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_food_sausage|custom_ingredient_doughitem|custom_crop_avocado/custom_crop_banana