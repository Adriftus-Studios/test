custom_food_lasagna:
  type: item
  debug: false
  material: apple
  display name: <&a>Lasagna
  data:
    amount: 14
    saturation: 17
  lore:
  - <&e>Hunger: <&f>14 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>17 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 823
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_pastaitem|custom_food_cheese|custom_crop_tomato|custom_crop_onion|custom_crop_garlic