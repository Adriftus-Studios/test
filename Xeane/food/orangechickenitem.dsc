custom_food_orangechicken:
  type: item
  debug: false
  material: apple
  display name: <&a>Orange Chicken
  data:
    amount: 12
    saturation: 14
  lore:
  - <&e>Hunger: <&f>12<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>14<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 936
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_orange|chicken|sugar|custom_crop_rice|custom_crop_broccoli