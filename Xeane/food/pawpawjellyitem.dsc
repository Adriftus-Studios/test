custom_food_pawpawjelly:
  type: item
  debug: false
  material: apple
  display name: <&a>Pawpaw Jelly
  data:
    amount: 6
    saturation: 7
  lore:
  - <&e>Hunger: <&f>6<&chr[0001].font[adriftus:foods]>
  - <&e>Saturation: <&f>7<&chr[0002].font[adriftus:foods]>
  mechanisms:
    custom_model_data: 232
  recipes:
    1:
      type: shapeless
      input: cooking_tool_saucepan|custom_crop_pawpaw|sugar