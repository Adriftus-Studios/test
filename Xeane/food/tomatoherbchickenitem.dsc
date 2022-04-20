custom_food_tomatoherbchicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Tomato Herb Chicken
  data:
    amount: 7
    saturation: 8
  lore:
  - <&e>Hunger: <&f>7<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>8<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1223
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|chicken|custom_crop_tomato|custom_crop_spiceleaf