custom_food_beanburrito:
  type: item
  debug: false
  material: apple
  display name: <&a>Bean Burrito
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 392
  recipes:
    1:
      type: shapeless
      input: cooking_tool_skillet|custom_crop_bean|custom_food_tortilla|custom_crop_rice|custom_food_cheese