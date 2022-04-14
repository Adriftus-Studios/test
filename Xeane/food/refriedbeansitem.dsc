custom_food_refriedbeans:
  type: item
  debug: false
  material: apple
  display name: <&a>Refried Beans
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1103
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_bean|custom_crop_onion|custom_ingredient_butteritem