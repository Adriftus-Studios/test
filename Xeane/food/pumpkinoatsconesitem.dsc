custom_food_pumpkinoatscones:
  type: item
  debug: false
  material: apple
  display name: <&a>Pumpkin Oat Scones
  data:
    amount: 10
    saturation: 12
  lore:
  - <&e>Hunger: <&f>10 <&chr[0000].font[adriftus:foods]>
  - <&e>Saturation: <&f>12 <&chr[0001].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1072
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_ingredient_flouritem|custom_crop_oats|pumpkin|custom_ingredient_butteritem