custom_food_zucchinibake:
  type: item
  debug: false
  material: apple
  display name: <&a>Zucchini Bake
  data:
    amount: 17
    saturation: 20
  lore:
  - <&e>Hunger: <&f>17<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>20<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 1244
  recipes:
    1:
      type: shapeless
      input: cooking_tool_bakeware|custom_crop_zucchini|custom_crop_tomato|custom_food_toast|custom_crop_corn|custom_food_cheese