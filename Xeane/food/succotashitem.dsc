custom_food_succotash:
  type: item
  debug: false
  material: apple
  display name: <&a>Succotash
  data:
    amount: 11
    saturation: 13
  lore:
  - <&e>Hunger: <&f>11 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>13 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1179
  recipes:
    1:
      type: shapeless
      input: cooking_tool_pot|custom_crop_bean|custom_crop_corn|custom_crop_onion|custom_crop_spiceleaf|custom_crop_tomato|custom_ingredient_butteritem